-- Mesen Bank 10 Trace Script (v3)
-- Catch all writes from Bank 0A

local function log(message)
    local frame = emu.getState().frameCount
    print(string.format("[%d] %s", frame, message))
end

local state = {
    savestate_loaded = false,
    frame_count = 0
}

function onWrite(addr, value)
    if not state.savestate_loaded then return end
    local pc = emu.getState().pc
    local bank = emu.getState().pcBank
    if bank == 0x0A then
        log(string.format("BANK 0A WRITE to $%06X: $%04X from PC $%06X", addr, value, pc + (bank * 0x10000)))
    end
end

-- Load savestate ONCE
function onFrame()
    if not state.savestate_loaded then
        local ss_path = os.getenv("TD2_CAPTURE_SAVESTATE")
        if ss_path and ss_path ~= "" then
            print("Attempting to load savestate: " .. ss_path)
            local file = io.open(ss_path, "rb")
            if file then
                local data = file:read("*a")
                file:close()
                emu.loadState(data)
                state.savestate_loaded = true
                print("Savestate loaded.")
            else
                print("Error loading savestate.")
                state.savestate_loaded = true
            end
        else
            state.savestate_loaded = true
        end
    end
    
    state.frame_count = state.frame_count + 1
    if state.frame_count > 10 then
        emu.stop()
    end
end

-- Monitor ALL writes
emu.addMemoryCallback(onWrite, emu.callbackType.write, 0x000000, 0xFFFFFF)

emu.addEventCallback(onFrame, emu.eventType.endFrame)
log("Bank 10 Trace Script Loaded.")
