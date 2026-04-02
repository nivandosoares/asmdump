-- Mesen Physics Trace Script
-- Catch any execution in Bank 0A during gameplay

local function log(message)
    local frame = emu.getState().frameCount
    print(string.format("[%d] %s", frame, message))
end

local seen_addrs = {}

function onExec(addr)
    local bank = math.floor(addr / 0x10000)
    if bank == 0x0A then
        if not seen_addrs[addr] then
            log(string.format("NEW EXEC in Bank 0A: $%06X", addr))
            seen_addrs[addr] = true
        end
    end
end

-- Monitor all execution
emu.addMemoryCallback(onExec, emu.callbackType.exec, 0x0A0000, 0x0AFFFF)

log("Physics Trace Script Loaded.")
