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

local function parse_input_env(name)
    local raw = os.getenv(name)
    if raw == nil or raw == "" then
        return {}
    end

    local pattern = {}
    for token in raw:gmatch("[^,]+") do
        local key = token:match("^%s*(.-)%s*$")
        if key ~= "" then
            pattern[key] = true
        end
    end
    return pattern
end

local config = {
    total_frames = env_number("TD2_BOOT_PROBE_TOTAL_FRAMES", 180),
    screenshot_frame = env_number("TD2_BOOT_PROBE_SCREENSHOT_FRAME", -1),
    input_start_frame = env_number("TD2_BOOT_PROBE_INPUT_START_FRAME", -1),
    player = env_number("TD2_BOOT_PROBE_PLAYER", 0),
    input_pattern = parse_input_env("TD2_BOOT_PROBE_INPUT"),
    savestate_filename = "seed_state.bin"
}

if config.screenshot_frame < 0 then
    config.screenshot_frame = config.total_frames - 1
end

local state = {
    frame = 0,
    finished = false,
    entries = {},
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

local function read_u16(address)
    return emu.read16(address, emu.memType.snesDebug)
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
        state_0996 = read_u16(0x7E0996)
    }
end

local function save_probe_log()
    local lines = {
        "{",
        "  \"total_frames\": " .. tostring(config.total_frames) .. ",",
        "  \"frames\": ["
    }

    for i = 1, #state.entries do
        local entry = state.entries[i]
        local suffix = i == #state.entries and "" or ","
        lines[#lines + 1] = string.format(
            "    {\"frame\": %d, \"1c78\": %d, \"1c7a\": %d, \"1c7c\": %d, \"1c82\": %d, \"1cac\": %d, \"1cca\": %d, \"1ccc\": %d, \"1cce\": %d, \"1cd0\": %d, \"1ce2\": %d, \"1ce4\": %d, \"1ce6\": %d, \"1cea\": %d, \"0996\": %d}%s",
            entry.frame,
            entry.selector_1c78,
            entry.selector_1c7a,
            entry.selector_1c7c,
            entry.selector_1c82,
            entry.selector_1cac,
            entry.selector_1cca,
            entry.selector_1ccc,
            entry.selector_1cce,
            entry.selector_1cd0,
            entry.selector_1ce2,
            entry.selector_1ce4,
            entry.selector_1ce6,
            entry.selector_1cea,
            entry.state_0996,
            suffix
        )
    end

    lines[#lines + 1] = "  ]"
    lines[#lines + 1] = "}"

    write_text_file(output_prefix .. ".json", table.concat(lines, "\n"))
end

local function reset_probe_state()
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
    end

    state.frame = state.frame + 1

    if state.frame >= config.total_frames then
        save_probe_log()
        state.finished = true
        emu.displayMessage("TD2 Boot Probe", "Probe finished. Files written to " .. output_prefix .. ".*")
        emu.stop(0)
    end
end

local function on_input_polled()
    if state.finished then
        return
    end

    if config.input_start_frame < 0 or state.frame < config.input_start_frame then
        return
    end

    if next(config.input_pattern) == nil then
        return
    end

    emu.setInput(config.input_pattern, config.player)
end

emu.displayMessage("TD2 Boot Probe", "Script armed for " .. tostring(config.total_frames) .. " frames.")
if savestate_path ~= nil then
    state.exec_callback_ref = emu.addMemoryCallback(on_first_exec, emu.callbackType.exec, 0x000000, 0xFFFFFF)
end
emu.addEventCallback(on_input_polled, emu.eventType.inputPolled)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
