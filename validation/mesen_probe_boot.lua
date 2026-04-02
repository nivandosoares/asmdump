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

local function parse_trigger_input_windows_env(name)
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
                local point_id, start_raw, end_raw = range_raw:match("^(.-)%+(%-?%d+)%s*%-%s*(%-?%d+)$")
                if point_id == nil then
                    point_id, start_raw = range_raw:match("^(.-)%+(%-?%d+)$")
                    end_raw = start_raw
                end

                local start_offset = tonumber(start_raw)
                local end_offset = tonumber(end_raw)
                if point_id ~= nil and start_offset ~= nil and end_offset ~= nil then
                    point_id = trim(point_id)
                    if point_id ~= "" then
                        if end_offset < start_offset then
                            start_offset, end_offset = end_offset, start_offset
                        end

                        windows[#windows + 1] = {
                            point_id = point_id,
                            start_offset = math.floor(start_offset),
                            end_offset = math.floor(end_offset),
                            pattern = parse_button_pattern(buttons_raw)
                        }
                    end
                end
            end
        end
    end

    table.sort(windows, function(a, b)
        if a.point_id == b.point_id then
            if a.start_offset == b.start_offset then
                return a.end_offset < b.end_offset
            end
            return a.start_offset < b.start_offset
        end
        return a.point_id < b.point_id
    end)

    return windows
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

local function parse_frame_list_env(name)
    local raw = os.getenv(name)
    if raw == nil or raw == "" then
        return {}
    end

    local frames = {}
    local seen = {}
    for token in raw:gmatch("[^,;]+") do
        local value = tonumber(trim(token))
        if value ~= nil then
            local frame = math.floor(value)
            if not seen[frame] then
                seen[frame] = true
                frames[#frames + 1] = frame
            end
        end
    end

    table.sort(frames)
    return frames
end

local function parse_frame_ranges_env(name)
    local raw = os.getenv(name)
    if raw == nil or raw == "" then
        return {}
    end

    local ranges = {}
    for segment in raw:gmatch("[^;]+") do
        local item = trim(segment)
        if item ~= "" then
            local start_raw, end_raw = item:match("^(%-?%d+)%s*%-%s*(%-?%d+)$")
            if start_raw == nil then
                local point_raw = item:match("^(%-?%d+)$")
                if point_raw ~= nil then
                    start_raw = point_raw
                    end_raw = point_raw
                end
            end

            local start_frame = tonumber(start_raw)
            local end_frame = tonumber(end_raw)
            if start_frame ~= nil and end_frame ~= nil then
                if end_frame < start_frame then
                    start_frame, end_frame = end_frame, start_frame
                end

                ranges[#ranges + 1] = {
                    start_frame = math.floor(start_frame),
                    end_frame = math.floor(end_frame)
                }
            end
        end
    end

    table.sort(ranges, function(a, b)
        if a.start_frame == b.start_frame then
            return a.end_frame < b.end_frame
        end
        return a.start_frame < b.start_frame
    end)

    return ranges
end

local function make_frame_lookup(frames)
    local lookup = {}
    for _, frame in ipairs(frames) do
        lookup[frame] = true
    end
    return lookup
end

local config = {
    total_frames = env_number("TD2_BOOT_PROBE_TOTAL_FRAMES", 180),
    screenshot_frame = env_number("TD2_BOOT_PROBE_SCREENSHOT_FRAME", -1),
    sample_every = env_number("TD2_BOOT_PROBE_SAMPLE_EVERY", 1),
    capture_frames = parse_frame_list_env("TD2_BOOT_PROBE_CAPTURE_FRAMES"),
    compare_frames = parse_frame_list_env("TD2_BOOT_PROBE_COMPARE_FRAMES"),
    capture_screenshots = env_number("TD2_BOOT_PROBE_CAPTURE_SCREENSHOTS", 0) ~= 0,
    capture_ppu_memory = env_number("TD2_BOOT_PROBE_CAPTURE_PPU_MEMORY", 0) ~= 0,
    capture_wram_memory = env_number("TD2_BOOT_PROBE_CAPTURE_WRAM_MEMORY", 0) ~= 0,
    trace_start_frame = env_number("TD2_BOOT_PROBE_TRACE_START_FRAME", -1),
    trace_end_frame = env_number("TD2_BOOT_PROBE_TRACE_END_FRAME", -1),
    save_savestate_frame = env_number("TD2_BOOT_PROBE_SAVE_SAVESTATE_FRAME", -1),
    input_start_frame = env_number("TD2_BOOT_PROBE_INPUT_START_FRAME", -1),
    input_end_frame = env_number("TD2_BOOT_PROBE_INPUT_END_FRAME", -1),
    player = env_number("TD2_BOOT_PROBE_PLAYER", 0),
    input_pattern = parse_input_env("TD2_BOOT_PROBE_INPUT"),
    input_windows = parse_input_windows_env("TD2_BOOT_PROBE_INPUT_WINDOWS"),
    trigger_input_windows = parse_trigger_input_windows_env("TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS"),
    dump_ppu_memory = env_number("TD2_BOOT_PROBE_DUMP_PPU_MEMORY", 0) ~= 0,
    dump_wram_memory = env_number("TD2_BOOT_PROBE_DUMP_WRAM_MEMORY", 0) ~= 0,
    trace_mode7_writes = env_number("TD2_BOOT_PROBE_TRACE_MODE7", 0) ~= 0,
    mode7_max_hits = env_number("TD2_BOOT_PROBE_MODE7_MAX_HITS", 0),
    trace_dma_writes = env_number("TD2_BOOT_PROBE_TRACE_DMA", 0) ~= 0,
    dma_max_hits = env_number("TD2_BOOT_PROBE_DMA_MAX_HITS", 0),
    trace_vram_writes = env_number("TD2_BOOT_PROBE_TRACE_VRAM", 0) ~= 0,
    vram_max_hits = env_number("TD2_BOOT_PROBE_VRAM_MAX_HITS", 0),
    trace_l001210_exec = env_number("TD2_BOOT_PROBE_TRACE_L001210", 0) ~= 0,
    l001210_max_hits = env_number("TD2_BOOT_PROBE_L001210_MAX_HITS", 0),
    trace_exec_points = parse_exec_point_env("TD2_BOOT_PROBE_TRACE_EXEC_POINTS"),
    exec_point_max_hits = env_number("TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS", 128),
    exec_point_max_hits_per_point = env_number("TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT", 0),
    trace_write_points = parse_exec_point_env("TD2_BOOT_PROBE_TRACE_WRITE_POINTS"),
    write_point_max_hits = env_number("TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS", 256),
    trace_windows = parse_frame_ranges_env("TD2_BOOT_PROBE_TRACE_WINDOWS"),
    force_main_callback_start_frame = env_number("TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME", -1),
    force_main_callback_end_frame = env_number("TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME", -1),
    force_main_callback_addr = env_number("TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR", -1),
    force_main_callback_bank = env_number("TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK", -1),
    force_selectors_start_frame = env_number("TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME", -1),
    force_selectors_end_frame = env_number("TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME", -1),
    force_selector_1c78 = env_number("TD2_BOOT_PROBE_FORCE_1C78", -1),
    force_selector_1c80 = env_number("TD2_BOOT_PROBE_FORCE_1C80", -1),
    force_selector_1ca8 = env_number("TD2_BOOT_PROBE_FORCE_1CA8", -1),
    force_selector_1c86 = env_number("TD2_BOOT_PROBE_FORCE_1C86", -1),
    force_selector_1cac = env_number("TD2_BOOT_PROBE_FORCE_1CAC", -1),
    force_selector_1cae = env_number("TD2_BOOT_PROBE_FORCE_1CAE", -1),
    force_state_1d10 = env_number("TD2_BOOT_PROBE_FORCE_1D10", -1),
    force_selectors_on_b1f9 = env_number("TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9", 0) ~= 0,
    savestate_filename = "seed_state.bin",
    save_savestate_filename = trim(os.getenv("TD2_BOOT_PROBE_SAVE_SAVESTATE_FILENAME") or "td2_boot_probe_saved_state.bin")
}

if config.screenshot_frame < 0 then
    config.screenshot_frame = config.total_frames - 1
end

if config.sample_every <= 0 then
    config.sample_every = 1
end

if #config.compare_frames == 0 and #config.capture_frames > 0 then
    config.compare_frames = config.capture_frames
end

config.capture_frame_lookup = make_frame_lookup(config.capture_frames)
config.compare_frame_lookup = make_frame_lookup(config.compare_frames)

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

if config.force_selectors_end_frame >= 0
    and config.force_selectors_start_frame >= 0
    and config.force_selectors_end_frame < config.force_selectors_start_frame then
    config.force_selectors_end_frame = config.force_selectors_start_frame
end

if config.force_main_callback_end_frame >= 0
    and config.force_main_callback_start_frame >= 0
    and config.force_main_callback_end_frame < config.force_main_callback_start_frame then
    config.force_main_callback_end_frame = config.force_main_callback_start_frame
end

local state = {
    frame = 0,
    finished = false,
    entries = {},
    mode7_writes = {},
    mode7_dropped_hits = 0,
    dma_writes = {},
    dma_dropped_hits = 0,
    vram_writes = {},
    vram_dropped_hits = 0,
    l001210_hits = {},
    l001210_dropped_hits = 0,
    exec_point_hits = {},
    exec_point_hit_counts = {},
    exec_point_first_frames = {},
    exec_point_dropped_hits = 0,
    write_point_hits = {},
    write_point_dropped_hits = 0,
    last_l001210_callsite = nil,
    b1f9_exec_count = 0,
    b1f9_exec_frames = {},
    saved_savestate_path = nil,
    saved_savestate_error = nil,
    savestate_attempted = false,
    exec_callback_ref = nil,
    last_snapshot = nil,
    transition_events = {},
    capture_artifacts = {},
    capture_compare_pairs = {},
    capture_lookup = {},
    capture_internal = {}
}

local function new_b1f9_stage_counts()
    return {
        b226 = 0,
        b256 = 0,
        b273 = 0,
        b59b = 0
    }
end

local function new_b1f9_stage_frames()
    return {
        b226 = {},
        b256 = {},
        b273 = {},
        b59b = {}
    }
end

state.b1f9_stage_counts = new_b1f9_stage_counts()
state.b1f9_stage_frames = new_b1f9_stage_frames()

local script_data_dir = emu.getScriptDataFolder()
local output_prefix = os.getenv("TD2_BOOT_PROBE_OUTPUT_PREFIX") or (script_data_dir .. "/td2_boot_probe")

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

local l001210_known_callsites = {
    {id = "l001210_call_018e3c", pc_linear = 0x018E3C, pc_snes = "01:8E3C"},
    {id = "l001210_call_018e59", pc_linear = 0x018E59, pc_snes = "01:8E59"},
    {id = "l001210_call_018ea3", pc_linear = 0x018EA3, pc_snes = "01:8EA3"},
    {id = "l001210_call_01a043", pc_linear = 0x01A043, pc_snes = "01:A043"},
    {id = "l001210_call_01a061", pc_linear = 0x01A061, pc_snes = "01:A061"},
    {id = "l001210_call_01a1c4", pc_linear = 0x01A1C4, pc_snes = "01:A1C4"},
    {id = "l001210_call_01a42f", pc_linear = 0x01A42F, pc_snes = "01:A42F"},
    {id = "l001210_call_01a9bd", pc_linear = 0x01A9BD, pc_snes = "01:A9BD"},
    {id = "l001210_call_01a9e1", pc_linear = 0x01A9E1, pc_snes = "01:A9E1"},
    {id = "l001210_call_01b256", pc_linear = 0x01B256, pc_snes = "01:B256"},
    {id = "l001210_call_01b273", pc_linear = 0x01B273, pc_snes = "01:B273"},
    {id = "l001210_call_01b59b", pc_linear = 0x01B59B, pc_snes = "01:B59B"}
}

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

local capture_region_specs = {
    {
        id = "dp_0000_005f",
        label = "Direct page core",
        memory_type = emu.memType.snesDebug,
        start_address = 0x000000,
        size = 0x60
    },
    {
        id = "wram_0200_020f",
        label = "Front-end selector tuple",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E0200,
        size = 0x10
    },
    {
        id = "wram_0400_044f",
        label = "Front-end phase loop window",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E0400,
        size = 0x50
    },
    {
        id = "wram_0600_06ff",
        label = "DMA descriptor ring",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E0600,
        size = 0x100
    },
    {
        id = "wram_0700_07ff",
        label = "OAM staging head",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E0700,
        size = 0x100
    },
    {
        id = "wram_0960_0973",
        label = "Input/NMI queue control",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E0960,
        size = 0x14
    },
    {
        id = "wram_11e0_11ff",
        label = "Gameplay actor/watch slice",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E11E0,
        size = 0x20
    },
    {
        id = "wram_1290_12af",
        label = "Crash counter neighborhood",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E1290,
        size = 0x20
    },
    {
        id = "wram_18e0_18ff",
        label = "Cars-left neighborhood",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E18E0,
        size = 0x20
    },
    {
        id = "wram_1c60_1cef",
        label = "Front-end selector bank",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E1C60,
        size = 0x90
    },
    {
        id = "wram_1d00_1d3f",
        label = "Front-end scratch / tile row state",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E1D00,
        size = 0x40
    },
    {
        id = "wram_1e00_1e5f",
        label = "Visible split / HDMA helper slice",
        memory_type = emu.memType.snesDebug,
        start_address = 0x7E1E00,
        size = 0x60
    }
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

local function mask_u16(value)
    if type(value) ~= "number" then
        return nil
    end
    return math.floor(value) % 0x10000
end

local function mask_u8(value)
    if type(value) ~= "number" then
        return nil
    end
    return math.floor(value) % 0x100
end

local function write_u16(address, value)
    emu.write16(address, mask_u16(value), emu.memType.snesDebug)
end

local function write_u8(address, value)
    emu.write(address, mask_u8(value), emu.memType.snesDebug)
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
        selector_1c82 = read_u16(0x7E1C82),
        selector_1ca8 = read_u16(0x7E1CA8),
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
        active_main_callback_addr = active_main_callback_addr,
        active_main_callback_bank = active_main_callback_bank,
        active_main_callback_snes = format_snes_ptr(active_main_callback_bank, active_main_callback_addr),
        active_nmi_callback_addr = active_nmi_callback_addr,
        active_nmi_callback_bank = active_nmi_callback_bank,
        active_nmi_callback_snes = format_snes_ptr(active_nmi_callback_bank, active_nmi_callback_addr),
        active_irq_callback_addr = active_irq_callback_addr,
        active_irq_callback_bank = active_irq_callback_bank,
        active_irq_callback_snes = format_snes_ptr(active_irq_callback_bank, active_irq_callback_addr),
        main_callback_snes = format_snes_ptr(active_main_callback_bank, active_main_callback_addr),
        nmi_callback_snes = format_snes_ptr(active_nmi_callback_bank, active_nmi_callback_addr),
        irq_callback_snes = format_snes_ptr(active_irq_callback_bank, active_irq_callback_addr),
        pending_main_callback_addr = pending_main_callback_addr,
        pending_main_callback_bank = pending_main_callback_bank,
        pending_main_callback_snes = format_snes_ptr(pending_main_callback_bank, pending_main_callback_addr),
        pending_nmi_callback_addr = pending_nmi_callback_addr,
        pending_nmi_callback_bank = pending_nmi_callback_bank,
        pending_nmi_callback_snes = format_snes_ptr(pending_nmi_callback_bank, pending_nmi_callback_addr),
        dp_0020 = read_u16(0x000020),
        state_0f70 = read_u8(0x000F70),
        state_0960 = read_u16(0x7E0960),
        state_0962 = read_u16(0x7E0962),
        state_0964 = read_u16(0x7E0964),
        state_0966 = read_u8(0x7E0966),
        state_0968 = read_u8(0x7E0968),
        state_096a = read_u8(0x7E096A),
        state_0972 = read_u16(0x7E0972),
        state_0990 = read_u16(0x7E0990),
        state_09a2 = read_u16(0x7E09A2),
        state_09a4 = read_u16(0x7E09A4),
        state_09a8 = read_u16(0x7E09A8),
        state_11a7 = read_u16(0x7E11A7),
        state_11cd = read_u16(0x7E11CD),
        state_11df = read_u16(0x7E11DF),
        state_11f1 = read_u16(0x7E11F1),
        state_11f3 = read_u16(0x7E11F3),
        state_11f5 = read_u16(0x7E11F5),
        state_129e = read_u16(0x7E129E),
        state_137c = read_u16(0x7E137C),
        state_18ee = read_u16(0x7E18EE),
        state_1c6a = read_u16(0x7E1C6A),
        state_1c70 = read_u16(0x7E1C70),
        state_1c74 = read_u16(0x7E1C74),
        state_1c76 = read_u16(0x7E1C76),
        state_1c84 = read_u16(0x7E1C84),
        state_1c86 = read_u16(0x7E1C86),
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
        state_1d08 = read_u16(0x7E1D08),
        state_1d10 = read_u16(0x7E1D10),
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
        dp_0056 = read_u8(0x000056),
        oam_072c = read_u16(0x7E072C),
        oam_072e = read_u16(0x7E072E),
        oam_0730 = read_u16(0x7E0730),
        oam_0732 = read_u16(0x7E0732),
        oam_0734 = read_u16(0x7E0734),
        oam_0736 = read_u16(0x7E0736),
        oam_0738 = read_u16(0x7E0738),
        oam_073a = read_u16(0x7E073A)
    }
end

local function dump_memory_region(path, memory_type, size)
    local bytes = {}
    for address = 0, size - 1 do
        bytes[#bytes + 1] = string.char(emu.read(address, memory_type))
    end
    write_binary_file(path, table.concat(bytes))
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
                words = {
                    raw[1] + (raw[2] * 0x100),
                    raw[3] + (raw[4] * 0x100),
                    raw[5] + (raw[6] * 0x100),
                    raw[7] + (raw[8] * 0x100)
                },
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
            else
                active_entries[#active_entries + 1] = {
                    slot = slot,
                    offset = slot * 8,
                    command = 0,
                    source_addr = 0,
                    transfer_size = 0,
                    vram_dest = 0,
                    words = {0, 0, 0, 0},
                    bytes_hex = "0000000000000000",
                    empty = true
                }
            end
            descriptor_count = descriptor_count + 1
            offset = (offset + 8) % 0x100
            guard = guard + 1
        end
    end

    return {
        nonzero_entries = nonzero_entries,
        nonzero_entry_count = #nonzero_entries,
        active_entries = active_entries,
        active_descriptor_count = descriptor_count
    }
end

local function capture_ppu_summary(full_state)
    local snapshot = full_state or emu.getState()
    return {
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_screen_layers = snapshot["ppu.mainScreenLayers"],
        sub_screen_layers = snapshot["ppu.subScreenLayers"],
        screen_brightness = snapshot["ppu.screenBrightness"],
        vram_address = snapshot["ppu.vramAddress"],
        cgram_address = snapshot["ppu.cgramAddress"],
        oam_base_address = snapshot["ppu.oamBaseAddress"],
        oam_address_offset = snapshot["ppu.oamAddressOffset"],
        mode7 = {
            hscroll = snapshot["ppu.mode7.hscroll"],
            vscroll = snapshot["ppu.mode7.vscroll"],
            center_x = snapshot["ppu.mode7.centerX"],
            center_y = snapshot["ppu.mode7.centerY"],
            large_map = snapshot["ppu.mode7.largeMap"],
            fill_with_tile0 = snapshot["ppu.mode7.fillWithTile0"],
            matrix = {
                snapshot["ppu.mode7.matrix[0]"],
                snapshot["ppu.mode7.matrix[1]"],
                snapshot["ppu.mode7.matrix[2]"],
                snapshot["ppu.mode7.matrix[3]"]
            }
        },
        window_mask_main = {
            snapshot["ppu.windowMaskMain[0]"],
            snapshot["ppu.windowMaskMain[1]"],
            snapshot["ppu.windowMaskMain[2]"],
            snapshot["ppu.windowMaskMain[3]"],
            snapshot["ppu.windowMaskMain[4]"]
        },
        window_mask_sub = {
            snapshot["ppu.windowMaskSub[0]"],
            snapshot["ppu.windowMaskSub[1]"],
            snapshot["ppu.windowMaskSub[2]"],
            snapshot["ppu.windowMaskSub[3]"],
            snapshot["ppu.windowMaskSub[4]"]
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
        vram = {
            size = #vram_bytes,
            checksum = rolling_checksum_bytes(vram_bytes)
        },
        cgram = {
            size = #cgram_bytes,
            checksum = rolling_checksum_bytes(cgram_bytes)
        },
        oam = {
            size = #oam_bytes,
            checksum = rolling_checksum_bytes(oam_bytes)
        }
    }
end

local function should_capture_frame(frame)
    return config.capture_frame_lookup[frame] or config.compare_frame_lookup[frame]
end

local function should_record_frame_snapshot(frame)
    if config.sample_every <= 1 then
        return true
    end

    if frame == 0 or frame == config.screenshot_frame or frame == (config.total_frames - 1) then
        return true
    end

    if should_capture_frame(frame) then
        return true
    end

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
            selector_1c78 = snapshot.selector_1c78,
            selector_1c80 = snapshot.selector_1c80,
            state_0202 = snapshot.state_0202,
            state_1c70 = snapshot.state_1c70,
            state_1c76 = snapshot.state_1c76,
            dp_0053 = snapshot.dp_0053,
            dp_0054 = snapshot.dp_0054
        }
        return
    end

    local changes = {}
    local callback_changed = false
    for _, field in ipairs(transition_watch_fields) do
        local before_value = previous[field]
        local after_value = snapshot[field]
        if before_value ~= after_value then
            if field == "main_callback_snes"
                or field == "nmi_callback_snes"
                or field == "irq_callback_snes"
                or field == "pending_main_callback_snes"
                or field == "pending_nmi_callback_snes" then
                callback_changed = true
            end

            changes[#changes + 1] = {
                field = field,
                before = before_value,
                after = after_value
            }
        end
    end

    if #changes == 0 then
        return
    end

    state.transition_events[#state.transition_events + 1] = {
        frame = snapshot.frame,
        type = callback_changed and "callback+state" or "state",
        callback_changed = callback_changed,
        change_count = #changes,
        changes = changes,
        main_callback_snes = snapshot.main_callback_snes,
        irq_callback_snes = snapshot.irq_callback_snes,
        pending_main_callback_snes = snapshot.pending_main_callback_snes,
        pending_nmi_callback_snes = snapshot.pending_nmi_callback_snes,
        state_0202 = snapshot.state_0202,
        state_1c70 = snapshot.state_1c70,
        state_1c76 = snapshot.state_1c76,
        dp_0053 = snapshot.dp_0053,
        dp_0054 = snapshot.dp_0054
    }
end

local function capture_frame_artifact(snapshot)
    local full_state = emu.getState()
    local regions, internal_regions = capture_region_payloads()
    local queue_summary = read_dma_queue_summary(snapshot.dp_0053, snapshot.dp_0054)
    local internal_ppu, summarized_ppu_memory = capture_ppu_memory_payloads()

    local artifact = {
        frame = snapshot.frame,
        state = snapshot,
        ppu = capture_ppu_summary(full_state),
        queue = queue_summary,
        regions = regions,
        ppu_memory = summarized_ppu_memory
    }

    local internal = {
        regions = internal_regions,
        ppu_memory = internal_ppu
    }

    local capture_prefix = string.format("%s_frame_%05d", output_prefix, snapshot.frame)
    if config.capture_screenshots then
        local screenshot_path = capture_prefix .. ".png"
        write_binary_file(screenshot_path, emu.takeScreenshot())
        artifact.screenshot_path = screenshot_path
    end
    if config.capture_ppu_memory then
        dump_ppu_snapshot(capture_prefix)
        artifact.ppu_dump_prefix = capture_prefix
    end
    if config.capture_wram_memory then
        dump_wram_snapshot(capture_prefix)
        artifact.wram_dump_prefix = capture_prefix
    end

    state.capture_artifacts[#state.capture_artifacts + 1] = artifact
    state.capture_lookup[snapshot.frame] = artifact
    state.capture_internal[snapshot.frame] = internal
end

local function compare_capture_state_fields(before_snapshot, after_snapshot)
    local changes = {}
    for _, field in ipairs(transition_watch_fields) do
        local before_value = before_snapshot[field]
        local after_value = after_snapshot[field]
        if before_value ~= after_value then
            changes[#changes + 1] = {
                field = field,
                before = before_value,
                after = after_value
            }
        end
    end
    return changes
end

local function build_capture_compare_pair(before_artifact, after_artifact)
    local before_internal = state.capture_internal[before_artifact.frame]
    local after_internal = state.capture_internal[after_artifact.frame]
    if before_internal == nil or after_internal == nil then
        return nil
    end

    local region_diffs = {}
    local changed_region_count = 0
    for _, spec in ipairs(capture_region_specs) do
        local diff = compare_byte_regions(before_internal.regions[spec.id], after_internal.regions[spec.id], 8)
        diff.label = spec.label
        region_diffs[spec.id] = diff
        if diff.changed_bytes > 0 then
            changed_region_count = changed_region_count + 1
        end
    end

    local ppu_memory_diffs = {
        vram = compare_byte_regions(before_internal.ppu_memory.vram, after_internal.ppu_memory.vram, 8),
        cgram = compare_byte_regions(before_internal.ppu_memory.cgram, after_internal.ppu_memory.cgram, 8),
        oam = compare_byte_regions(before_internal.ppu_memory.oam, after_internal.ppu_memory.oam, 8)
    }

    return {
        before_frame = before_artifact.frame,
        after_frame = after_artifact.frame,
        frame_delta = after_artifact.frame - before_artifact.frame,
        before_callbacks = {
            main = before_artifact.state.main_callback_snes,
            irq = before_artifact.state.irq_callback_snes,
            nmi = before_artifact.state.nmi_callback_snes
        },
        after_callbacks = {
            main = after_artifact.state.main_callback_snes,
            irq = after_artifact.state.irq_callback_snes,
            nmi = after_artifact.state.nmi_callback_snes
        },
        queue_transition = {
            before_read = before_artifact.state.dp_0053,
            before_write = before_artifact.state.dp_0054,
            after_read = after_artifact.state.dp_0053,
            after_write = after_artifact.state.dp_0054,
            before_active_descriptors = before_artifact.queue.active_descriptor_count,
            after_active_descriptors = after_artifact.queue.active_descriptor_count
        },
        state_changes = compare_capture_state_fields(before_artifact.state, after_artifact.state),
        changed_region_count = changed_region_count,
        region_diffs = region_diffs,
        ppu_memory_diffs = ppu_memory_diffs
    }
end

local function build_capture_compares()
    state.capture_compare_pairs = {}

    local previous_artifact = nil
    for _, frame in ipairs(config.compare_frames) do
        local artifact = state.capture_lookup[frame]
        if artifact ~= nil then
            if previous_artifact ~= nil then
                local pair = build_capture_compare_pair(previous_artifact, artifact)
                if pair ~= nil then
                    state.capture_compare_pairs[#state.capture_compare_pairs + 1] = pair
                end
            end
            previous_artifact = artifact
        end
    end
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
    if #config.trace_windows > 0 then
        for _, window in ipairs(config.trace_windows) do
            if state.frame >= window.start_frame and state.frame <= window.end_frame then
                return true
            end
        end
        return false
    end

    return state.frame >= config.trace_start_frame and state.frame <= config.trace_end_frame
end

local function save_probe_log()
    local output = {
        total_frames = config.total_frames,
        screenshot_frame = config.screenshot_frame,
        sample_every = config.sample_every,
        capture_frames = config.capture_frames,
        compare_frames = config.compare_frames,
        capture_screenshots = config.capture_screenshots,
        capture_ppu_memory = config.capture_ppu_memory,
        capture_wram_memory = config.capture_wram_memory,
        save_savestate_frame = config.save_savestate_frame,
        trace_start_frame = config.trace_start_frame,
        trace_end_frame = config.trace_end_frame,
        trace_windows = config.trace_windows,
        trace_mode7_writes = config.trace_mode7_writes,
        trace_dma_writes = config.trace_dma_writes,
        trace_vram_writes = config.trace_vram_writes,
        mode7_max_hits = config.mode7_max_hits,
        dma_max_hits = config.dma_max_hits,
        vram_max_hits = config.vram_max_hits,
        trace_exec_points = config.trace_exec_points,
        trigger_input_windows = config.trigger_input_windows,
        exec_point_max_hits = config.exec_point_max_hits,
        exec_point_max_hits_per_point = config.exec_point_max_hits_per_point,
        trace_write_points = config.trace_write_points,
        write_point_max_hits = config.write_point_max_hits,
        force_main_callback_start_frame = config.force_main_callback_start_frame,
        force_main_callback_end_frame = config.force_main_callback_end_frame,
        force_main_callback_addr = config.force_main_callback_addr,
        force_main_callback_bank = config.force_main_callback_bank,
        force_selectors_start_frame = config.force_selectors_start_frame,
        force_selectors_end_frame = config.force_selectors_end_frame,
        force_selector_1c78 = config.force_selector_1c78,
        force_selector_1c80 = config.force_selector_1c80,
        force_selector_1ca8 = config.force_selector_1ca8,
        force_selector_1c86 = config.force_selector_1c86,
        force_selector_1cac = config.force_selector_1cac,
        force_selector_1cae = config.force_selector_1cae,
        force_state_1d10 = config.force_state_1d10,
        force_selectors_on_b1f9 = config.force_selectors_on_b1f9,
        b1f9_exec_count = state.b1f9_exec_count,
        b1f9_exec_frames = state.b1f9_exec_frames,
        b1f9_stage_counts = state.b1f9_stage_counts,
        b1f9_stage_frames = state.b1f9_stage_frames,
        mode7_trace = {
            hit_count = #state.mode7_writes,
            dropped_hits = state.mode7_dropped_hits
        },
        dma_trace = {
            hit_count = #state.dma_writes,
            dropped_hits = state.dma_dropped_hits
        },
        vram_trace = {
            hit_count = #state.vram_writes,
            dropped_hits = state.vram_dropped_hits
        },
        exec_point_trace = {
            hit_count = #state.exec_point_hits,
            dropped_hits = state.exec_point_dropped_hits,
            first_frames = state.exec_point_first_frames,
            hits = state.exec_point_hits,
        },
        write_point_trace = {
            hit_count = #state.write_point_hits,
            dropped_hits = state.write_point_dropped_hits,
            hits = state.write_point_hits,
        },
        saved_savestate_path = state.saved_savestate_path,
        saved_savestate_error = state.saved_savestate_error,
        transition_events = state.transition_events,
        capture_artifacts = state.capture_artifacts,
        capture_compare_pairs = state.capture_compare_pairs,
        frames = state.entries,
    }
    write_text_file(output_prefix .. ".json", encode_json_value(output, ""))
end

local function save_probe_summary()
    local lines = {
        "# TD2 Deep Probe Summary",
        "",
        string.format("- total frames: `%d`", config.total_frames),
        string.format("- sampled frame entries: `%d`", #state.entries),
        string.format("- transition events: `%d`", #state.transition_events),
        string.format("- capture artifacts: `%d`", #state.capture_artifacts),
        string.format("- capture compare pairs: `%d`", #state.capture_compare_pairs),
        string.format("- exec hits: `%d`", #state.exec_point_hits),
        string.format("- write hits: `%d`", #state.write_point_hits),
        string.format("- `L001210` hits: `%d`", #state.l001210_hits),
        string.format("- mode7/dma/vram trace hits: `%d / %d / %d`", #state.mode7_writes, #state.dma_writes, #state.vram_writes),
        ""
    }

    if #state.capture_artifacts > 0 then
        lines[#lines + 1] = "## Capture Frames"
        lines[#lines + 1] = ""
        for _, artifact in ipairs(state.capture_artifacts) do
            lines[#lines + 1] = string.format(
                "- frame `%d`: callbacks `%s / %s / %s`, queue `%02X -> %02X`, active DMA descriptors `%d`",
                artifact.frame,
                artifact.state.main_callback_snes,
                artifact.state.irq_callback_snes,
                artifact.state.nmi_callback_snes,
                artifact.state.dp_0053 % 0x100,
                artifact.state.dp_0054 % 0x100,
                artifact.queue.active_descriptor_count
            )
        end
        lines[#lines + 1] = ""
    end

    if #state.capture_compare_pairs > 0 then
        lines[#lines + 1] = "## Compare Pairs"
        lines[#lines + 1] = ""
        for _, pair in ipairs(state.capture_compare_pairs) do
            lines[#lines + 1] = string.format(
                "- `%d -> %d`: state changes `%d`, changed regions `%d`, VRAM/CGRAM/OAM diffs `%d / %d / %d`",
                pair.before_frame,
                pair.after_frame,
                #pair.state_changes,
                pair.changed_region_count,
                pair.ppu_memory_diffs.vram.changed_bytes,
                pair.ppu_memory_diffs.cgram.changed_bytes,
                pair.ppu_memory_diffs.oam.changed_bytes
            )
        end
        lines[#lines + 1] = ""
    end

    if #state.transition_events > 0 then
        lines[#lines + 1] = "## Early Transition Highlights"
        lines[#lines + 1] = ""
        local shown = math.min(#state.transition_events, 16)
        for index = 1, shown do
            local event = state.transition_events[index]
            if event.type == "initial" then
                lines[#lines + 1] = string.format(
                    "- frame `%d`: initial `%s / %s`, `$0202=%s`, `$1C70=%s`, `$1C76=%s`",
                    event.frame,
                    tostring(event.main_callback_snes),
                    tostring(event.irq_callback_snes),
                    tostring(event.state_0202),
                    tostring(event.state_1c70),
                    tostring(event.state_1c76)
                )
            else
                lines[#lines + 1] = string.format(
                    "- frame `%d`: `%s`, `%d` watched fields changed, main `%s`, irq `%s`",
                    event.frame,
                    event.type,
                    event.change_count,
                    tostring(event.main_callback_snes),
                    tostring(event.irq_callback_snes)
                )
            end
        end
        lines[#lines + 1] = ""
    end

    write_text_file(output_prefix .. "_summary.md", table.concat(lines, "\n"))
end

local function apply_forced_main_callback(frame)
    if config.force_main_callback_start_frame < 0 or frame < config.force_main_callback_start_frame then
        return
    end

    if config.force_main_callback_end_frame >= 0 and frame > config.force_main_callback_end_frame then
        return
    end

    if config.force_main_callback_addr >= 0 then
        write_u16(0x000038, config.force_main_callback_addr)
    end
    if config.force_main_callback_bank >= 0 then
        write_u8(0x00003A, config.force_main_callback_bank)
    end
end

local function apply_forced_selectors(frame)
    if config.force_selectors_start_frame < 0 or frame < config.force_selectors_start_frame then
        return
    end

    if config.force_selectors_end_frame >= 0 and frame > config.force_selectors_end_frame then
        return
    end

    if config.force_selector_1c78 >= 0 then
        write_u16(0x7E1C78, config.force_selector_1c78)
    end
    if config.force_selector_1c80 >= 0 then
        write_u16(0x7E1C80, config.force_selector_1c80)
    end
    if config.force_selector_1ca8 >= 0 then
        write_u16(0x7E1CA8, config.force_selector_1ca8)
    end
    if config.force_selector_1c86 >= 0 then
        write_u16(0x7E1C86, config.force_selector_1c86)
    end
    if config.force_selector_1cac >= 0 then
        write_u16(0x7E1CAC, config.force_selector_1cac)
    end
    if config.force_selector_1cae >= 0 then
        write_u16(0x7E1CAE, config.force_selector_1cae)
    end
    if config.force_state_1d10 >= 0 then
        write_u16(0x7E1D10, config.force_state_1d10)
    end
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
        trace_windows = config.trace_windows,
        max_hits = config.mode7_max_hits,
        hit_count = #state.mode7_writes,
        dropped_hits = state.mode7_dropped_hits,
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
        trace_windows = config.trace_windows,
        max_hits = config.dma_max_hits,
        hit_count = #state.dma_writes,
        dropped_hits = state.dma_dropped_hits,
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
        trace_windows = config.trace_windows,
        max_hits = config.vram_max_hits,
        hit_count = #state.vram_writes,
        dropped_hits = state.vram_dropped_hits,
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
        known_callsites = l001210_known_callsites,
        hits = state.l001210_hits
    }
    write_text_file(output_prefix .. "_l001210_exec.json", encode_json_value(output, ""))
end

local function reset_probe_state()
    state.frame = 0
    state.finished = false
    state.entries = {}
    state.mode7_writes = {}
    state.mode7_dropped_hits = 0
    state.dma_writes = {}
    state.dma_dropped_hits = 0
    state.vram_writes = {}
    state.vram_dropped_hits = 0
    state.l001210_hits = {}
    state.l001210_dropped_hits = 0
    state.exec_point_hits = {}
    state.exec_point_hit_counts = {}
    state.exec_point_first_frames = {}
    state.exec_point_dropped_hits = 0
    state.write_point_hits = {}
    state.write_point_dropped_hits = 0
    state.last_l001210_callsite = nil
    state.b1f9_exec_count = 0
    state.b1f9_exec_frames = {}
    state.b1f9_stage_counts = new_b1f9_stage_counts()
    state.b1f9_stage_frames = new_b1f9_stage_frames()
    state.saved_savestate_path = nil
    state.saved_savestate_error = nil
    state.last_snapshot = nil
    state.transition_events = {}
    state.capture_artifacts = {}
    state.capture_compare_pairs = {}
    state.capture_lookup = {}
    state.capture_internal = {}
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

    local snapshot = snapshot_boot_state()
    record_transition_event(snapshot)

    if should_record_frame_snapshot(state.frame) then
        state.entries[#state.entries + 1] = snapshot
    end

    if should_capture_frame(state.frame) then
        capture_frame_artifact(snapshot)
    end

    if state.frame == config.screenshot_frame then
        write_binary_file(output_prefix .. "_frame.png", emu.takeScreenshot())
        if config.dump_ppu_memory then
            dump_ppu_snapshot(output_prefix)
        end
        if config.dump_wram_memory then
            dump_wram_snapshot(output_prefix)
        end
    end

    state.last_snapshot = snapshot

    state.frame = state.frame + 1

    if state.frame >= config.total_frames then
        build_capture_compares()
        save_probe_log()
        save_probe_summary()
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

    apply_forced_main_callback(state.frame)
    apply_forced_selectors(state.frame)

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

    if config.mode7_max_hits > 0 and #state.mode7_writes >= config.mode7_max_hits then
        state.mode7_dropped_hits = state.mode7_dropped_hits + 1
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

    if config.dma_max_hits > 0 and #state.dma_writes >= config.dma_max_hits then
        state.dma_dropped_hits = state.dma_dropped_hits + 1
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

    if config.vram_max_hits > 0 and #state.vram_writes >= config.vram_max_hits then
        state.vram_dropped_hits = state.vram_dropped_hits + 1
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

local function derive_l00a9_source(callsite_linear, table_index)
    if table_index == nil then
        return nil
    end

    local index = mask_u16(table_index)
    if index == nil then
        return nil
    end

    local pointer_base = nil
    local bank_base = nil
    local table_name = nil
    if callsite_linear == 0x01A9BD then
        pointer_base = 0x01A789
        bank_base = 0x01A7D3
        table_name = "L00A9A0"
    elseif callsite_linear == 0x01A9E1 then
        pointer_base = 0x01A842
        bank_base = 0x01A888
        table_name = "L00A9CB"
    else
        return nil
    end

    local source_addr = read_u16(pointer_base + (index * 2))
    local source_bank = read_u8(bank_base + index)
    local source_linear = (source_bank * 0x10000) + source_addr
    return {
        table_name = table_name,
        table_index = index,
        source_addr = source_addr,
        source_bank = source_bank,
        source_linear = source_linear,
        source_snes = format_snes_ptr(source_bank, source_addr)
    }
end

local function make_l001210_callsite_callback(callsite)
    return function()
        if state.finished or not config.trace_l001210_exec then
            return
        end

        local cpu_state = emu.getState()
        local reg_a = mask_u16(cpu_state["cpu.a"])
        local reg_x = mask_u16(cpu_state["cpu.x"])
        local reg_y = mask_u16(cpu_state["cpu.y"])
        local reg_pc = mask_u16(cpu_state["cpu.pc"])
        local reg_sp = mask_u16(cpu_state["cpu.sp"])
        local reg_ps = mask_u16(cpu_state["cpu.ps"])
        local reg_d = mask_u16(cpu_state["cpu.d"])
        local reg_dbr = mask_u16(cpu_state["cpu.dbr"])
        local reg_k = mask_u16(cpu_state["cpu.k"])

        local l00a9_index = nil
        if callsite.pc_linear == 0x01A9BD or callsite.pc_linear == 0x01A9E1 then
            l00a9_index = reg_x
        end
        local l00a9_source = derive_l00a9_source(callsite.pc_linear, l00a9_index)

        state.last_l001210_callsite = {
            frame = state.frame,
            pc_linear = callsite.pc_linear,
            pc_snes = callsite.pc_snes,
            id = callsite.id,
            reg_a = reg_a,
            reg_x = reg_x,
            reg_y = reg_y,
            reg_pc = reg_pc,
            reg_sp = reg_sp,
            reg_ps = reg_ps,
            reg_d = reg_d,
            reg_dbr = reg_dbr,
            reg_k = reg_k,
            l00a9_table = l00a9_source and l00a9_source.table_name or nil,
            l00a9_table_index = l00a9_source and l00a9_source.table_index or nil,
            l00a9_source_linear = l00a9_source and l00a9_source.source_linear or nil,
            l00a9_source_snes = l00a9_source and l00a9_source.source_snes or nil
        }
    end
end

local function make_exec_point_callback(point)
    return function()
        if state.finished or not is_trace_frame() then
            return
        end

        local hit_count_for_point = state.exec_point_hit_counts[point.linear] or 0
        if config.exec_point_max_hits_per_point > 0
            and hit_count_for_point >= config.exec_point_max_hits_per_point then
            state.exec_point_dropped_hits = state.exec_point_dropped_hits + 1
            return
        end

        if config.exec_point_max_hits > 0 and #state.exec_point_hits >= config.exec_point_max_hits then
            state.exec_point_dropped_hits = state.exec_point_dropped_hits + 1
            return
        end

        if state.exec_point_first_frames[point.id] == nil then
            state.exec_point_first_frames[point.id] = state.frame
        end

        local cpu_state = emu.getState()
        local reg_a = mask_u16(cpu_state["cpu.a"])
        local reg_x = mask_u16(cpu_state["cpu.x"])
        local reg_y = mask_u16(cpu_state["cpu.y"])
        local reg_pc = mask_u16(cpu_state["cpu.pc"])
        local reg_sp = mask_u16(cpu_state["cpu.sp"])
        local reg_ps = mask_u16(cpu_state["cpu.ps"])
        local reg_d = mask_u16(cpu_state["cpu.d"])
        local reg_dbr = mask_u16(cpu_state["cpu.dbr"])
        local reg_k = mask_u16(cpu_state["cpu.k"])
        local stack_addr = mask_u16(reg_sp + 1)
        local stack_bytes = {}
        if stack_addr ~= nil then
            for offset = 0, 7 do
                stack_bytes[#stack_bytes + 1] = read_u8(0x000000 + ((stack_addr + offset) % 0x10000))
            end
        end

        local stack_return_minus_one = nil
        local stack_return_rts = nil
        if #stack_bytes >= 2 then
            stack_return_minus_one = stack_bytes[1] + (stack_bytes[2] * 0x100)
            stack_return_rts = (stack_return_minus_one + 1) % 0x10000
        end

        state.exec_point_hits[#state.exec_point_hits + 1] = {
            frame = state.frame,
            point_id = point.id,
            point_snes = point.snes,
            point_linear = point.linear,
            cpu_a = reg_a,
            cpu_x = reg_x,
            cpu_y = reg_y,
            cpu_pc = reg_pc,
            cpu_sp = reg_sp,
            cpu_ps = reg_ps,
            cpu_d = reg_d,
            cpu_dbr = reg_dbr,
            cpu_k = reg_k,
            stack_addr = stack_addr,
            stack_bytes = stack_bytes,
            stack_return_minus_one = stack_return_minus_one,
            stack_return_rts = stack_return_rts,
            active_main_callback_addr = read_u16(0x000038),
            active_main_callback_bank = read_u8(0x00003A),
            selector_1c78 = read_u16(0x7E1C78),
            selector_1c80 = read_u16(0x7E1C80),
            selector_1ca8 = read_u16(0x7E1CA8),
            selector_1c86 = read_u16(0x7E1C86),
            selector_1cac = read_u16(0x7E1CAC),
            selector_1cae = read_u16(0x7E1CAE),
            state_0960 = read_u16(0x7E0960),
            state_0964 = read_u16(0x7E0964),
            state_0f42 = read_u16(0x000F42),
            state_0f77 = read_u16(0x000F77),
            state_0202 = read_u16(0x7E0202),
            state_0204 = read_u16(0x7E0204),
            state_0206 = read_u16(0x7E0206),
            state_0208 = read_u16(0x7E0208),
            state_1d10 = read_u16(0x7E1D10),
            dp_000c = read_u16(0x00000C),
            dp_000e = read_u16(0x00000E),
            dp_0010 = read_u16(0x000010),
            dp_0054 = read_u8(0x000054),
        }
        state.exec_point_hit_counts[point.linear] = hit_count_for_point + 1
    end
end

local function make_write_point_callback(point)
    return function(address, value)
        if state.finished or not is_trace_frame() then
            return
        end

        if config.write_point_max_hits > 0 and #state.write_point_hits >= config.write_point_max_hits then
            state.write_point_dropped_hits = state.write_point_dropped_hits + 1
            return
        end

        local snapshot = emu.getState()
        local reg_a = mask_u16(snapshot["cpu.a"])
        local reg_x = mask_u16(snapshot["cpu.x"])
        local reg_y = mask_u16(snapshot["cpu.y"])
        local reg_pc = mask_u16(snapshot["cpu.pc"])
        local reg_sp = mask_u16(snapshot["cpu.sp"])
        local reg_ps = mask_u16(snapshot["cpu.ps"])
        local reg_d = mask_u16(snapshot["cpu.d"])
        local reg_dbr = mask_u16(snapshot["cpu.dbr"])
        local reg_k = mask_u16(snapshot["cpu.k"])
        state.write_point_hits[#state.write_point_hits + 1] = {
            frame = state.frame,
            point_id = point.id,
            point_snes = point.snes,
            point_linear = point.linear,
            address = address,
            value = value,
            scanline = snapshot["ppu.scanline"],
            bg_mode = snapshot["ppu.bgMode"],
            main_screen_layers = snapshot["ppu.mainScreenLayers"],
            sub_screen_layers = snapshot["ppu.subScreenLayers"],
            cpu_a = reg_a,
            cpu_x = reg_x,
            cpu_y = reg_y,
            cpu_pc = reg_pc,
            cpu_sp = reg_sp,
            cpu_ps = reg_ps,
            cpu_d = reg_d,
            cpu_dbr = reg_dbr,
            cpu_k = reg_k,
            active_main_callback_addr = read_u16(0x000038),
            active_main_callback_bank = read_u8(0x00003A),
            active_irq_callback_addr = read_u16(0x00003E),
            active_irq_callback_bank = read_u8(0x000040),
            selector_1c78 = read_u16(0x7E1C78),
            selector_1c80 = read_u16(0x7E1C80),
            selector_1ca8 = read_u16(0x7E1CA8),
            selector_1c86 = read_u16(0x7E1C86),
            selector_1cac = read_u16(0x7E1CAC),
            selector_1cae = read_u16(0x7E1CAE),
            state_0960 = read_u16(0x7E0960),
            state_0964 = read_u16(0x7E0964),
            state_0968 = read_u16(0x7E0968),
            state_0974 = read_u16(0x7E0974),
            state_0f42 = read_u16(0x000F42),
            state_0f77 = read_u16(0x000F77),
            state_1d10 = read_u16(0x7E1D10),
            dp_0054 = read_u8(0x000054),
        }
    end
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
    local selector_1c78 = read_u16(0x7E1C78)
    local selector_1c80 = read_u16(0x7E1C80)
    local selector_1ca8 = read_u16(0x7E1CA8)
    local caller = state.last_l001210_callsite
    local caller_matches_frame = caller ~= nil and caller.frame == state.frame

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
        caller_id = caller_matches_frame and caller.id or nil,
        caller_pc_linear = caller_matches_frame and caller.pc_linear or nil,
        caller_pc_snes = caller_matches_frame and caller.pc_snes or nil,
        caller_reg_a = caller_matches_frame and caller.reg_a or nil,
        caller_reg_x = caller_matches_frame and caller.reg_x or nil,
        caller_reg_y = caller_matches_frame and caller.reg_y or nil,
        caller_reg_pc = caller_matches_frame and caller.reg_pc or nil,
        caller_reg_sp = caller_matches_frame and caller.reg_sp or nil,
        caller_reg_ps = caller_matches_frame and caller.reg_ps or nil,
        caller_reg_d = caller_matches_frame and caller.reg_d or nil,
        caller_reg_dbr = caller_matches_frame and caller.reg_dbr or nil,
        caller_reg_k = caller_matches_frame and caller.reg_k or nil,
        caller_l00a9_table = caller_matches_frame and caller.l00a9_table or nil,
        caller_l00a9_table_index = caller_matches_frame and caller.l00a9_table_index or nil,
        caller_l00a9_source_linear = caller_matches_frame and caller.l00a9_source_linear or nil,
        caller_l00a9_source_snes = caller_matches_frame and caller.l00a9_source_snes or nil,
        caller_l00a9_source_matches = caller_matches_frame and caller.l00a9_source_linear ~= nil and caller.l00a9_source_linear == source_linear or nil,
        selector_1c78 = selector_1c78,
        selector_1c80 = selector_1c80,
        selector_1ca8 = selector_1ca8,
        selector_1c86 = read_u16(0x7E1C86),
        selector_1cac = read_u16(0x7E1CAC),
        selector_1cae = read_u16(0x7E1CAE),
        state_0202 = read_u16(0x7E0202),
        state_0208 = read_u16(0x7E0208),
        state_1d10 = read_u16(0x7E1D10),
        dp_0054 = read_u8(0x000054)
    }

    state.last_l001210_callsite = nil
end

local function resolve_triggered_input_pattern(frame)
    if #config.trigger_input_windows == 0 then
        return nil
    end

    for _, window in ipairs(config.trigger_input_windows) do
        local trigger_frame = state.exec_point_first_frames[window.point_id]
        if trigger_frame ~= nil then
            local start_frame = trigger_frame + window.start_offset
            local end_frame = trigger_frame + window.end_offset
            if frame >= start_frame and frame <= end_frame then
                return window.pattern
            end
        end
    end

    return nil
end

local function resolve_active_input_pattern(frame)
    if #config.input_windows > 0 then
        for _, window in ipairs(config.input_windows) do
            if frame >= window.start_frame and frame <= window.end_frame then
                return window.pattern
            end
        end

        local triggered_pattern = resolve_triggered_input_pattern(frame)
        if triggered_pattern ~= nil then
            return triggered_pattern
        end

        return nil
    end

    local triggered_pattern = resolve_triggered_input_pattern(frame)
    if triggered_pattern ~= nil then
        return triggered_pattern
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

local function on_b1f9_exec()
    if state.finished then
        return
    end
    state.b1f9_exec_count = state.b1f9_exec_count + 1
    if #state.b1f9_exec_frames < 64 then
        state.b1f9_exec_frames[#state.b1f9_exec_frames + 1] = state.frame
    end
    apply_forced_selectors(state.frame)
end

local function mark_b1f9_stage(stage_key)
    if state.finished then
        return
    end

    local stage_counts = state.b1f9_stage_counts
    local stage_frames = state.b1f9_stage_frames
    if stage_counts == nil or stage_frames == nil then
        return
    end

    if stage_counts[stage_key] == nil then
        stage_counts[stage_key] = 0
    end
    stage_counts[stage_key] = stage_counts[stage_key] + 1

    local frames = stage_frames[stage_key]
    if type(frames) == "table" and #frames < 64 then
        frames[#frames + 1] = state.frame
    end
end

local function on_b1f9_stage_b226()
    mark_b1f9_stage("b226")
end

local function on_b1f9_stage_b256()
    mark_b1f9_stage("b256")
end

local function on_b1f9_stage_b273()
    mark_b1f9_stage("b273")
end

local function on_b1f9_stage_b59b()
    mark_b1f9_stage("b59b")
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
if config.trace_l001210_exec or config.force_selectors_on_b1f9 then
    emu.addMemoryCallback(on_b1f9_exec, emu.callbackType.exec, 0x01B1F9, 0x01B1F9)
    emu.addMemoryCallback(on_b1f9_stage_b226, emu.callbackType.exec, 0x01B226, 0x01B226)
    emu.addMemoryCallback(on_b1f9_stage_b256, emu.callbackType.exec, 0x01B256, 0x01B256)
    emu.addMemoryCallback(on_b1f9_stage_b273, emu.callbackType.exec, 0x01B273, 0x01B273)
    emu.addMemoryCallback(on_b1f9_stage_b59b, emu.callbackType.exec, 0x01B59B, 0x01B59B)
end
if config.trace_l001210_exec then
    for _, callsite in ipairs(l001210_known_callsites) do
        local callback = make_l001210_callsite_callback(callsite)
        emu.addMemoryCallback(callback, emu.callbackType.exec, callsite.pc_linear, callsite.pc_linear)
    end
    emu.addMemoryCallback(on_l001210_exec, emu.callbackType.exec, 0x009210, 0x009210)
end
if #config.trace_exec_points > 0 then
    for _, point in ipairs(config.trace_exec_points) do
        local callback = make_exec_point_callback(point)
        emu.addMemoryCallback(callback, emu.callbackType.exec, point.linear, point.linear)
    end
end
if #config.trace_write_points > 0 then
    for _, point in ipairs(config.trace_write_points) do
        local callback = make_write_point_callback(point)
        emu.addMemoryCallback(callback, emu.callbackType.write, point.linear, point.linear)
    end
end
