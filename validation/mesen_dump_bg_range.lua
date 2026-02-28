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

local function dump_memory_region(path, memory_type, size)
    local bytes = {}
    for address = 0, size - 1 do
        bytes[#bytes + 1] = string.char(emu.read(address, memory_type))
    end
    write_binary_file(path, table.concat(bytes))
end

local config = {
    start_frame = env_number("TD2_BG_RANGE_START_FRAME", 0),
    end_frame = env_number("TD2_BG_RANGE_END_FRAME", 0),
    step = env_number("TD2_BG_RANGE_STEP", 1),
    dump_oam = env_number("TD2_BG_RANGE_DUMP_OAM", 0) ~= 0,
    dump_screenshots = env_number("TD2_BG_RANGE_DUMP_SCREENSHOTS", 0) ~= 0,
    savestate_filename = "seed_state.bin"
}

if config.end_frame < config.start_frame then
    config.end_frame = config.start_frame
end

if config.step <= 0 then
    config.step = 1
end

config.total_frames = config.end_frame + 1

local state = {
    frame = 0,
    finished = false,
    savestate_attempted = false,
    exec_callback_ref = nil,
    captured = {}
}

local script_data_dir = emu.getScriptDataFolder()
local output_prefix = os.getenv("TD2_BG_RANGE_OUTPUT_PREFIX") or (script_data_dir .. "/td2_bg_range")

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

local function reset_state()
    state.frame = 0
    state.finished = false
    state.captured = {}
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

    reset_state()

    local ok, err = pcall(emu.loadSavestate, savestate_data)
    if not ok then
        state.finished = true
        emu.displayMessage("TD2 BG Range", "Savestate load failed: " .. tostring(err))
        emu.stop(1)
        return
    end
end

local function should_capture_frame(frame)
    if frame < config.start_frame or frame > config.end_frame then
        return false
    end
    return ((frame - config.start_frame) % config.step) == 0
end

local function capture_frame(frame)
    local prefix = string.format("%s_frame_%05d", output_prefix, frame)
    local filtered_state = filter_state_snapshot(emu.getState())
    filtered_state.frame = frame

    dump_memory_region(prefix .. "_vram.bin", emu.memType.snesVideoRam, emu.getMemorySize(emu.memType.snesVideoRam))
    dump_memory_region(prefix .. "_cgram.bin", emu.memType.snesCgRam, emu.getMemorySize(emu.memType.snesCgRam))
    if config.dump_oam then
        dump_memory_region(prefix .. "_oam.bin", emu.memType.snesSpriteRam, emu.getMemorySize(emu.memType.snesSpriteRam))
    end
    write_text_file(prefix .. "_ppu_state.json", encode_json_value(filtered_state, ""))

    local entry = {
        frame = frame,
        vram = prefix .. "_vram.bin",
        cgram = prefix .. "_cgram.bin",
        ppu_state = prefix .. "_ppu_state.json"
    }

    if config.dump_oam then
        entry.oam = prefix .. "_oam.bin"
    end
    if config.dump_screenshots then
        local screenshot_path = prefix .. "_frame.png"
        write_binary_file(screenshot_path, emu.takeScreenshot())
        entry.screenshot = screenshot_path
    end

    state.captured[#state.captured + 1] = entry
end

local function save_summary()
    local summary = {
        start_frame = config.start_frame,
        end_frame = config.end_frame,
        step = config.step,
        total_frames = config.total_frames,
        dump_oam = config.dump_oam,
        dump_screenshots = config.dump_screenshots,
        output_prefix = output_prefix,
        captured = state.captured
    }

    write_text_file(output_prefix .. ".json", encode_json_value(summary, ""))
end

local function on_end_frame()
    if state.finished then
        return
    end

    if should_capture_frame(state.frame) then
        capture_frame(state.frame)
    end

    state.frame = state.frame + 1

    if state.frame >= config.total_frames then
        save_summary()
        state.finished = true
        emu.displayMessage("TD2 BG Range", "Capture finished. Files written to " .. output_prefix .. ".*")
        emu.stop(0)
    end
end

emu.displayMessage(
    "TD2 BG Range",
    "Script armed for frames " .. tostring(config.start_frame) .. "-" .. tostring(config.end_frame) .. " step " .. tostring(config.step)
)
if savestate_path ~= nil then
    state.exec_callback_ref = emu.addMemoryCallback(on_first_exec, emu.callbackType.exec, 0x000000, 0xFFFFFF)
end
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
