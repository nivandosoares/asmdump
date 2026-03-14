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
    return parse_button_pattern(os.getenv(name))
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
    warmup_frames = env_number("TD2_CAPTURE_WARMUP_FRAMES", 60),
    capture_frames = env_number("TD2_CAPTURE_FRAMES", 300),
    screenshot_every = env_number("TD2_CAPTURE_SCREENSHOT_EVERY", 1),
    player = env_number("TD2_CAPTURE_PLAYER", 0),
    savestate_filename = "seed_state.bin",
    input_start_frame = env_number("TD2_CAPTURE_INPUT_START_FRAME", -1),
    input_end_frame = env_number("TD2_CAPTURE_INPUT_END_FRAME", -1),
    input_pattern = parse_input_env("TD2_CAPTURE_INPUT"),
    input_windows = parse_input_windows_env("TD2_CAPTURE_INPUT_WINDOWS")
}

if config.warmup_frames < 0 then
    config.warmup_frames = 0
end

if config.capture_frames < 0 then
    config.capture_frames = 0
end

if config.screenshot_every <= 0 then
    config.screenshot_every = 1
end

if config.input_end_frame >= 0 and config.input_start_frame >= 0 and config.input_end_frame < config.input_start_frame then
    config.input_end_frame = config.input_start_frame
end

local state = {
    frame = 0,
    finished = false,
    entries = {},
    savestate_attempted = false,
    exec_callback_ref = nil
}

local script_data_dir = emu.getScriptDataFolder()
local output_prefix = os.getenv("TD2_CAPTURE_OUTPUT_PREFIX") or (script_data_dir .. "/td2_track1_accel")

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

local function encode_input_windows(windows)
    local parts = {}
    for i = 1, #windows do
        local window = windows[i]
        parts[#parts + 1] = string.format(
            "{\"start_frame\": %d, \"end_frame\": %d, \"buttons\": %s}",
            window.start_frame,
            window.end_frame,
            encode_input_pattern(window.pattern)
        )
    end
    return "[" .. table.concat(parts, ", ") .. "]"
end

local function save_capture_log()
    local lines = {
        "{",
        "  \"warmup_frames\": " .. tostring(config.warmup_frames) .. ",",
        "  \"capture_frames\": " .. tostring(config.capture_frames) .. ",",
        "  \"screenshot_every\": " .. tostring(config.screenshot_every) .. ",",
        "  \"player\": " .. tostring(config.player) .. ",",
        "  \"input_start_frame\": " .. tostring(config.input_start_frame) .. ",",
        "  \"input_end_frame\": " .. tostring(config.input_end_frame) .. ",",
        "  \"input_pattern\": " .. encode_input_pattern(config.input_pattern) .. ",",
        "  \"input_windows\": " .. encode_input_windows(config.input_windows) .. ",",
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

local function resolve_active_input_pattern(frame)
    if #config.input_windows > 0 then
        for _, window in ipairs(config.input_windows) do
            if frame >= window.start_frame and frame <= window.end_frame then
                if next(window.pattern) == nil then
                    return nil
                end
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
    local input_pattern = resolve_active_input_pattern(state.frame)

    if active and input_pattern ~= nil then
        emu.setInput(input_pattern, config.player)
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
        local input_pattern = resolve_active_input_pattern(state.frame)
        state.entries[#state.entries + 1] = {
            frame = state.frame,
            capture_index = capture_index,
            buttons = input_pattern ~= nil and clone_input_pattern(input_pattern) or {}
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

emu.displayMessage(
    "TD2 Capture",
    "Script armed. Warm-up for "
        .. tostring(config.warmup_frames)
        .. " frames; capture "
        .. tostring(config.capture_frames)
        .. " frames."
)
if savestate_path ~= nil then
    state.exec_callback_ref = emu.addMemoryCallback(on_first_exec, emu.callbackType.exec, 0x000000, 0xFFFFFF)
end
emu.addEventCallback(on_input_polled, emu.eventType.inputPolled)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
