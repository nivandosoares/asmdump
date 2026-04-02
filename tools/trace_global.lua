-- Mesen Global Trace Script (v2)
-- Catch execution in any bank except 00, 01, 02

local function log(message)
    local frame = emu.getState().frameCount
    print(string.format("[%d] %s", frame, message))
end

local seen_banks = {}

function onExec(addr)
    local bank = math.floor(addr / 0x10000)
    if bank > 0x02 and not seen_banks[bank] then
        log(string.format("EXEC in Bank %02X at $%06X", bank, addr))
        seen_banks[bank] = true
    end
end

-- Monitor all execution
emu.addMemoryCallback(onExec, emu.callbackType.exec, 0x000000, 0xFFFFFF)

-- Load savestate immediately
local ss_path = os.getenv("TD2_CAPTURE_SAVESTATE")
if ss_path and ss_path ~= "" then
    print("Attempting to load savestate: " .. ss_path)
    local file = io.open(ss_path, "rb")
    if file then
        local data = file:read("*a")
        file:close()
        emu.loadState(data)
        print("Savestate loaded.")
    else
        print("Error: Could not open savestate file.")
    end
end

log("Global Trace Script Loaded.")
