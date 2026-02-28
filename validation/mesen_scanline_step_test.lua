local target_frame = tonumber(os.getenv("TD2_SCANLINE_TEST_TARGET_FRAME") or "10")
local max_scanline_samples = tonumber(os.getenv("TD2_SCANLINE_TEST_MAX_SAMPLES") or "8")

local state = {
    frame = 0,
    started = false,
    finished = false,
    samples = {},
}

local output_prefix = emu.getScriptDataFolder() .. "/td2_scanline_step_test"

local function write_text_file(path, data)
    local file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

local function encode_json(value)
    if type(value) == "table" then
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
                parts[#parts + 1] = encode_json(value[i])
            end
            return "[" .. table.concat(parts, ",") .. "]"
        end

        local keys = {}
        for key, _ in pairs(value) do
            keys[#keys + 1] = tostring(key)
        end
        table.sort(keys)
        local parts = {}
        for i = 1, #keys do
            local key = keys[i]
            parts[#parts + 1] = string.format("%q:%s", key, encode_json(value[key]))
        end
        return "{" .. table.concat(parts, ",") .. "}"
    elseif type(value) == "string" then
        return string.format("%q", value)
    elseif type(value) == "boolean" or type(value) == "number" then
        return tostring(value)
    end

    return "null"
end

local function finish(exit_code)
    write_text_file(output_prefix .. ".json", encode_json({
        target_frame = target_frame,
        samples = state.samples,
    }))
    state.finished = true
    emu.stop(exit_code)
end

local function on_start_frame()
    if state.finished then
        return
    end

    if state.frame == target_frame and not state.started then
        state.started = true
        emu.step(1, emu.stepType.ppuScanline)
    end
end

local function on_end_frame()
    if state.finished then
        return
    end

    state.frame = state.frame + 1
    if state.frame > target_frame + 2 then
        finish(0)
    end
end

local function on_code_break()
    if state.finished or not state.started then
        return
    end

    local snapshot = emu.getState()
    state.samples[#state.samples + 1] = {
        frame = state.frame,
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_layers = snapshot["ppu.mainScreenLayers"],
        m7a = snapshot["ppu.mode7.matrix[0]"],
        m7b = snapshot["ppu.mode7.matrix[1]"],
        m7c = snapshot["ppu.mode7.matrix[2]"],
        m7d = snapshot["ppu.mode7.matrix[3]"],
        hscroll = snapshot["ppu.mode7.hscroll"],
        vscroll = snapshot["ppu.mode7.vscroll"],
        center_x = snapshot["ppu.mode7.centerX"],
        center_y = snapshot["ppu.mode7.centerY"],
    }

    if #state.samples >= max_scanline_samples then
        finish(0)
        return
    end

    emu.step(1, emu.stepType.ppuScanline)
end

emu.addEventCallback(on_start_frame, emu.eventType.startFrame)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
emu.addEventCallback(on_code_break, emu.eventType.codeBreak)
emu.displayMessage("TD2 Scanline Test", "Armed.")
