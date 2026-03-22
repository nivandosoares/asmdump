# Mesen Activity Trace

## Inputs

- `probeInput`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1126_1133/td2_boot_probe.json`
- `probeJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1126_1133/td2_boot_probe.json`
- `dmaJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1126_1133/td2_boot_probe_dma_writes.json`
- `vramJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1126_1133/td2_boot_probe_vram_writes.json`
- `mode7Json`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1126_1133/td2_boot_probe_mode7_writes.json`

## Trace Window

- frames: `1126`..`1133`

## Summary

- DMA/HDMA events: `0` across frames `[]`
- DMA domains: `{}`
- direct VRAM/CGRAM write events: `0` from `0` raw writes
- direct write kinds: `{}`
- Mode 7/TMAIN events: `24` from `128` raw writes
- Mode 7 register counts: `{'$210F': 16, '$2110': 16, '$2111': 16, '$2112': 16, '$2113': 16, '$2114': 16, 'M7HOFS': 16, 'M7VOFS': 16}`

## Frame Activity

- frame `1126` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1127` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1128` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1129` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1130` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1131` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1132` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1133` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128

## Sample DMA Events


## Sample Direct Write Events


## Sample Mode 7 Events

- frame `1126` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1126` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1126` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1127` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1127` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1127` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1128` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1128` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1128` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1129` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1129` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1129` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`

