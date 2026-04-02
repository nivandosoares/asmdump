-- Mesen Archaeology Validation Script (v6)
-- Validates identified code entry points and traces their execution

local function log(message)
    local frame = emu.getState().frameCount
    print(string.format("[%d] %s", frame, message))
end

-- Addresses to monitor (24-bit SNES addresses)
local TRACE_POINTS = {
    { addr = 0x0288EF, name = "Bank 2 Radar Logic (L0108EF)" },
    { addr = 0x0AD322, name = "Bank 10 Physics/AI Update" },
    { addr = 0x0B8000, name = "Bank 11 Rasterizer Start (YUKO)" },
    { addr = 0x0012EE, name = "WRAM Scanline Routine ($12EE)" },
    { addr = 0x029016, name = "Bank 2 Gameplay Loop" }
}

-- Memory Monitoring
local ADDR_MAIN_CALLBACK = 0x0038

local state = {
    last_callback = -1,
    dumped_12ee = false
}

function onFrame()
    local cb = emu.readWord(ADDR_MAIN_CALLBACK, emu.memType.wram)
    
    if cb ~= state.last_callback then
        log(string.format("Main Callback changed: $%04X", cb))
        state.last_callback = cb
    end
end

-- Set breakpoints/trace points
for _, pt in ipairs(TRACE_POINTS) do
    emu.addMemoryCallback(function(addr, value)
        log(string.format("HIT: %s at $%06X", pt.name, addr))
        
        if addr == 0x0012EE and not state.dumped_12ee then
            log("Dumping memory at $12EE:")
            local bytes = ""
            for i = 0, 63 do
                bytes = bytes .. string.format("%02X ", emu.read(0x12EE + i, emu.memType.wram))
            end
            print(bytes)
            state.dumped_12ee = true
        end
    end, emu.callbackType.exec, pt.addr)
end

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

emu.addEventCallback(onFrame, emu.eventType.endFrame)
log("Archaeology Validation Script Loaded.")
