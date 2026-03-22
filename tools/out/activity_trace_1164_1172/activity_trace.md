# Mesen Activity Trace

## Inputs

- `probeInput`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1164_1172/td2_boot_probe.json`
- `probeJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1164_1172/td2_boot_probe.json`
- `dmaJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1164_1172/td2_boot_probe_dma_writes.json`
- `vramJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1164_1172/td2_boot_probe_vram_writes.json`
- `mode7Json`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1164_1172/td2_boot_probe_mode7_writes.json`

## Trace Window

- frames: `1164`..`1172`

## Summary

- DMA/HDMA events: `11` across frames `[1165, 1166, 1167, 1168, 1169, 1170, 1171, 1172]`
- DMA domains: `{'oam': 8, 'vram': 3}`
- direct VRAM/CGRAM write events: `9` from `774` raw writes
- direct write kinds: `{'vram_data': 768}`
- Mode 7/TMAIN events: `33` from `918` raw writes
- Mode 7 register counts: `{'$210F': 18, '$2110': 18, '$2111': 18, '$2112': 18, '$2113': 18, '$2114': 18, '$2116': 3, '$2117': 3, '$2118': 384, '$2119': 384, 'M7HOFS': 18, 'M7VOFS': 18}`

## Frame Activity

- frame `1164` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=2 state0206=13 state040a=17 dp0054=136
- frame `1165` callback `00:8029` irq `00:835F`: dma=2 direct=3 mode7=5 state0204=2 state0206=13 state040a=17 dp0054=136
- frame `1166` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=2 state0206=13 state040a=17 dp0054=136
- frame `1167` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=2 state0206=13 state040a=17 dp0054=136
- frame `1168` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=2 state0206=13 state040a=17 dp0054=136
- frame `1169` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=3 state0206=13 state040a=17 dp0054=144
- frame `1170` callback `00:8029` irq `00:835F`: dma=2 direct=3 mode7=5 state0204=3 state0206=13 state040a=17 dp0054=144
- frame `1171` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=152
- frame `1172` callback `00:8029` irq `00:835F`: dma=2 direct=3 mode7=5 state0204=1 state0206=13 state040a=17 dp0054=152

## Sample DMA Events

- frame `1165` scanline `227` `dma` ch`0` -> `VMDATAL` domain=`vram` size=`256` source=`1A:AB58` callback=`00:8029`
- frame `1165` scanline `229` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1166` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1167` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1168` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1169` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1170` scanline `227` `dma` ch`0` -> `VMDATAL` domain=`vram` size=`256` source=`1A:ACA0` callback=`00:8029`
- frame `1170` scanline `229` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1171` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1172` scanline `227` `dma` ch`0` -> `VMDATAL` domain=`vram` size=`256` source=`1A:AA10` callback=`00:8029`
- frame `1172` scanline `229` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`

## Sample Direct Write Events

- frame `1165` scanline `227` `vram_data` writes=`9` vmaddr=`18848` cgadd=`None` callback=`00:8029`
- frame `1165` scanline `228` `vram_data` writes=`166` vmaddr=`18848` cgadd=`None` callback=`00:8029`
- frame `1165` scanline `229` `vram_data` writes=`81` vmaddr=`18848` cgadd=`None` callback=`00:8029`
- frame `1170` scanline `227` `vram_data` writes=`9` vmaddr=`18720` cgadd=`None` callback=`00:8029`
- frame `1170` scanline `228` `vram_data` writes=`166` vmaddr=`18720` cgadd=`None` callback=`00:8029`
- frame `1170` scanline `229` `vram_data` writes=`81` vmaddr=`18720` cgadd=`None` callback=`00:8029`
- frame `1172` scanline `227` `vram_data` writes=`10` vmaddr=`18848` cgadd=`None` callback=`00:8029`
- frame `1172` scanline `228` `vram_data` writes=`165` vmaddr=`18848` cgadd=`None` callback=`00:8029`
- frame `1172` scanline `229` `vram_data` writes=`81` vmaddr=`18848` cgadd=`None` callback=`00:8029`

## Sample Mode 7 Events

- frame `1164` scanline `225` writes=`2` registers=`{'M7HOFS': 2}` callback=`00:8029`
- frame `1164` scanline `226` writes=`12` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 2}` callback=`00:8029`
- frame `1164` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1165` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1165` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1165` scanline `227` writes=`13` registers=`{'$2114': 2, '$2116': 1, '$2117': 1, '$2118': 5, '$2119': 4}` callback=`00:8029`
- frame `1165` scanline `228` writes=`166` registers=`{'$2118': 83, '$2119': 83}` callback=`00:8029`
- frame `1165` scanline `229` writes=`81` registers=`{'$2118': 40, '$2119': 41}` callback=`00:8029`
- frame `1166` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1166` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`00:8029`
- frame `1166` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`00:8029`
- frame `1167` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`00:8029`

