# Mesen Activity Trace

## Inputs

- `probeInput`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1118_1125/td2_boot_probe.json`
- `probeJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1118_1125/td2_boot_probe.json`
- `dmaJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1118_1125/td2_boot_probe_dma_writes.json`
- `vramJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1118_1125/td2_boot_probe_vram_writes.json`
- `mode7Json`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1118_1125/td2_boot_probe_mode7_writes.json`

## Trace Window

- frames: `1118`..`1125`

## Summary

- DMA/HDMA events: `0` across frames `[]`
- DMA domains: `{}`
- direct VRAM/CGRAM write events: `0` from `0` raw writes
- direct write kinds: `{}`
- Mode 7/TMAIN events: `24` from `128` raw writes
- Mode 7 register counts: `{'$210F': 16, '$2110': 16, '$2111': 16, '$2112': 16, '$2113': 16, '$2114': 16, 'M7HOFS': 16, 'M7VOFS': 16}`

## Frame Activity

- frame `1118` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1119` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1120` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1121` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1122` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1123` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1124` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1125` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128

## Sample DMA Events


## Sample Direct Write Events


## Sample Mode 7 Events

- frame `1118` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1118` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1118` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1119` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1119` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1119` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1120` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1120` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1120` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1121` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1121` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1121` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`

