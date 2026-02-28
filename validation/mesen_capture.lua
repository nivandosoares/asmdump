local config = {
    warmup_frames = 60,
    capture_frames = 300,
    screenshot_every = 1,
    player = 0,
    savestate_filename = "seed_state.bin",
    input_pattern = {
        b = true
    }
}

local state = {
    frame = 0,
    finished = false,
    entries = {},
    savestate_attempted = false,
    exec_callback_ref = nil
}

local script_data_dir = emu.getScriptDataFolder()
local output_prefix = script_data_dir .. "/td2_track1_accel"

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
    return value:gsub("\\", "\\\\"):gsub("\"", "\\\"")
end

local function encode_input_pattern(pattern)
    local keys = {}
    for key, pressed in pairs(pattern) do
        if pressed then
            keys[#keys + 1] = key
        end
    end
    table.sort(keys)

    local parts = {}
    for i = 1, #keys do
        parts[#parts + 1] = "\"" .. json_escape(keys[i]) .. "\""
    end
    return "[" .. table.concat(parts, ", ") .. "]"
end

local function save_capture_log()
    local lines = {
        "{",
        "  \"warmup_frames\": " .. tostring(config.warmup_frames) .. ",",
        "  \"capture_frames\": " .. tostring(config.capture_frames) .. ",",
        "  \"screenshot_every\": " .. tostring(config.screenshot_every) .. ",",
        "  \"frames\": ["
    }

    for i = 1, #state.entries do
        local entry = state.entries[i]
        local suffix = i == #state.entries and "" or ","
        lines[#lines + 1] =
            "    {\"frame\": " .. tostring(entry.frame) ..
            ", \"capture_index\": " .. tostring(entry.capture_index) ..
            ", \"buttons\": " .. encode_input_pattern(entry.buttons) .. "}" .. suffix
    end

    lines[#lines + 1] = "  ]"
    lines[#lines + 1] = "}"

    write_text_file(output_prefix .. "_input_log.json", table.concat(lines, "\n"))
end

local function clone_input_pattern(pattern)
    local copy = {}
    for key, pressed in pairs(pattern) do
        copy[key] = pressed
    end
    return copy
end

local function reset_capture_state()
    state.frame = 0
    state.finished = false
    state.entries = {}
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
        if savestate_path ~= nil then
            emu.displayMessage("TD2 Capture", "No savestate found at " .. savestate_path .. ". Continuing from power-on.")
        else
            emu.displayMessage("TD2 Capture", "No savestate configured. Continuing from power-on.")
        end
        return
    end

    reset_capture_state()

    local ok, err = pcall(emu.loadSavestate, savestate_data)
    if not ok then
        state.finished = true
        emu.displayMessage("TD2 Capture", "Savestate load failed: " .. tostring(err))
        emu.stop(1)
        return
    end

    emu.displayMessage("TD2 Capture", "Seed savestate loaded from " .. savestate_path)
end

local function on_input_polled()
    if state.finished then
        return
    end

    local active_start = config.warmup_frames
    local active_end = config.warmup_frames + config.capture_frames
    local active = state.frame >= active_start and state.frame < active_end

    if active then
        emu.setInput(config.input_pattern, config.player)
    end
end

local function on_end_frame()
    if state.finished then
        return
    end

    local active_start = config.warmup_frames
    local active_end = config.warmup_frames + config.capture_frames
    local active = state.frame >= active_start and state.frame < active_end

    if active then
        local capture_index = state.frame - active_start
        state.entries[#state.entries + 1] = {
            frame = state.frame,
            capture_index = capture_index,
            buttons = clone_input_pattern(config.input_pattern)
        }

        if (capture_index % config.screenshot_every) == 0 then
            local screenshot_path = string.format(
                "%s_frame_%05d.png",
                output_prefix,
                capture_index
            )
            write_binary_file(screenshot_path, emu.takeScreenshot())
        end
    end

    state.frame = state.frame + 1

    if state.frame >= active_end then
        save_capture_log()
        state.finished = true
        emu.displayMessage("TD2 Capture", "Capture finished. Files written to " .. output_prefix .. "_*.png/json")
        emu.stop(0)
    end
end

emu.displayMessage("TD2 Capture", "Script armed. Warm-up for " .. tostring(config.warmup_frames) .. " frames.")
if savestate_path ~= nil then
    state.exec_callback_ref = emu.addMemoryCallback(on_first_exec, emu.callbackType.exec, 0x000000, 0xFFFFFF)
end
emu.addEventCallback(on_input_polled, emu.eventType.inputPolled)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
