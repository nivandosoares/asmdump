local function env_number(name, fallback)
    local value = os.getenv(name)
    if value == nil or value == "" then
        return fallback
    end

    local parsed = tonumber(value)
    if parsed == nil then
        return fallback
    end

    return parsed
end

local function trim(value)
    return tostring(value):match("^%s*(.-)%s*$")
end

local function parse_exec_point_env(name)
    local raw = os.getenv(name)
    if raw == nil or raw == "" then
        return {}
    end

    local points = {}
    local seen = {}
    for segment in raw:gmatch("[^,;]+") do
        local item = trim(segment)
        if item ~= "" then
            local label_raw, addr_raw = item:match("^([^=]+)=(.+)$")
            if addr_raw == nil then
                label_raw = nil
                addr_raw = item
            end

            addr_raw = trim(addr_raw):upper()
            local bank_raw, addr_hex = addr_raw:match("^(%x%x):(%x%x%x%x)$")
            if bank_raw ~= nil and addr_hex ~= nil then
                local bank = tonumber(bank_raw, 16)
                local addr = tonumber(addr_hex, 16)
                local linear = (bank * 0x10000) + addr
                if not seen[linear] then
                    seen[linear] = true
                    points[#points + 1] = {
                        id = label_raw ~= nil and trim(label_raw) or string.format("%02X:%04X", bank, addr),
                        bank = bank,
                        addr = addr,
                        linear = linear,
                        snes = string.format("%02X:%04X", bank, addr)
                    }
                end
            end
        end
    end

    table.sort(points, function(a, b)
        return a.linear < b.linear
    end)

    return points
end

local function json_escape(value)
    return tostring(value):gsub("\\", "\\\\"):gsub("\"", "\\\"")
end

local function encode_json_value(value, indent)
    local value_type = type(value)
    indent = indent or ""

    if value_type == "nil" then
        return "null"
    elseif value_type == "boolean" then
        return value and "true" or "false"
    elseif value_type == "number" then
        return tostring(value)
    elseif value_type == "string" then
        return "\"" .. json_escape(value) .. "\""
    elseif value_type == "table" then
        local is_array = true
        local max_index = 0
        for key, _ in pairs(value) do
            if type(key) ~= "number" or key < 1 or math.floor(key) ~= key then
                is_array = false
                break
            end
            if key > max_index then
                max_index = key
            end
        end

        if is_array then
            local parts = {}
            for index = 1, max_index do
                parts[#parts + 1] = encode_json_value(value[index], indent .. "  ")
            end
            return "[" .. table.concat(parts, ", ") .. "]"
        end

        local keys = {}
        for key, _ in pairs(value) do
            keys[#keys + 1] = tostring(key)
        end
        table.sort(keys)

        local lines = {"{"}
        for index = 1, #keys do
            local key = keys[index]
            local suffix = index == #keys and "" or ","
            lines[#lines + 1] = string.format(
                "%s  \"%s\": %s%s",
                indent,
                json_escape(key),
                encode_json_value(value[key], indent .. "  "),
                suffix
            )
        end
        lines[#lines + 1] = indent .. "}"
        return table.concat(lines, "\n")
    end

    return "\"" .. json_escape("<unsupported:" .. value_type .. ">") .. "\""
end

local function write_binary_file(path, data)
    local file = assert(io.open(path, "wb"))
    file:write(data)
    file:close()
end

local function write_text_file(path, data)
    local file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

local function read_u16(address)
    return emu.read16(address, emu.memType.snesDebug)
end

local function read_u8(address)
    return emu.read(address, emu.memType.snesDebug)
end

local function format_snes_ptr(bank, addr)
    return string.format("%02X:%04X", bank % 0x100, addr % 0x10000)
end

local function bytes_to_hex(bytes)
    local parts = {}
    for index = 1, #bytes do
        parts[#parts + 1] = string.format("%02x", bytes[index] % 0x100)
    end
    return table.concat(parts)
end

local function read_memory_bytes(start_address, memory_type, size)
    local bytes = {}
    for offset = 0, size - 1 do
        bytes[#bytes + 1] = emu.read(start_address + offset, memory_type)
    end
    return bytes
end

local function rolling_checksum_bytes(bytes)
    local checksum = 0
    for index = 1, #bytes do
        checksum = ((checksum * 131) + (bytes[index] % 0x100)) % 4294967296
    end
    return checksum
end

local function summarize_byte_region(bytes)
    local nonzero_count = 0
    local first_nonzero = nil
    local last_nonzero = nil

    for index = 1, #bytes do
        if bytes[index] ~= 0 then
            nonzero_count = nonzero_count + 1
            if first_nonzero == nil then
                first_nonzero = index - 1
            end
            last_nonzero = index - 1
        end
    end

    return {
        size = #bytes,
        checksum = rolling_checksum_bytes(bytes),
        nonzero_count = nonzero_count,
        first_nonzero = first_nonzero,
        last_nonzero = last_nonzero,
        hex = bytes_to_hex(bytes)
    }
end

local function compare_byte_regions(before_bytes, after_bytes, max_diffs)
    local changed_count = 0
    local first_changed_offset = nil
    local diffs = {}
    local length = math.max(#before_bytes, #after_bytes)
    local limit = max_diffs or 8

    for index = 1, length do
        local before_value = before_bytes[index] or 0
        local after_value = after_bytes[index] or 0
        if before_value ~= after_value then
            changed_count = changed_count + 1
            if first_changed_offset == nil then
                first_changed_offset = index - 1
            end
            if #diffs < limit then
                diffs[#diffs + 1] = {
                    offset = index - 1,
                    before = before_value,
                    after = after_value
                }
            end
        end
    end

    return {
        changed_bytes = changed_count,
        first_changed_offset = first_changed_offset,
        first_diffs = diffs,
        before_checksum = rolling_checksum_bytes(before_bytes),
        after_checksum = rolling_checksum_bytes(after_bytes)
    }
end

local function dump_memory_region(path, memory_type, size)
    local bytes = {}
    for address = 0, size - 1 do
        bytes[#bytes + 1] = string.char(emu.read(address, memory_type))
    end
    write_binary_file(path, table.concat(bytes))
end

local function filter_state_snapshot(snapshot)
    local filtered = {}
    for key, value in pairs(snapshot) do
        local lower_key = tostring(key):lower()
        if lower_key:sub(1, 4) == "ppu."
            or lower_key:sub(1, 14) == "dmacontroller."
            or lower_key:find("bg") ~= nil
            or lower_key:find("obj") ~= nil
            or lower_key:find("mode") ~= nil
            or lower_key:find("dma") ~= nil
            or lower_key:find("hdma") ~= nil
            or lower_key:find("mainscreen") ~= nil
            or lower_key:find("subscreen") ~= nil
            or lower_key:find("window") ~= nil
            or lower_key:find("color") ~= nil
            or lower_key:find("vram") ~= nil
            or lower_key:find("cgram") ~= nil
            or lower_key:find("oam") ~= nil
            or lower_key:find("mosaic") ~= nil
            or lower_key:find("scroll") ~= nil
            or lower_key:find("screen") ~= nil
            or lower_key:find("inidisp") ~= nil
            or lower_key:find("setini") ~= nil then
            filtered[key] = value
        end
    end
    return filtered
end

local function dump_ppu_snapshot(prefix, frame)
    dump_memory_region(prefix .. "_vram.bin", emu.memType.snesVideoRam, emu.getMemorySize(emu.memType.snesVideoRam))
    dump_memory_region(prefix .. "_cgram.bin", emu.memType.snesCgRam, emu.getMemorySize(emu.memType.snesCgRam))
    dump_memory_region(prefix .. "_oam.bin", emu.memType.snesSpriteRam, emu.getMemorySize(emu.memType.snesSpriteRam))
    local full_state = emu.getState()
    local filtered_state = filter_state_snapshot(full_state)
    filtered_state.frame = frame
    write_text_file(prefix .. "_ppu_state.json", encode_json_value(filtered_state, ""))
end

local function dump_wram_snapshot(prefix)
    dump_memory_region(prefix .. "_wram.bin", emu.memType.snesWorkRam, 0x2000)
end

local capture_region_specs = {
    {id = "dp_0000_005f", label = "Direct page core", memory_type = emu.memType.snesDebug, start_address = 0x000000, size = 0x60},
    {id = "wram_0200_020f", label = "Front-end selector tuple", memory_type = emu.memType.snesDebug, start_address = 0x7E0200, size = 0x10},
    {id = "wram_0400_044f", label = "Front-end phase loop window", memory_type = emu.memType.snesDebug, start_address = 0x7E0400, size = 0x50},
    {id = "wram_0600_06ff", label = "DMA descriptor ring", memory_type = emu.memType.snesDebug, start_address = 0x7E0600, size = 0x100},
    {id = "wram_0700_07ff", label = "OAM staging head", memory_type = emu.memType.snesDebug, start_address = 0x7E0700, size = 0x100},
    {id = "wram_0960_0973", label = "Input/NMI queue control", memory_type = emu.memType.snesDebug, start_address = 0x7E0960, size = 0x14},
    {id = "wram_11e0_11ff", label = "Gameplay actor/watch slice", memory_type = emu.memType.snesDebug, start_address = 0x7E11E0, size = 0x20},
    {id = "wram_1290_12af", label = "Crash counter neighborhood", memory_type = emu.memType.snesDebug, start_address = 0x7E1290, size = 0x20},
    {id = "wram_18e0_18ff", label = "Cars-left neighborhood", memory_type = emu.memType.snesDebug, start_address = 0x7E18E0, size = 0x20},
    {id = "wram_1c60_1cef", label = "Front-end selector bank", memory_type = emu.memType.snesDebug, start_address = 0x7E1C60, size = 0x90},
    {id = "wram_1d00_1d3f", label = "Front-end scratch / tile row state", memory_type = emu.memType.snesDebug, start_address = 0x7E1D00, size = 0x40},
    {id = "wram_1e00_1e5f", label = "Visible split / HDMA helper slice", memory_type = emu.memType.snesDebug, start_address = 0x7E1E00, size = 0x60}
}

local transition_watch_fields = {
    "main_callback_snes",
    "nmi_callback_snes",
    "irq_callback_snes",
    "pending_main_callback_snes",
    "pending_nmi_callback_snes",
    "selector_1c78",
    "selector_1c7a",
    "selector_1c7c",
    "selector_1c80",
    "selector_1ca8",
    "selector_1cac",
    "selector_1cae",
    "selector_1cca",
    "selector_1ccc",
    "selector_1cce",
    "selector_1cd0",
    "state_1c6a",
    "state_1c70",
    "state_1c76",
    "state_0202",
    "state_0204",
    "state_0206",
    "state_0208",
    "state_020a",
    "state_0440",
    "state_0442",
    "state_09a2",
    "state_09a8",
    "state_11f3",
    "state_129e",
    "state_18ee",
    "dp_0020",
    "dp_0022",
    "dp_0053",
    "dp_0054",
    "dp_0055",
    "dp_0056"
}

local input_mask = {
    B = 0x8000,
    Y = 0x4000,
    SELECT = 0x2000,
    START = 0x1000,
    UP = 0x0800,
    DOWN = 0x0400,
    LEFT = 0x0200,
    RIGHT = 0x0100,
    A = 0x0080,
    X = 0x0040,
    L = 0x0020,
    R = 0x0010
}

local config = {
    sample_every = env_number("TD2_LIVE_PROBE_SAMPLE_EVERY", 8),
    autosave_every = env_number("TD2_LIVE_PROBE_AUTOSAVE_EVERY", 600),
    auto_stop_frames = env_number("TD2_LIVE_PROBE_AUTO_STOP_FRAMES", 0),
    command_cooldown_frames = env_number("TD2_LIVE_PROBE_COMMAND_COOLDOWN_FRAMES", 20),
    exec_point_max_hits = env_number("TD2_LIVE_PROBE_EXEC_POINT_MAX_HITS", 512),
    write_point_max_hits = env_number("TD2_LIVE_PROBE_WRITE_POINT_MAX_HITS", 1024),
    trace_exec_points = parse_exec_point_env("TD2_LIVE_PROBE_TRACE_EXEC_POINTS"),
    trace_write_points = parse_exec_point_env("TD2_LIVE_PROBE_TRACE_WRITE_POINTS")
}

if config.sample_every <= 0 then
    config.sample_every = 1
end

if config.autosave_every <= 0 then
    config.autosave_every = 600
end

if config.command_cooldown_frames <= 0 then
    config.command_cooldown_frames = 20
end

if #config.trace_exec_points == 0 then
    config.trace_exec_points = parse_exec_point_env("front_bbcb=00:BBCB,front_bc0f=00:BC0F,game_902d=01:902D,game_9111=01:9111,game_9016=02:9016,irq_960d=01:960D,irq_96a0=01:96A0,emit_b101=02:B101,emit_b134=02:B134")
end

if #config.trace_write_points == 0 then
    config.trace_write_points = parse_exec_point_env("main_ptr=00:0038,irq_ptr=00:003E,dp_0020=00:0020,dp_0022=00:0022,dp_0053=00:0053,dp_0054=00:0054,state_09a2=7E:09A2,state_09a8=7E:09A8,state_11f3=7E:11F3,state_129e=7E:129E,state_18ee=7E:18EE,state_1c70=7E:1C70,state_1c76=7E:1C76")
end

local script_data_dir = emu.getScriptDataFolder()
local session_stamp = os.date("%Y%m%d_%H%M%S")
local output_prefix = os.getenv("TD2_LIVE_PROBE_OUTPUT_PREFIX") or (script_data_dir .. "/td2_live_play_probe_" .. session_stamp)

local state = {
    frame = 0,
    entries = {},
    transition_events = {},
    captures = {},
    command_events = {},
    exec_point_hits = {},
    exec_point_dropped_hits = 0,
    write_point_hits = {},
    write_point_dropped_hits = 0,
    last_snapshot = nil,
    last_command_frame = -9999,
    last_capture_artifact = nil,
    reference_artifact = nil,
    finished = false
}

local function snapshot_live_state()
    local active_main_callback_addr = read_u16(0x000038)
    local active_main_callback_bank = read_u8(0x00003A)
    local active_nmi_callback_addr = read_u16(0x00003B)
    local active_nmi_callback_bank = read_u8(0x00003D)
    local active_irq_callback_addr = read_u16(0x00003E)
    local active_irq_callback_bank = read_u8(0x000040)
    local pending_main_callback_addr = read_u16(0x7E096C)
    local pending_main_callback_bank = read_u8(0x7E096E)
    local pending_nmi_callback_addr = read_u16(0x7E096F)
    local pending_nmi_callback_bank = read_u8(0x7E0971)

    return {
        frame = state.frame,
        selector_1c78 = read_u16(0x7E1C78),
        selector_1c7a = read_u16(0x7E1C7A),
        selector_1c7c = read_u16(0x7E1C7C),
        selector_1c80 = read_u16(0x7E1C80),
        selector_1ca8 = read_u16(0x7E1CA8),
        selector_1cac = read_u16(0x7E1CAC),
        selector_1cae = read_u16(0x7E1CAE),
        selector_1cca = read_u16(0x7E1CCA),
        selector_1ccc = read_u16(0x7E1CCC),
        selector_1cce = read_u16(0x7E1CCE),
        selector_1cd0 = read_u16(0x7E1CD0),
        active_main_callback_addr = active_main_callback_addr,
        active_main_callback_bank = active_main_callback_bank,
        active_nmi_callback_addr = active_nmi_callback_addr,
        active_nmi_callback_bank = active_nmi_callback_bank,
        active_irq_callback_addr = active_irq_callback_addr,
        active_irq_callback_bank = active_irq_callback_bank,
        main_callback_snes = format_snes_ptr(active_main_callback_bank, active_main_callback_addr),
        nmi_callback_snes = format_snes_ptr(active_nmi_callback_bank, active_nmi_callback_addr),
        irq_callback_snes = format_snes_ptr(active_irq_callback_bank, active_irq_callback_addr),
        pending_main_callback_addr = pending_main_callback_addr,
        pending_main_callback_bank = pending_main_callback_bank,
        pending_main_callback_snes = format_snes_ptr(pending_main_callback_bank, pending_main_callback_addr),
        pending_nmi_callback_addr = pending_nmi_callback_addr,
        pending_nmi_callback_bank = pending_nmi_callback_bank,
        pending_nmi_callback_snes = format_snes_ptr(pending_nmi_callback_bank, pending_nmi_callback_addr),
        state_0960 = read_u16(0x7E0960),
        state_0962 = read_u16(0x7E0962),
        state_0964 = read_u16(0x7E0964),
        state_0968 = read_u8(0x7E0968),
        state_096a = read_u8(0x7E096A),
        state_0972 = read_u16(0x7E0972),
        state_09a2 = read_u16(0x7E09A2),
        state_09a8 = read_u16(0x7E09A8),
        state_11f3 = read_u16(0x7E11F3),
        state_129e = read_u16(0x7E129E),
        state_18ee = read_u16(0x7E18EE),
        state_1c6a = read_u16(0x7E1C6A),
        state_1c70 = read_u16(0x7E1C70),
        state_1c76 = read_u16(0x7E1C76),
        state_0202 = read_u16(0x7E0202),
        state_0204 = read_u16(0x7E0204),
        state_0206 = read_u16(0x7E0206),
        state_0208 = read_u16(0x7E0208),
        state_020a = read_u16(0x7E020A),
        state_0440 = read_u16(0x7E0440),
        state_0442 = read_u16(0x7E0442),
        dp_0020 = read_u16(0x000020),
        dp_0022 = read_u16(0x000022),
        dp_0053 = read_u8(0x000053),
        dp_0054 = read_u8(0x000054),
        dp_0055 = read_u16(0x000055),
        dp_0056 = read_u8(0x000056),
        oam_0730 = read_u16(0x7E0730)
    }
end

local function read_dma_queue_summary(read_ptr, write_ptr)
    local nonzero_entries = {}
    local active_entries = {}
    local entries_by_slot = {}

    for slot = 0, 31 do
        local offset = slot * 8
        local raw = {}
        local any_nonzero = false
        for byte_offset = 0, 7 do
            local value = read_u8(0x7E0600 + offset + byte_offset)
            raw[#raw + 1] = value
            if value ~= 0 then
                any_nonzero = true
            end
        end

        if any_nonzero then
            local entry = {
                slot = slot,
                offset = offset,
                command = raw[1],
                source_addr = raw[2] + (raw[3] * 0x100) + (raw[4] * 0x10000),
                transfer_size = raw[5] + (raw[6] * 0x100),
                vram_dest = raw[7] + (raw[8] * 0x100),
                bytes_hex = bytes_to_hex(raw)
            }
            nonzero_entries[#nonzero_entries + 1] = entry
            entries_by_slot[slot] = entry
        end
    end

    local descriptor_count = 0
    if type(read_ptr) == "number" and type(write_ptr) == "number" then
        local offset = read_ptr % 0x100
        local target = write_ptr % 0x100
        local guard = 0
        while offset ~= target and guard < 32 do
            local slot = math.floor(offset / 8) % 32
            local entry = entries_by_slot[slot]
            if entry ~= nil then
                active_entries[#active_entries + 1] = entry
            end
            descriptor_count = descriptor_count + 1
            offset = (offset + 8) % 0x100
            guard = guard + 1
        end
    end

    return {
        nonzero_entry_count = #nonzero_entries,
        nonzero_entries = nonzero_entries,
        active_descriptor_count = descriptor_count,
        active_entries = active_entries
    }
end

local function capture_ppu_summary()
    local snapshot = emu.getState()
    return {
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_screen_layers = snapshot["ppu.mainScreenLayers"],
        sub_screen_layers = snapshot["ppu.subScreenLayers"],
        screen_brightness = snapshot["ppu.screenBrightness"],
        vram_address = snapshot["ppu.vramAddress"],
        cgram_address = snapshot["ppu.cgramAddress"],
        oam_base_address = snapshot["ppu.oamBaseAddress"],
        mode7 = {
            hscroll = snapshot["ppu.mode7.hscroll"],
            vscroll = snapshot["ppu.mode7.vscroll"],
            center_x = snapshot["ppu.mode7.centerX"],
            center_y = snapshot["ppu.mode7.centerY"],
            large_map = snapshot["ppu.mode7.largeMap"],
            matrix = {
                snapshot["ppu.mode7.matrix[0]"],
                snapshot["ppu.mode7.matrix[1]"],
                snapshot["ppu.mode7.matrix[2]"],
                snapshot["ppu.mode7.matrix[3]"]
            }
        }
    }
end

local function capture_region_payloads()
    local regions = {}
    local internal = {}

    for _, spec in ipairs(capture_region_specs) do
        local bytes = read_memory_bytes(spec.start_address, spec.memory_type, spec.size)
        internal[spec.id] = bytes
        local summary = summarize_byte_region(bytes)
        summary.label = spec.label
        summary.start_snes = format_snes_ptr(math.floor(spec.start_address / 0x10000), spec.start_address % 0x10000)
        regions[spec.id] = summary
    end

    return regions, internal
end

local function capture_ppu_memory_payloads()
    local vram_bytes = read_memory_bytes(0, emu.memType.snesVideoRam, emu.getMemorySize(emu.memType.snesVideoRam))
    local cgram_bytes = read_memory_bytes(0, emu.memType.snesCgRam, emu.getMemorySize(emu.memType.snesCgRam))
    local oam_bytes = read_memory_bytes(0, emu.memType.snesSpriteRam, emu.getMemorySize(emu.memType.snesSpriteRam))

    return {
        vram = vram_bytes,
        cgram = cgram_bytes,
        oam = oam_bytes
    }, {
        vram = {size = #vram_bytes, checksum = rolling_checksum_bytes(vram_bytes)},
        cgram = {size = #cgram_bytes, checksum = rolling_checksum_bytes(cgram_bytes)},
        oam = {size = #oam_bytes, checksum = rolling_checksum_bytes(oam_bytes)}
    }
end

local function compare_capture_state_fields(before_snapshot, after_snapshot)
    local changes = {}
    for _, field in ipairs(transition_watch_fields) do
        if before_snapshot[field] ~= after_snapshot[field] then
            changes[#changes + 1] = {
                field = field,
                before = before_snapshot[field],
                after = after_snapshot[field]
            }
        end
    end
    return changes
end

local function build_compare_payload(before_artifact, after_artifact)
    if before_artifact == nil or after_artifact == nil then
        return nil
    end

    local region_diffs = {}
    for _, spec in ipairs(capture_region_specs) do
        region_diffs[spec.id] = compare_byte_regions(
            before_artifact._internal.regions[spec.id],
            after_artifact._internal.regions[spec.id],
            8
        )
    end

    return {
        before_frame = before_artifact.frame,
        after_frame = after_artifact.frame,
        frame_delta = after_artifact.frame - before_artifact.frame,
        state_changes = compare_capture_state_fields(before_artifact.state, after_artifact.state),
        queue_transition = {
            before_read = before_artifact.state.dp_0053,
            before_write = before_artifact.state.dp_0054,
            after_read = after_artifact.state.dp_0053,
            after_write = after_artifact.state.dp_0054,
            before_active_descriptors = before_artifact.queue.active_descriptor_count,
            after_active_descriptors = after_artifact.queue.active_descriptor_count
        },
        region_diffs = region_diffs,
        ppu_memory_diffs = {
            vram = compare_byte_regions(before_artifact._internal.ppu_memory.vram, after_artifact._internal.ppu_memory.vram, 8),
            cgram = compare_byte_regions(before_artifact._internal.ppu_memory.cgram, after_artifact._internal.ppu_memory.cgram, 8),
            oam = compare_byte_regions(before_artifact._internal.ppu_memory.oam, after_artifact._internal.ppu_memory.oam, 8)
        }
    }
end

local function should_sample_frame(frame)
    return (frame % config.sample_every) == 0
end

local function record_transition_event(snapshot)
    local previous = state.last_snapshot
    if previous == nil then
        state.transition_events[#state.transition_events + 1] = {
            frame = snapshot.frame,
            type = "initial",
            main_callback_snes = snapshot.main_callback_snes,
            irq_callback_snes = snapshot.irq_callback_snes,
            state_0202 = snapshot.state_0202,
            state_1c70 = snapshot.state_1c70,
            state_1c76 = snapshot.state_1c76
        }
        return
    end

    local changes = {}
    local callback_changed = false
    for _, field in ipairs(transition_watch_fields) do
        if previous[field] ~= snapshot[field] then
            if field == "main_callback_snes"
                or field == "nmi_callback_snes"
                or field == "irq_callback_snes"
                or field == "pending_main_callback_snes"
                or field == "pending_nmi_callback_snes" then
                callback_changed = true
            end
            changes[#changes + 1] = {
                field = field,
                before = previous[field],
                after = snapshot[field]
            }
        end
    end

    if #changes > 0 then
        state.transition_events[#state.transition_events + 1] = {
            frame = snapshot.frame,
            type = callback_changed and "callback+state" or "state",
            change_count = #changes,
            changes = changes,
            main_callback_snes = snapshot.main_callback_snes,
            irq_callback_snes = snapshot.irq_callback_snes,
            state_0202 = snapshot.state_0202,
            state_1c70 = snapshot.state_1c70,
            state_1c76 = snapshot.state_1c76,
            dp_0053 = snapshot.dp_0053,
            dp_0054 = snapshot.dp_0054
        }
    end
end

local function serialize_artifact(artifact)
    local copy = {}
    for key, value in pairs(artifact) do
        if key ~= "_internal" then
            copy[key] = value
        end
    end
    return copy
end

local function create_capture_artifact(kind, include_deep_dumps)
    local snapshot = snapshot_live_state()
    local regions, internal_regions = capture_region_payloads()
    local internal_ppu, summarized_ppu_memory = capture_ppu_memory_payloads()

    local artifact = {
        kind = kind,
        frame = snapshot.frame,
        state = snapshot,
        ppu = capture_ppu_summary(),
        queue = read_dma_queue_summary(snapshot.dp_0053, snapshot.dp_0054),
        regions = regions,
        ppu_memory = summarized_ppu_memory,
        _internal = {
            regions = internal_regions,
            ppu_memory = internal_ppu
        }
    }

    if kind ~= "bookmark" then
        local capture_index = #state.captures + 1
        local capture_prefix = string.format("%s_capture_%03d_frame_%05d", output_prefix, capture_index, snapshot.frame)
        artifact.capture_prefix = capture_prefix
        write_binary_file(capture_prefix .. ".png", emu.takeScreenshot())
        artifact.screenshot_path = capture_prefix .. ".png"
        if include_deep_dumps then
            dump_ppu_snapshot(capture_prefix, snapshot.frame)
            dump_wram_snapshot(capture_prefix)
            artifact.ppu_dump_prefix = capture_prefix
            artifact.wram_dump_prefix = capture_prefix
        end
    end

    local reference = state.reference_artifact or state.last_capture_artifact
    local compare = build_compare_payload(reference, artifact)
    if compare ~= nil then
        artifact.compare_to_reference = compare
    end

    if artifact.capture_prefix ~= nil then
        write_text_file(artifact.capture_prefix .. ".json", encode_json_value(serialize_artifact(artifact), ""))
    end

    state.captures[#state.captures + 1] = artifact
    state.last_capture_artifact = artifact
    return artifact
end

local function record_command(kind, snapshot, note)
    state.command_events[#state.command_events + 1] = {
        frame = snapshot.frame,
        kind = kind,
        note = note,
        main_callback_snes = snapshot.main_callback_snes,
        irq_callback_snes = snapshot.irq_callback_snes,
        state_0202 = snapshot.state_0202,
        state_1c70 = snapshot.state_1c70,
        state_1c76 = snapshot.state_1c76,
        dp_0053 = snapshot.dp_0053,
        dp_0054 = snapshot.dp_0054
    }
end

local function write_session_files()
    local capture_items = {}
    for index = 1, #state.captures do
        capture_items[#capture_items + 1] = serialize_artifact(state.captures[index])
    end

    local output = {
        session_prefix = output_prefix,
        sampled_frame_count = #state.entries,
        transition_event_count = #state.transition_events,
        capture_count = #state.captures,
        command_count = #state.command_events,
        exec_point_hits = state.exec_point_hits,
        exec_point_dropped_hits = state.exec_point_dropped_hits,
        write_point_hits = state.write_point_hits,
        write_point_dropped_hits = state.write_point_dropped_hits,
        frames = state.entries,
        transition_events = state.transition_events,
        command_events = state.command_events,
        captures = capture_items
    }
    write_text_file(output_prefix .. ".json", encode_json_value(output, ""))

    local lines = {
        "# TD2 Live Play Probe Summary",
        "",
        string.format("- sampled frames: `%d`", #state.entries),
        string.format("- transition events: `%d`", #state.transition_events),
        string.format("- captures: `%d`", #state.captures),
        string.format("- commands: `%d`", #state.command_events),
        string.format("- exec/write hits: `%d / %d`", #state.exec_point_hits, #state.write_point_hits),
        "",
        "## Commands",
        "",
        "- `Select + L + R + A`: bookmark current state as the new compare reference",
        "- `Select + L + R + X`: quick capture with screenshot + JSON compare",
        "- `Select + L + R + Y`: deep capture with screenshot + `VRAM/CGRAM/OAM/WRAM` dumps",
        "- `Select + L + R + Start`: flush the rolling session JSON/summary to disk",
        ""
    }

    if #state.captures > 0 then
        lines[#lines + 1] = "## Latest Captures"
        lines[#lines + 1] = ""
        local start_index = math.max(1, #state.captures - 9)
        for index = start_index, #state.captures do
            local artifact = state.captures[index]
            lines[#lines + 1] = string.format(
                "- `%s` frame `%d`: main `%s`, irq `%s`, queue `%02X -> %02X`, active descriptors `%d`",
                artifact.kind,
                artifact.frame,
                artifact.state.main_callback_snes,
                artifact.state.irq_callback_snes,
                artifact.state.dp_0053 % 0x100,
                artifact.state.dp_0054 % 0x100,
                artifact.queue.active_descriptor_count
            )
        end
        lines[#lines + 1] = ""
    end

    write_text_file(output_prefix .. "_summary.md", table.concat(lines, "\n"))
end

local function has_buttons(mask, required_mask)
    return ((mask or 0) & required_mask) == required_mask
end

local function handle_manual_commands(snapshot)
    if state.frame - state.last_command_frame < config.command_cooldown_frames then
        return
    end

    local joy1 = snapshot.state_0960 or 0
    local base = input_mask.SELECT | input_mask.L | input_mask.R
    if not has_buttons(joy1, base) then
        return
    end

    if has_buttons(joy1, base | input_mask.A) then
        local artifact = create_capture_artifact("bookmark", false)
        state.reference_artifact = artifact
        state.last_command_frame = state.frame
        record_command("bookmark", snapshot, "reference updated")
        emu.displayMessage("TD2 Live Probe", "Bookmark set at frame " .. tostring(snapshot.frame))
        return
    end

    if has_buttons(joy1, base | input_mask.X) then
        local artifact = create_capture_artifact("quick", false)
        state.last_command_frame = state.frame
        record_command("quick", snapshot, artifact.capture_prefix)
        write_session_files()
        emu.displayMessage("TD2 Live Probe", "Quick capture saved at frame " .. tostring(snapshot.frame))
        return
    end

    if has_buttons(joy1, base | input_mask.Y) then
        local artifact = create_capture_artifact("deep", true)
        state.last_command_frame = state.frame
        record_command("deep", snapshot, artifact.capture_prefix)
        write_session_files()
        emu.displayMessage("TD2 Live Probe", "Deep capture saved at frame " .. tostring(snapshot.frame))
        return
    end

    if has_buttons(joy1, base | input_mask.START) then
        state.last_command_frame = state.frame
        record_command("flush", snapshot, output_prefix)
        write_session_files()
        emu.displayMessage("TD2 Live Probe", "Session flushed to " .. output_prefix)
        return
    end
end

local function make_exec_point_callback(point)
    return function()
        if state.finished then
            return
        end

        if config.exec_point_max_hits > 0 and #state.exec_point_hits >= config.exec_point_max_hits then
            state.exec_point_dropped_hits = state.exec_point_dropped_hits + 1
            return
        end

        local cpu_state = emu.getState()
        state.exec_point_hits[#state.exec_point_hits + 1] = {
            frame = state.frame,
            point_id = point.id,
            point_snes = point.snes,
            cpu_a = cpu_state["cpu.a"],
            cpu_x = cpu_state["cpu.x"],
            cpu_y = cpu_state["cpu.y"],
            cpu_pc = cpu_state["cpu.pc"],
            active_main_callback_addr = read_u16(0x000038),
            active_main_callback_bank = read_u8(0x00003A),
            active_irq_callback_addr = read_u16(0x00003E),
            active_irq_callback_bank = read_u8(0x000040),
            state_0202 = read_u16(0x7E0202),
            state_1c70 = read_u16(0x7E1C70),
            state_1c76 = read_u16(0x7E1C76),
            dp_0053 = read_u8(0x000053),
            dp_0054 = read_u8(0x000054)
        }
    end
end

local function make_write_point_callback(point)
    return function(address, value)
        if state.finished then
            return
        end

        if config.write_point_max_hits > 0 and #state.write_point_hits >= config.write_point_max_hits then
            state.write_point_dropped_hits = state.write_point_dropped_hits + 1
            return
        end

        local snapshot = emu.getState()
        state.write_point_hits[#state.write_point_hits + 1] = {
            frame = state.frame,
            point_id = point.id,
            point_snes = point.snes,
            address = address,
            value = value,
            scanline = snapshot["ppu.scanline"],
            active_main_callback_addr = read_u16(0x000038),
            active_main_callback_bank = read_u8(0x00003A),
            active_irq_callback_addr = read_u16(0x00003E),
            active_irq_callback_bank = read_u8(0x000040),
            state_0202 = read_u16(0x7E0202),
            state_1c70 = read_u16(0x7E1C70),
            state_1c76 = read_u16(0x7E1C76),
            dp_0053 = read_u8(0x000053),
            dp_0054 = read_u8(0x000054)
        }
    end
end

local function on_end_frame()
    if state.finished then
        return
    end

    local snapshot = snapshot_live_state()
    record_transition_event(snapshot)

    if should_sample_frame(state.frame) then
        state.entries[#state.entries + 1] = snapshot
    end

    handle_manual_commands(snapshot)
    state.last_snapshot = snapshot
    state.frame = state.frame + 1

    if config.autosave_every > 0 and (state.frame % config.autosave_every) == 0 then
        write_session_files()
    end

    if config.auto_stop_frames > 0 and state.frame >= config.auto_stop_frames then
        write_session_files()
        state.finished = true
        emu.displayMessage("TD2 Live Probe", "Auto-stop complete. Session written to " .. output_prefix)
        emu.stop(0)
    end
end

emu.displayMessage(
    "TD2 Live Probe",
    "Armed. Commands: Select+L+R+A bookmark; Select+L+R+X quick capture; Select+L+R+Y deep capture; Select+L+R+Start flush."
)

for _, point in ipairs(config.trace_exec_points) do
    emu.addMemoryCallback(make_exec_point_callback(point), emu.callbackType.exec, point.linear, point.linear)
end

for _, point in ipairs(config.trace_write_points) do
    emu.addMemoryCallback(make_write_point_callback(point), emu.callbackType.write, point.linear, point.linear)
end

emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
