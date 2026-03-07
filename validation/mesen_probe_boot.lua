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

local function parse_button_pattern(raw)
    if raw == nil or raw == "" then
        return {}
    end

    local pattern = {}
    for token in raw:gmatch("[^,]+") do
        local key = trim(token)
        if key ~= "" then
            pattern[key] = true
        end
    end
    return pattern
end

local function parse_input_env(name)
    local raw = os.getenv(name)
    return parse_button_pattern(raw)
end

local function parse_input_windows_env(name)
    local raw = os.getenv(name)
    if raw == nil or raw == "" then
        return {}
    end

    local windows = {}
    for segment in raw:gmatch("[^;]+") do
        local item = trim(segment)
        if item ~= "" then
            local range_raw, buttons_raw = item:match("^([^:]+):?(.*)$")
            if range_raw ~= nil then
                local start_raw, end_raw = range_raw:match("^(%-?%d+)%s*%-%s*(%-?%d+)$")
                if start_raw == nil then
                    local single_raw = range_raw:match("^(%-?%d+)$")
                    if single_raw ~= nil then
                        start_raw = single_raw
                        end_raw = single_raw
                    end
                end

                local start_frame = tonumber(start_raw)
                local end_frame = tonumber(end_raw)
                if start_frame ~= nil and end_frame ~= nil then
                    if end_frame < start_frame then
                        start_frame, end_frame = end_frame, start_frame
                    end

                    windows[#windows + 1] = {
                        start_frame = math.floor(start_frame),
                        end_frame = math.floor(end_frame),
                        pattern = parse_button_pattern(buttons_raw)
                    }
                end
            end
        end
    end

    table.sort(windows, function(a, b)
        if a.start_frame == b.start_frame then
            return a.end_frame < b.end_frame
        end
        return a.start_frame < b.start_frame
    end)

    return windows
end

local config = {
    total_frames = env_number("TD2_BOOT_PROBE_TOTAL_FRAMES", 180),
    screenshot_frame = env_number("TD2_BOOT_PROBE_SCREENSHOT_FRAME", -1),
    trace_start_frame = env_number("TD2_BOOT_PROBE_TRACE_START_FRAME", -1),
    trace_end_frame = env_number("TD2_BOOT_PROBE_TRACE_END_FRAME", -1),
    save_savestate_frame = env_number("TD2_BOOT_PROBE_SAVE_SAVESTATE_FRAME", -1),
    input_start_frame = env_number("TD2_BOOT_PROBE_INPUT_START_FRAME", -1),
    input_end_frame = env_number("TD2_BOOT_PROBE_INPUT_END_FRAME", -1),
    player = env_number("TD2_BOOT_PROBE_PLAYER", 0),
    input_pattern = parse_input_env("TD2_BOOT_PROBE_INPUT"),
    input_windows = parse_input_windows_env("TD2_BOOT_PROBE_INPUT_WINDOWS"),
    dump_ppu_memory = env_number("TD2_BOOT_PROBE_DUMP_PPU_MEMORY", 0) ~= 0,
    dump_wram_memory = env_number("TD2_BOOT_PROBE_DUMP_WRAM_MEMORY", 0) ~= 0,
    trace_mode7_writes = env_number("TD2_BOOT_PROBE_TRACE_MODE7", 0) ~= 0,
    trace_dma_writes = env_number("TD2_BOOT_PROBE_TRACE_DMA", 0) ~= 0,
    trace_vram_writes = env_number("TD2_BOOT_PROBE_TRACE_VRAM", 0) ~= 0,
    trace_l001210_exec = env_number("TD2_BOOT_PROBE_TRACE_L001210", 0) ~= 0,
    l001210_max_hits = env_number("TD2_BOOT_PROBE_L001210_MAX_HITS", 0),
    savestate_filename = "seed_state.bin",
    save_savestate_filename = trim(os.getenv("TD2_BOOT_PROBE_SAVE_SAVESTATE_FILENAME") or "td2_boot_probe_saved_state.bin")
}

if config.screenshot_frame < 0 then
    config.screenshot_frame = config.total_frames - 1
end

if config.trace_start_frame < 0 then
    config.trace_start_frame = config.screenshot_frame
end

if config.trace_end_frame < 0 then
    config.trace_end_frame = config.screenshot_frame
end

if config.trace_end_frame < config.trace_start_frame then
    config.trace_end_frame = config.trace_start_frame
end

if config.input_end_frame >= 0 and config.input_start_frame >= 0 and config.input_end_frame < config.input_start_frame then
    config.input_end_frame = config.input_start_frame
end

local state = {
    frame = 0,
    finished = false,
    entries = {},
    mode7_writes = {},
    dma_writes = {},
    vram_writes = {},
    l001210_hits = {},
    l001210_dropped_hits = 0,
    saved_savestate_path = nil,
    saved_savestate_error = nil,
    savestate_attempted = false,
    exec_callback_ref = nil
}

local script_data_dir = emu.getScriptDataFolder()
local output_prefix = script_data_dir .. "/td2_boot_probe"

local function resolve_savestate_path()
    local env_path = os.getenv("TD2_CAPTURE_SAVESTATE")
    if env_path ~= nil then
        if env_path ~= "" then
            return env_path
        end
        return nil
    end
    return script_data_dir .. "/" .. config.savestate_filename
end

local savestate_path = resolve_savestate_path()

local function resolve_save_savestate_path()
    local env_path = os.getenv("TD2_BOOT_PROBE_SAVE_SAVESTATE")
    if env_path ~= nil then
        if env_path ~= "" then
            return env_path
        end
        return nil
    end

    if config.save_savestate_frame < 0 then
        return nil
    end

    if config.save_savestate_filename == "" then
        return nil
    end

    return script_data_dir .. "/" .. config.save_savestate_filename
end

local save_savestate_path = resolve_save_savestate_path()

local function read_binary_file(path)
    if not path or path == "" then
        return nil
    end

    local file = io.open(path, "rb")
    if not file then
        return nil
    end

    local data = file:read("*a")
    file:close()
    return data
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

local tracked_registers = {
    [0x210D] = "M7HOFS",
    [0x210E] = "M7VOFS",
    [0x211A] = "M7SEL",
    [0x211B] = "M7A",
    [0x211C] = "M7B",
    [0x211D] = "M7C",
    [0x211E] = "M7D",
    [0x211F] = "M7X",
    [0x2120] = "M7Y",
    [0x212C] = "TMAIN"
}

local dma_register_names = {
    [0x420B] = "DMAEN",
    [0x420C] = "HDMAEN"
}

local vram_register_names = {
    [0x2115] = "VMAIN",
    [0x2116] = "VMADDL",
    [0x2117] = "VMADDH",
    [0x2118] = "VMDATAL",
    [0x2119] = "VMDATAH",
    [0x2121] = "CGADD",
    [0x2122] = "CGDATA"
}

local compression_marker_names = {
    [0x42FB] = "42FB",
    [0x26FB] = "26FB",
    [0x67FB] = "67FB",
    [0x27FB] = "27FB"
}

local l001210_known_sources = {
    {
        id = "bank30_42fb_9681",
        source_linear = 0x1E9681,
        source_snes = "1E:9681",
        marker = "42FB",
        provenance = "candidate",
        note = "zero-output sentinel candidate"
    },
    {
        id = "bank30_67fb_da96",
        source_linear = 0x1EDA96,
        source_snes = "1E:DA96",
        marker = "67FB",
        provenance = "candidate",
        note = "large 67FB chunk with overlapping marker window"
    },
    {
        id = "bank30_26fb_df6c",
        source_linear = 0x1EDF6C,
        source_snes = "1E:DF6C",
        marker = "26FB",
        provenance = "table-confirmed",
        note = "referenced by bank1 helper pointer table"
    },
    {
        id = "bank30_26fb_e039",
        source_linear = 0x1EE039,
        source_snes = "1E:E039",
        marker = "26FB",
        provenance = "table-confirmed",
        note = "referenced by bank1 helper pointer table"
    },
    {
        id = "bank30_26fb_e73f",
        source_linear = 0x1EE73F,
        source_snes = "1E:E73F",
        marker = "26FB",
        provenance = "table-confirmed",
        note = "referenced by bank1 helper pointer table"
    },
    {
        id = "bank30_26fb_e800",
        source_linear = 0x1EE800,
        source_snes = "1E:E800",
        marker = "26FB",
        provenance = "table-confirmed",
        note = "referenced by bank1 helper pointer table"
    },
    {
        id = "bank30_67fb_e91f",
        source_linear = 0x1EE91F,
        source_snes = "1E:E91F",
        marker = "67FB",
        provenance = "candidate",
        note = "current decoder fails with source exhaustion"
    },
    {
        id = "bank30_26fb_ee7f",
        source_linear = 0x1EEE7F,
        source_snes = "1E:EE7F",
        marker = "26FB",
        provenance = "table-confirmed",
        note = "referenced by bank1 helper pointer table"
    }
}

local l001210_known_source_lookup = {}
for _, source in ipairs(l001210_known_sources) do
    l001210_known_source_lookup[source.source_linear] = source
end

for channel = 0, 7 do
    local base = 0x4300 + (channel * 0x10)
    dma_register_names[base + 0x0] = string.format("DMAP%d", channel)
    dma_register_names[base + 0x1] = string.format("BBAD%d", channel)
    dma_register_names[base + 0x2] = string.format("A1T%dL", channel)
    dma_register_names[base + 0x3] = string.format("A1T%dH", channel)
    dma_register_names[base + 0x4] = string.format("A1B%d", channel)
    dma_register_names[base + 0x5] = string.format("DAS%dL", channel)
    dma_register_names[base + 0x6] = string.format("DAS%dH", channel)
    dma_register_names[base + 0x7] = string.format("DASB%d", channel)
    dma_register_names[base + 0x8] = string.format("A2A%dL", channel)
    dma_register_names[base + 0x9] = string.format("A2A%dH", channel)
    dma_register_names[base + 0xA] = string.format("NTRL%d", channel)
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
            for i = 1, max_index do
                parts[#parts + 1] = encode_json_value(value[i], indent .. "  ")
            end
            return "[" .. table.concat(parts, ", ") .. "]"
        else
            local keys = {}
            for key, _ in pairs(value) do
                keys[#keys + 1] = tostring(key)
            end
            table.sort(keys)

            local lines = {"{"}
            for i = 1, #keys do
                local key = keys[i]
                local suffix = i == #keys and "" or ","
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
    end

    return "\"" .. json_escape("<unsupported:" .. value_type .. ">") .. "\""
end

local function read_u16(address)
    return emu.read16(address, emu.memType.snesDebug)
end

local function read_u8(address)
    return emu.read(address, emu.memType.snesDebug)
end

local function swap_u16(value)
    local lo = value % 0x100
    local hi = math.floor(value / 0x100) % 0x100
    return (lo * 0x100) + hi
end

local function format_snes_ptr(bank, addr)
    return string.format("%02X:%04X", bank % 0x100, addr % 0x10000)
end

local function snapshot_boot_state()
    return {
        frame = state.frame,
        selector_1c78 = read_u16(0x7E1C78),
        selector_1c7a = read_u16(0x7E1C7A),
        selector_1c7c = read_u16(0x7E1C7C),
        selector_1c82 = read_u16(0x7E1C82),
        selector_1cac = read_u16(0x7E1CAC),
        selector_1cca = read_u16(0x7E1CCA),
        selector_1ccc = read_u16(0x7E1CCC),
        selector_1cce = read_u16(0x7E1CCE),
        selector_1cd0 = read_u16(0x7E1CD0),
        selector_1ce2 = read_u16(0x7E1CE2),
        selector_1ce4 = read_u16(0x7E1CE4),
        selector_1ce6 = read_u16(0x7E1CE6),
        selector_1cea = read_u16(0x7E1CEA),
        state_0996 = read_u16(0x7E0996),
        active_main_callback_addr = read_u16(0x000038),
        active_main_callback_bank = read_u8(0x00003A),
        active_nmi_callback_addr = read_u16(0x00003B),
        active_nmi_callback_bank = read_u8(0x00003D),
        active_irq_callback_addr = read_u16(0x00003E),
        active_irq_callback_bank = read_u8(0x000040),
        dp_0020 = read_u16(0x000020),
        state_0f70 = read_u8(0x000F70),
        state_0990 = read_u16(0x7E0990),
        state_09a2 = read_u16(0x7E09A2),
        state_09a4 = read_u16(0x7E09A4),
        state_09a8 = read_u16(0x7E09A8),
        state_0200 = read_u16(0x7E0200),
        state_0202 = read_u16(0x7E0202),
        state_0204 = read_u16(0x7E0204),
        state_0206 = read_u16(0x7E0206),
        state_0208 = read_u16(0x7E0208),
        state_020a = read_u16(0x7E020A),
        state_0400 = read_u16(0x7E0400),
        state_0402 = read_u16(0x7E0402),
        state_0404 = read_u16(0x7E0404),
        state_0405 = read_u16(0x7E0405),
        state_0406 = read_u16(0x7E0406),
        state_0408 = read_u16(0x7E0408),
        state_040a = read_u16(0x7E040A),
        state_0440 = read_u16(0x7E0440),
        state_0442 = read_u16(0x7E0442),
        state_0444 = read_u16(0x7E0444),
        state_1e2c = read_u16(0x7E1E2C),
        dp_0000 = read_u16(0x000000),
        dp_0004 = read_u16(0x000004),
        dp_0008 = read_u16(0x000008),
        dp_000c = read_u16(0x00000C),
        dp_0010 = read_u16(0x000010),
        dp_0011 = read_u16(0x000011),
        dp_0012 = read_u16(0x000012),
        dp_0022 = read_u16(0x000022),
        dp_0040 = read_u16(0x000040),
        dp_0053 = read_u8(0x000053),
        dp_0054 = read_u8(0x000054),
        dp_0055 = read_u16(0x000055),
        dp_0056 = read_u8(0x000056)
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

local function dump_ppu_snapshot(prefix)
    dump_memory_region(prefix .. "_vram.bin", emu.memType.snesVideoRam, emu.getMemorySize(emu.memType.snesVideoRam))
    dump_memory_region(prefix .. "_cgram.bin", emu.memType.snesCgRam, emu.getMemorySize(emu.memType.snesCgRam))
    dump_memory_region(prefix .. "_oam.bin", emu.memType.snesSpriteRam, emu.getMemorySize(emu.memType.snesSpriteRam))
    local full_state = emu.getState()
    local filtered_state = filter_state_snapshot(full_state)
    filtered_state.frame = state.frame
    write_text_file(prefix .. "_ppu_state.json", encode_json_value(filtered_state, ""))
end

local function dump_wram_snapshot(prefix)
    dump_memory_region(prefix .. "_wram.bin", emu.memType.snesWorkRam, 0x2000)
end

local function is_trace_frame()
    return state.frame >= config.trace_start_frame and state.frame <= config.trace_end_frame
end

local function save_probe_log()
    local output = {
        total_frames = config.total_frames,
        screenshot_frame = config.screenshot_frame,
        save_savestate_frame = config.save_savestate_frame,
        saved_savestate_path = state.saved_savestate_path,
        saved_savestate_error = state.saved_savestate_error,
        frames = state.entries,
    }
    write_text_file(output_prefix .. ".json", encode_json_value(output, ""))
end

local function save_mode7_trace()
    if not config.trace_mode7_writes then
        return
    end

    local output = {
        screenshot_frame = config.screenshot_frame,
        total_frames = config.total_frames,
        trace_start_frame = config.trace_start_frame,
        trace_end_frame = config.trace_end_frame,
        writes = state.mode7_writes
    }
    write_text_file(output_prefix .. "_mode7_writes.json", encode_json_value(output, ""))
end

local function save_dma_trace()
    if not config.trace_dma_writes then
        return
    end

    local output = {
        screenshot_frame = config.screenshot_frame,
        total_frames = config.total_frames,
        trace_start_frame = config.trace_start_frame,
        trace_end_frame = config.trace_end_frame,
        writes = state.dma_writes
    }
    write_text_file(output_prefix .. "_dma_writes.json", encode_json_value(output, ""))
end

local function save_vram_trace()
    if not config.trace_vram_writes then
        return
    end

    local output = {
        screenshot_frame = config.screenshot_frame,
        total_frames = config.total_frames,
        trace_start_frame = config.trace_start_frame,
        trace_end_frame = config.trace_end_frame,
        writes = state.vram_writes
    }
    write_text_file(output_prefix .. "_vram_writes.json", encode_json_value(output, ""))
end

local function save_l001210_trace()
    if not config.trace_l001210_exec then
        return
    end

    local output = {
        screenshot_frame = config.screenshot_frame,
        total_frames = config.total_frames,
        max_hits = config.l001210_max_hits,
        hit_count = #state.l001210_hits,
        dropped_hits = state.l001210_dropped_hits,
        known_sources = l001210_known_sources,
        hits = state.l001210_hits
    }
    write_text_file(output_prefix .. "_l001210_exec.json", encode_json_value(output, ""))
end

local function reset_probe_state()
    state.frame = 0
    state.finished = false
    state.entries = {}
    state.mode7_writes = {}
    state.dma_writes = {}
    state.vram_writes = {}
    state.l001210_hits = {}
    state.l001210_dropped_hits = 0
    state.saved_savestate_path = nil
    state.saved_savestate_error = nil
end

local function on_first_exec()
    if state.savestate_attempted then
        return
    end

    state.savestate_attempted = true

    if state.exec_callback_ref ~= nil then
        emu.removeMemoryCallback(state.exec_callback_ref, emu.callbackType.exec, 0x000000, 0xFFFFFF)
        state.exec_callback_ref = nil
    end

    local savestate_data = read_binary_file(savestate_path)
    if not savestate_data or savestate_data == "" then
        return
    end

    reset_probe_state()

    local ok, err = pcall(emu.loadSavestate, savestate_data)
    if not ok then
        state.finished = true
        emu.displayMessage("TD2 Boot Probe", "Savestate load failed: " .. tostring(err))
        emu.stop(1)
        return
    end
end

local function on_end_frame()
    if state.finished then
        return
    end

    state.entries[#state.entries + 1] = snapshot_boot_state()

    if state.frame == config.screenshot_frame then
        write_binary_file(output_prefix .. "_frame.png", emu.takeScreenshot())
        if config.dump_ppu_memory then
            dump_ppu_snapshot(output_prefix)
        end
        if config.dump_wram_memory then
            dump_wram_snapshot(output_prefix)
        end
    end

    state.frame = state.frame + 1

    if state.frame >= config.total_frames then
        save_probe_log()
        save_mode7_trace()
        save_dma_trace()
        save_vram_trace()
        save_l001210_trace()
        state.finished = true
        emu.displayMessage("TD2 Boot Probe", "Probe finished. Files written to " .. output_prefix .. ".*")
        emu.stop(0)
    end
end

local function on_start_frame()
    if state.finished then
        return
    end

    if save_savestate_path ~= nil and config.save_savestate_frame >= 0 and state.saved_savestate_path == nil and state.frame == config.save_savestate_frame then
        local save_methods = {
            {"saveSavestate", emu.saveSavestate},
            {"saveState", emu.saveState},
            {"serializeState", emu.serializeState}
        }

        for _, method in ipairs(save_methods) do
            local method_name = method[1]
            local method_fn = method[2]
            if type(method_fn) == "function" then
                local ok, savestate_data = pcall(method_fn)
                if ok and savestate_data ~= nil and savestate_data ~= "" then
                    write_binary_file(save_savestate_path, savestate_data)
                    state.saved_savestate_path = save_savestate_path
                    state.saved_savestate_error = nil
                    break
                end

                if not ok then
                    state.saved_savestate_error = method_name .. ": " .. tostring(savestate_data)
                else
                    state.saved_savestate_error = method_name .. ": returned empty data"
                end
            end
        end

        if state.saved_savestate_path == nil and state.saved_savestate_error == nil then
            state.saved_savestate_error = "no supported savestate API found on emu table"
        end
    end

    if config.dump_ppu_memory and state.frame == config.screenshot_frame then
        dump_ppu_snapshot(output_prefix .. "_startframe")
    end
    if config.dump_wram_memory and state.frame == config.screenshot_frame then
        dump_wram_snapshot(output_prefix .. "_startframe")
    end
end

local function on_tracked_register_write(address, value)
    if state.finished or not config.trace_mode7_writes or not is_trace_frame() then
        return
    end

    local snapshot = emu.getState()
    state.mode7_writes[#state.mode7_writes + 1] = {
        frame = state.frame,
        address = address,
        register = tracked_registers[address] or string.format("$%04X", address),
        value = value,
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_screen_layers = snapshot["ppu.mainScreenLayers"],
        main_addr = read_u16(0x000038),
        main_bank = read_u8(0x00003A)
    }
end

local function on_dma_register_write(address, value)
    if state.finished or not config.trace_dma_writes or not is_trace_frame() then
        return
    end

    local snapshot = emu.getState()
    state.dma_writes[#state.dma_writes + 1] = {
        frame = state.frame,
        address = address,
        register = dma_register_names[address] or string.format("$%04X", address),
        value = value,
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_screen_layers = snapshot["ppu.mainScreenLayers"],
        main_addr = read_u16(0x000038),
        main_bank = read_u8(0x00003A)
    }
end

local function on_vram_register_write(address, value)
    if state.finished or not config.trace_vram_writes or not is_trace_frame() then
        return
    end

    local snapshot = emu.getState()
    state.vram_writes[#state.vram_writes + 1] = {
        frame = state.frame,
        address = address,
        register = vram_register_names[address] or string.format("$%04X", address),
        value = value,
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_screen_layers = snapshot["ppu.mainScreenLayers"],
        main_addr = read_u16(0x000038),
        main_bank = read_u8(0x00003A),
        dp_0054 = read_u8(0x000054)
    }
end

local function on_l001210_exec()
    if state.finished or not config.trace_l001210_exec then
        return
    end

    if config.l001210_max_hits > 0 and #state.l001210_hits >= config.l001210_max_hits then
        state.l001210_dropped_hits = state.l001210_dropped_hits + 1
        return
    end

    local source_addr = read_u16(0x00000C)
    local source_bank = read_u8(0x00000E)
    local dest_addr = read_u16(0x000010)
    local source_linear = (source_bank * 0x10000) + source_addr
    local marker_raw_le = read_u16(source_linear)
    local marker_word = swap_u16(marker_raw_le)
    local marker_tag = compression_marker_names[marker_word]
    local known = l001210_known_source_lookup[source_linear]

    state.l001210_hits[#state.l001210_hits + 1] = {
        frame = state.frame,
        source_linear = source_linear,
        source_bank = source_bank,
        source_addr = source_addr,
        source_snes = format_snes_ptr(source_bank, source_addr),
        source_marker_raw_le = marker_raw_le,
        source_marker_word = marker_word,
        source_marker = marker_tag or string.format("%04X", marker_word),
        source_marker_supported = marker_tag ~= nil,
        source_known_id = known and known.id or nil,
        source_provenance = known and known.provenance or (source_bank == 0x1E and "bank30-unclassified" or "unclassified"),
        destination_addr = dest_addr,
        destination_snes = format_snes_ptr(0x7E, dest_addr),
        active_main_callback_addr = read_u16(0x000038),
        active_main_callback_bank = read_u8(0x00003A),
        state_0202 = read_u16(0x7E0202),
        state_0208 = read_u16(0x7E0208),
        dp_0054 = read_u8(0x000054)
    }
end

local function resolve_active_input_pattern(frame)
    if #config.input_windows > 0 then
        for _, window in ipairs(config.input_windows) do
            if frame >= window.start_frame and frame <= window.end_frame then
                return window.pattern
            end
        end
        return nil
    end

    if config.input_start_frame < 0 or frame < config.input_start_frame then
        return nil
    end

    if config.input_end_frame >= 0 and frame > config.input_end_frame then
        return nil
    end

    if next(config.input_pattern) == nil then
        return nil
    end

    return config.input_pattern
end

local function on_input_polled()
    if state.finished then
        return
    end

    local input_pattern = resolve_active_input_pattern(state.frame)
    if input_pattern == nil then
        return
    end

    emu.setInput(input_pattern, config.player)
end

emu.displayMessage("TD2 Boot Probe", "Script armed for " .. tostring(config.total_frames) .. " frames.")
if savestate_path ~= nil then
    state.exec_callback_ref = emu.addMemoryCallback(on_first_exec, emu.callbackType.exec, 0x000000, 0xFFFFFF)
end
emu.addEventCallback(on_input_polled, emu.eventType.inputPolled)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
emu.addEventCallback(on_start_frame, emu.eventType.startFrame)
if config.trace_mode7_writes then
    emu.addMemoryCallback(on_tracked_register_write, emu.callbackType.write, 0x210D, 0x2120)
    emu.addMemoryCallback(on_tracked_register_write, emu.callbackType.write, 0x212C, 0x212C)
end
if config.trace_dma_writes then
    emu.addMemoryCallback(on_dma_register_write, emu.callbackType.write, 0x420B, 0x420C)
    emu.addMemoryCallback(on_dma_register_write, emu.callbackType.write, 0x4300, 0x437A)
end
if config.trace_vram_writes then
    emu.addMemoryCallback(on_vram_register_write, emu.callbackType.write, 0x2115, 0x2119)
    emu.addMemoryCallback(on_vram_register_write, emu.callbackType.write, 0x2121, 0x2122)
end
if config.trace_l001210_exec then
    emu.addMemoryCallback(on_l001210_exec, emu.callbackType.exec, 0x009210, 0x009210)
end
