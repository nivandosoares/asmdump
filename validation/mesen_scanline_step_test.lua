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
    target_frame = env_number("TD2_SCANLINE_TEST_TARGET_FRAME", 10),
    max_scanline_samples = env_number("TD2_SCANLINE_TEST_MAX_SAMPLES", 8),
    savestate_filename = "seed_state.bin",
    input_start_frame = env_number("TD2_SCANLINE_TEST_INPUT_START_FRAME", -1),
    input_end_frame = env_number("TD2_SCANLINE_TEST_INPUT_END_FRAME", -1),
    player = env_number("TD2_SCANLINE_TEST_PLAYER", 0),
    input_pattern = parse_input_env("TD2_SCANLINE_TEST_INPUT"),
    input_windows = parse_input_windows_env("TD2_SCANLINE_TEST_INPUT_WINDOWS"),
    trace_exec_points = parse_exec_point_env("TD2_SCANLINE_TEST_TRACE_EXEC_POINTS"),
    exec_point_max_hits = env_number("TD2_SCANLINE_TEST_EXEC_POINT_MAX_HITS", 128),
    trace_write_points = parse_exec_point_env("TD2_SCANLINE_TEST_TRACE_WRITE_POINTS"),
    write_point_max_hits = env_number("TD2_SCANLINE_TEST_WRITE_POINT_MAX_HITS", 256)
}

if config.max_scanline_samples <= 0 then
    config.max_scanline_samples = 1
end

if config.input_end_frame >= 0 and config.input_start_frame >= 0 and config.input_end_frame < config.input_start_frame then
    config.input_end_frame = config.input_start_frame
end

local state = {
    frame = 0,
    started = false,
    finished = false,
    samples = {},
    frame_events = {},
    exec_point_hits = {},
    exec_point_dropped_hits = 0,
    write_point_hits = {},
    write_point_dropped_hits = 0,
    savestate_attempted = false,
    exec_callback_ref = nil,
}

local script_data_dir = emu.getScriptDataFolder()
local output_prefix = os.getenv("TD2_SCANLINE_TEST_OUTPUT_PREFIX") or (script_data_dir .. "/td2_scanline_step_test")

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

local function read_u8(address)
    return emu.read(address, emu.memType.snesDebug)
end

local function read_u16(address)
    return read_u8(address) + (read_u8(address + 1) * 0x100)
end

local function mask_u16(value)
    if type(value) ~= "number" then
        return nil
    end
    return math.floor(value) % 0x10000
end

local function bytes_to_hex(bytes)
    local parts = {}
    for index = 1, #bytes do
        parts[#parts + 1] = string.format("%02x", bytes[index] % 0x100)
    end
    return table.concat(parts)
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
                    raw[7] + (raw[8] * 0x100),
                },
                bytes_hex = bytes_to_hex(raw),
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
                    empty = true,
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
        active_descriptor_count = descriptor_count,
    }
end

local function encode_input_pattern(pattern)
    local keys = {}
    for key, pressed in pairs(pattern) do
        if pressed then
            keys[#keys + 1] = key
        end
    end
    table.sort(keys)
    return keys
end

local function encode_input_windows(windows)
    local items = {}
    for index = 1, #windows do
        local window = windows[index]
        items[#items + 1] = {
            start_frame = window.start_frame,
            end_frame = window.end_frame,
            buttons = encode_input_pattern(window.pattern)
        }
    end
    return items
end

local function finish(exit_code)
    write_text_file(output_prefix .. ".json", encode_json({
        target_frame = config.target_frame,
        max_scanline_samples = config.max_scanline_samples,
        input_start_frame = config.input_start_frame,
        input_end_frame = config.input_end_frame,
        input_pattern = encode_input_pattern(config.input_pattern),
        input_windows = encode_input_windows(config.input_windows),
        trace_exec_points = config.trace_exec_points,
        exec_point_max_hits = config.exec_point_max_hits,
        exec_point_hits = state.exec_point_hits,
        exec_point_dropped_hits = state.exec_point_dropped_hits,
        trace_write_points = config.trace_write_points,
        write_point_max_hits = config.write_point_max_hits,
        write_point_hits = state.write_point_hits,
        write_point_dropped_hits = state.write_point_dropped_hits,
        frame_events = state.frame_events,
        samples = state.samples,
    }))
    state.finished = true
    emu.stop(exit_code)
end

local function reset_state()
    state.frame = 0
    state.started = false
    state.finished = false
    state.samples = {}
    state.frame_events = {}
    state.exec_point_hits = {}
    state.exec_point_dropped_hits = 0
    state.write_point_hits = {}
    state.write_point_dropped_hits = 0
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
        emu.displayMessage("TD2 Scanline Test", "Savestate load failed: " .. tostring(err))
        emu.stop(1)
        return
    end
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

local function is_trace_active()
    return state.started and not state.finished
end

local function record_frame_event(phase, frame_number)
    if state.finished then
        return
    end

    local snapshot = emu.getState()
    state.frame_events[#state.frame_events + 1] = {
        phase = phase,
        frame = frame_number,
        scanline = snapshot["ppu.scanline"],
        bg_mode = snapshot["ppu.bgMode"],
        main_screen_layers = snapshot["ppu.mainScreenLayers"],
        sub_screen_layers = snapshot["ppu.subScreenLayers"],
        active_main_callback_addr = read_u16(0x000038),
        active_main_callback_bank = read_u8(0x00003A),
        active_irq_callback_addr = read_u16(0x00003E),
        active_irq_callback_bank = read_u8(0x000040),
        dp_0053 = read_u8(0x000053),
        dp_0054 = read_u8(0x000054),
        dp_0055 = read_u8(0x000055),
        dp_0056 = read_u8(0x000056),
        wram_0053 = read_u8(0x7E0053),
        wram_0054 = read_u8(0x7E0054),
        wram_0055 = read_u8(0x7E0055),
        wram_0056 = read_u8(0x7E0056),
    }
end

local function make_exec_point_callback(point)
    return function()
        if not is_trace_active() then
            return
        end

        if config.exec_point_max_hits > 0 and #state.exec_point_hits >= config.exec_point_max_hits then
            state.exec_point_dropped_hits = state.exec_point_dropped_hits + 1
            return
        end

        local snapshot = emu.getState()
        local reg_a = emu.getRegister("A")
        local reg_x = emu.getRegister("X")
        local reg_y = emu.getRegister("Y")
        local reg_pc = emu.getRegister("PC")
        local reg_sp = emu.getRegister("SP")
        local reg_ps = emu.getRegister("PS")
        local reg_d = emu.getRegister("D")
        local reg_dbr = emu.getRegister("DB")
        local reg_k = emu.getRegister("K")

        state.exec_point_hits[#state.exec_point_hits + 1] = {
            frame = state.frame,
            point_id = point.id,
            point_snes = point.snes,
            point_linear = point.linear,
            scanline = snapshot["ppu.scanline"],
            bg_mode = snapshot["ppu.bgMode"],
            main_screen_layers = snapshot["ppu.mainScreenLayers"],
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
            dp_0053 = read_u8(0x000053),
            dp_0054 = read_u8(0x000054),
            dp_0055 = read_u8(0x000055),
            dp_0056 = read_u8(0x000056),
            wram_0053 = read_u8(0x7E0053),
            wram_0054 = read_u8(0x7E0054),
            wram_0055 = read_u8(0x7E0055),
            wram_0056 = read_u8(0x7E0056),
        }
    end
end

local function make_write_point_callback(point)
    return function(address, value)
        if not is_trace_active() then
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
            active_irq_callback_addr = read_u16(0x00003E),
            active_irq_callback_bank = read_u8(0x000040),
            dp_0053 = read_u8(0x000053),
            dp_0054 = read_u8(0x000054),
            dp_0055 = read_u8(0x000055),
            dp_0056 = read_u8(0x000056),
            wram_0053 = read_u8(0x7E0053),
            wram_0054 = read_u8(0x7E0054),
            wram_0055 = read_u8(0x7E0055),
            wram_0056 = read_u8(0x7E0056),
        }
    end
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

local function on_start_frame()
    if state.finished then
        return
    end

    if state.started then
        record_frame_event("start", state.frame)
    end

    if state.frame == config.target_frame and not state.started then
        state.started = true
        record_frame_event("start", state.frame)
        emu.step(1, emu.stepType.ppuScanline)
    end
end

local function on_end_frame()
    if state.finished then
        return
    end

    if state.started then
        record_frame_event("end", state.frame)
    end

    state.frame = state.frame + 1
    if state.frame > config.target_frame + 2 then
        finish(0)
    end
end

local function on_code_break()
    if state.finished or not state.started then
        return
    end

    local snapshot = emu.getState()
    local cpu_d = mask_u16(snapshot["cpu.d"])
    local dp_0054_addr = nil
    local dp_0054_effective = nil
    local dp_0054_next = nil
    local dp_0054_next2 = nil
    if cpu_d ~= nil then
        dp_0054_addr = (cpu_d + 0x54) % 0x10000
        dp_0054_effective = read_u8(dp_0054_addr)
        dp_0054_next = read_u8((dp_0054_addr + 1) % 0x10000)
        dp_0054_next2 = read_u8((dp_0054_addr + 2) % 0x10000)
    end
    local dp_0053 = read_u8(0x000053)
    local wram_0053 = read_u8(0x7E0053)
    local wram_0054 = read_u8(0x7E0054)
    local queue_dma_summary = read_dma_queue_summary(wram_0053, wram_0054)

    state.samples[#state.samples + 1] = {
        frame = state.frame,
        scanline = snapshot["ppu.scanline"],
        cpu_d = cpu_d,
        bg_mode = snapshot["ppu.bgMode"],
        main_layers = snapshot["ppu.mainScreenLayers"],
        sub_layers = snapshot["ppu.subScreenLayers"],
        forced_blank = snapshot["ppu.forcedBlank"],
        window0_left = snapshot["ppu.window[0].left"],
        window0_right = snapshot["ppu.window[0].right"],
        window1_left = snapshot["ppu.window[1].left"],
        window1_right = snapshot["ppu.window[1].right"],
        window_mask_main_bg1 = snapshot["ppu.windowMaskMain[0]"],
        window_mask_main_bg2 = snapshot["ppu.windowMaskMain[1]"],
        window_mask_main_bg3 = snapshot["ppu.windowMaskMain[2]"],
        window_mask_main_bg4 = snapshot["ppu.windowMaskMain[3]"],
        window_mask_main_obj = snapshot["ppu.windowMaskMain[4]"],
        window_mask_sub_bg1 = snapshot["ppu.windowMaskSub[0]"],
        window_mask_sub_bg2 = snapshot["ppu.windowMaskSub[1]"],
        window_mask_sub_bg3 = snapshot["ppu.windowMaskSub[2]"],
        window_mask_sub_bg4 = snapshot["ppu.windowMaskSub[3]"],
        window_mask_sub_obj = snapshot["ppu.windowMaskSub[4]"],
        oam_base_address = snapshot["ppu.oamBaseAddress"],
        oam_address_offset = snapshot["ppu.oamAddressOffset"],
        oam_mode = snapshot["ppu.oamMode"],
        oam_priority = snapshot["ppu.enableOamPriority"],
        bg1_hscroll = snapshot["ppu.layers[0].hscroll"],
        bg1_vscroll = snapshot["ppu.layers[0].vscroll"],
        bg2_hscroll = snapshot["ppu.layers[1].hscroll"],
        bg2_vscroll = snapshot["ppu.layers[1].vscroll"],
        bg3_hscroll = snapshot["ppu.layers[2].hscroll"],
        bg3_vscroll = snapshot["ppu.layers[2].vscroll"],
        bg4_hscroll = snapshot["ppu.layers[3].hscroll"],
        bg4_vscroll = snapshot["ppu.layers[3].vscroll"],
        m7a = snapshot["ppu.mode7.matrix[0]"],
        m7b = snapshot["ppu.mode7.matrix[1]"],
        m7c = snapshot["ppu.mode7.matrix[2]"],
        m7d = snapshot["ppu.mode7.matrix[3]"],
        m7_hscroll = snapshot["ppu.mode7.hscroll"],
        m7_vscroll = snapshot["ppu.mode7.vscroll"],
        m7_center_x = snapshot["ppu.mode7.centerX"],
        m7_center_y = snapshot["ppu.mode7.centerY"],
        active_main_callback_addr = read_u16(0x000038),
        active_main_callback_bank = read_u8(0x00003A),
        active_irq_callback_addr = read_u16(0x00003E),
        active_irq_callback_bank = read_u8(0x000040),
        dp_0053 = dp_0053,
        dp_0054 = read_u8(0x000054),
        dp_0055 = read_u8(0x000055),
        dp_0056 = read_u8(0x000056),
        dp_0054_effective_addr = dp_0054_addr,
        dp_0054_effective = dp_0054_effective,
        dp_0054_effective_next = dp_0054_next,
        dp_0054_effective_next2 = dp_0054_next2,
        wram_0053 = wram_0053,
        wram_0054 = read_u8(0x7E0054),
        wram_0055 = read_u8(0x7E0055),
        wram_0056 = read_u8(0x7E0056),
        queue_dma_nonzero_entry_count = queue_dma_summary.nonzero_entry_count,
        queue_dma_active_descriptor_count = queue_dma_summary.active_descriptor_count,
        queue_dma_active_entries = queue_dma_summary.active_entries,
        state_1396 = read_u16(0x7E1396),
        state_13a4 = read_u8(0x7E13A4),
        state_13a6 = read_u8(0x7E13A6),
        state_13a8 = read_u16(0x7E13A8),
        state_13aa = read_u16(0x7E13AA),
        state_13ac = read_u8(0x7E13AC),
        state_13ae = read_u8(0x7E13AE),
        state_13b4 = read_u16(0x7E13B4),
        state_13b6 = read_u16(0x7E13B6),
        state_13ba = read_u8(0x7E13BA),
        state_1ce6 = read_u8(0x7E1CE6),
        state_1ceb = read_u8(0x7E1CEB),
        state_1cec = read_u16(0x7E1CEC),
        state_1e1c = read_u16(0x7E1E1C),
        state_1e1e = read_u16(0x7E1E1E),
        state_0f3a = read_u16(0x7E0F3A),
        state_0f32 = read_u16(0x7E0F32),
        state_0f34 = read_u16(0x7E0F34),
        state_0f36 = read_u16(0x7E0F36),
        state_0f38 = read_u16(0x7E0F38),
        state_0f3c = read_u16(0x7E0F3C),
        state_0f3e = read_u16(0x7E0F3E),
        state_0f40 = read_u16(0x7E0F40),
        state_0f42 = read_u16(0x7E0F42),
    }

    if #state.samples >= config.max_scanline_samples then
        finish(0)
        return
    end

    emu.step(1, emu.stepType.ppuScanline)
end

emu.addEventCallback(on_input_polled, emu.eventType.inputPolled)
emu.addEventCallback(on_start_frame, emu.eventType.startFrame)
emu.addEventCallback(on_end_frame, emu.eventType.endFrame)
emu.addEventCallback(on_code_break, emu.eventType.codeBreak)
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
if savestate_path ~= nil then
    state.exec_callback_ref = emu.addMemoryCallback(on_first_exec, emu.callbackType.exec, 0x000000, 0xFFFFFF)
end
emu.displayMessage("TD2 Scanline Test", "Armed.")
