-- Mesen Archaeology Workbench Lua Script
-- Focused on Gameplay and Environment Analysis for The Duel: Test Drive II
-- Author: Trae (Senior Pair Programmer)

local frameCount = 0
local lastCallback = 0
local lastIRQ = 0

-- Memory Addresses
local ADDR_MAIN_CALLBACK = 0x0038
local ADDR_IRQ_CALLBACK = 0x003E
local ADDR_FRAME_COUNTER = 0x0964
local ADDR_SPEED = 0x11CE
local ADDR_GEAR = 0x12B9
local ADDR_CAR1_X = 0x11F1
local ADDR_CAR2_X = 0x11F3
local ADDR_CAR3_X = 0x11F5
local ADDR_OAM_BASE = 0x0700
local ADDR_DMA_READ = 0x0053
local ADDR_DMA_WRITE = 0x0054

-- Configuration
local config = {
  showHUD = true,
  logCallbackChanges = true,
  logMemoryChanges = true,
  autoDumpOnCallbackChange = false,
  outputDir = "tools/out/workbench_logs/"
}

-- Ensure output directory exists (Note: Lua in Mesen might have restricted I/O)
-- We'll just print to the console if file I/O fails.

function log(message)
  local time = emu.getState().frameCount
  print(string.format("[%d] %s", time, message))
end

function getWord(addr)
  return emu.readWord(addr, emu.memType.wram)
end

function getByte(addr)
  return emu.read(addr, emu.memType.wram)
end

function updateHUD()
  if not config.showHUD then return end
  
  local mainCB = getWord(ADDR_MAIN_CALLBACK)
  local irqCB = getWord(ADDR_IRQ_CALLBACK)
  local frames = getWord(ADDR_FRAME_COUNTER)
  local speed = getWord(ADDR_SPEED)
  local gear = getByte(ADDR_GEAR)
  local car1X = getWord(ADDR_CAR1_X)
  local car2X = getWord(ADDR_CAR2_X)
  local car3X = getWord(ADDR_CAR3_X)
  local dmaR = getByte(ADDR_DMA_READ)
  local dmaW = getByte(ADDR_DMA_WRITE)
  
  -- Draw HUD
  emu.drawString(10, 10, string.format("FRAME: %d", frames), 0xFFFFFF, 0x000000)
  emu.drawString(10, 20, string.format("MAIN CB: $%04X", mainCB), 0x00FF00, 0x000000)
  emu.drawString(10, 30, string.format("IRQ  CB: $%04X", irqCB), 0x00FFFF, 0x000000)
  
  emu.drawString(10, 50, string.format("SPEED: %d", speed), 0xFFFF00, 0x000000)
  emu.drawString(10, 60, string.format("GEAR:  %d", gear), 0xFFFF00, 0x000000)
  
  emu.drawString(150, 10, string.format("CAR1 X: %d", car1X), 0xFF8888, 0x000000)
  emu.drawString(150, 20, string.format("CAR2 X: %d", car2X), 0x88FF88, 0x000000)
  emu.drawString(150, 30, string.format("CAR3 X: %d", car3X), 0x8888FF, 0x000000)
  
  emu.drawString(150, 50, string.format("DMA R/W: %d/%d", dmaR, dmaW), 0xAAAAAA, 0x000000)
  
  -- Monitor Callback Changes
  if config.logCallbackChanges then
    if mainCB ~= lastCallback then
      log(string.format("Main Callback changed: $%04X -> $%04X", lastCallback, mainCB))
      lastCallback = mainCB
      if config.autoDumpOnCallbackChange then
        -- Placeholder for dump logic if needed
      end
    end
    if irqCB ~= lastIRQ then
      log(string.format("IRQ Callback changed: $%04X -> $%04X", lastIRQ, irqCB))
      lastIRQ = irqCB
    end
  end
end

-- Callback for each frame end
emu.addEventCallback(updateHUD, emu.eventType.endFrame)

log("Archaeology Workbench Loaded. Happy hunting!")
