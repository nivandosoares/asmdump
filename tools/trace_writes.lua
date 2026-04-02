-- Mesen Write Trace Script (v5)
-- Catch any write to $11CE or $11F1 during gameplay

local function log(message)
    local frame = emu.getState().frameCount
    print(string.format("[%d] %s", frame, message))
end

local savestate_loaded = false

function onWrite(addr, value)
    if not savestate_loaded then return end
    local pc = emu.getState().pc
    local bank = emu.getState().pcBank
    log(string.format("WRITE to $%04X: $%04X from PC $%02X:%04X", addr, value, bank, pc))
end

-- Load savestate at the start of the first frame
function onFrame()
    if not savestate_loaded then
        local ss_path = os.getenv("TD2_CAPTURE_SAVESTATE")
        if ss_path and ss_path ~= "" then
            print("Attempting to load savestate: " .. ss_path)
            local file = io.open(ss_path, "rb")
            if file then
                local data = file:read("*a")
                file:close()
                emu.loadState(data)
                savestate_loaded = true
                print("Savestate loaded successfully.")
            else
                print("Error: Could not open savestate file: " .. ss_path)
                savestate_loaded = true -- Prevent further attempts
            end
        else
            savestate_loaded = true -- No savestate to load
        end
    end
end

-- Monitor writes to WRAM
emu.addMemoryCallback(onWrite, emu.callbackType.write, 0x11CE, 0x11CE, emu.memType.wram)
emu.addMemoryCallback(onWrite, emu.callbackType.write, 0x11F1, 0x11F1, emu.memType.wram)

emu.addEventCallback(onFrame, emu.eventType.endFrame)
log("Write Trace Script Loaded.")
