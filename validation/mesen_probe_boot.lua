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
    trace_exec_points = parse_exec_point_env("TD2_BOOT_PROBE_TRACE_EXEC_POINTS"),
    exec_point_max_hits = env_number("TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS", 128),
    trace_write_points = parse_exec_point_env("TD2_BOOT_PROBE_TRACE_WRITE_POINTS"),
    write_point_max_hits = env_number("TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS", 256),
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
    dma_writes = {},
    vram_writes = {},
    l001210_hits = {},
    l001210_dropped_hits = 0,
    exec_point_hits = {},
    exec_point_dropped_hits = 0,
    write_point_hits = {},
    write_point_dropped_hits = 0,
    last_l001210_callsite = nil,
    b1f9_exec_count = 0,
    b1f9_exec_frames = {},
    saved_savestate_path = nil,
    saved_savestate_error = nil,
    savestate_attempted = false,
    exec_callback_ref = nil
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
        active_main_callback_addr = read_u16(0x000038),
        active_main_callback_bank = read_u8(0x00003A),
        active_nmi_callback_addr = read_u16(0x00003B),
        active_nmi_callback_bank = read_u8(0x00003D),
        active_irq_callback_addr = read_u16(0x00003E),
        active_irq_callback_bank = read_u8(0x000040),
        dp_0020 = read_u16(0x000020),
        state_0f70 = read_u8(0x000F70),
        state_0960 = read_u16(0x7E0960),
        state_0962 = read_u16(0x7E0962),
        state_0990 = read_u16(0x7E0990),
        state_09a2 = read_u16(0x7E09A2),
        state_09a4 = read_u16(0x7E09A4),
        state_09a8 = read_u16(0x7E09A8),
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
        trace_exec_points = config.trace_exec_points,
        exec_point_max_hits = config.exec_point_max_hits,
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
        exec_point_trace = {
            hit_count = #state.exec_point_hits,
            dropped_hits = state.exec_point_dropped_hits,
            hits = state.exec_point_hits,
        },
        write_point_trace = {
            hit_count = #state.write_point_hits,
            dropped_hits = state.write_point_dropped_hits,
            hits = state.write_point_hits,
        },
        saved_savestate_path = state.saved_savestate_path,
        saved_savestate_error = state.saved_savestate_error,
        frames = state.entries,
    }
    write_text_file(output_prefix .. ".json", encode_json_value(output, ""))
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
    state.dma_writes = {}
    state.vram_writes = {}
    state.l001210_hits = {}
    state.l001210_dropped_hits = 0
    state.exec_point_hits = {}
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
        if state.finished then
            return
        end

        if config.exec_point_max_hits > 0 and #state.exec_point_hits >= config.exec_point_max_hits then
            state.exec_point_dropped_hits = state.exec_point_dropped_hits + 1
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
