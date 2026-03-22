# Mesen Activity Trace

## Inputs

- `probeInput`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1094_1117/td2_boot_probe.json`
- `probeJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1094_1117/td2_boot_probe.json`
- `dmaJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1094_1117/td2_boot_probe_dma_writes.json`
- `vramJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1094_1117/td2_boot_probe_vram_writes.json`
- `mode7Json`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1094_1117/td2_boot_probe_mode7_writes.json`

## Trace Window

- frames: `1094`..`1117`

## Summary

- DMA/HDMA events: `20` across frames `[1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113]`
- DMA domains: `{'oam': 20}`
- direct VRAM/CGRAM write events: `0` from `0` raw writes
- direct write kinds: `{}`
- Mode 7/TMAIN events: `80` from `416` raw writes
- Mode 7 register counts: `{'$210F': 48, '$2110': 48, '$2111': 48, '$2112': 48, '$2113': 48, '$2114': 48, 'M7A': 16, 'M7D': 16, 'M7HOFS': 48, 'M7VOFS': 48}`

## Frame Activity

- frame `1094` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1095` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1096` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1097` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1098` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1099` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1100` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1101` callback `01:9FE5` irq `00:835F`: dma=1 direct=0 mode7=4 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1102` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1103` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1104` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1105` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1106` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1107` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1108` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1109` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1110` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1111` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1112` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1113` callback `00:8029` irq `00:835F`: dma=1 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1114` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1115` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1116` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128
- frame `1117` callback `00:8029` irq `00:835F`: dma=0 direct=0 mode7=3 state0204=1 state0206=13 state040a=17 dp0054=128

## Sample DMA Events

- frame `1094` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1095` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1096` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1097` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1098` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1099` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1100` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1101` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`01:9FE5`
- frame `1102` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1103` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1104` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`
- frame `1105` scanline `227` `dma` ch`1` -> `OAMDATA` domain=`oam` size=`544` source=`00:0700` callback=`00:8029`

## Sample Direct Write Events


## Sample Mode 7 Events

- frame `1094` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`01:9FE5`
- frame `1094` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`01:9FE5`
- frame `1094` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`01:9FE5`
- frame `1094` scanline `231` writes=`4` registers=`{'M7A': 2, 'M7D': 2}` callback=`01:9FE5`
- frame `1095` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`01:9FE5`
- frame `1095` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`01:9FE5`
- frame `1095` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`01:9FE5`
- frame `1095` scanline `231` writes=`4` registers=`{'M7A': 2, 'M7D': 2}` callback=`01:9FE5`
- frame `1096` scanline `225` writes=`3` registers=`{'M7HOFS': 2, 'M7VOFS': 1}` callback=`01:9FE5`
- frame `1096` scanline `226` writes=`11` registers=`{'$210F': 2, '$2110': 2, '$2111': 2, '$2112': 2, '$2113': 2, 'M7VOFS': 1}` callback=`01:9FE5`
- frame `1096` scanline `227` writes=`2` registers=`{'$2114': 2}` callback=`01:9FE5`
- frame `1096` scanline `231` writes=`4` registers=`{'M7A': 2, 'M7D': 2}` callback=`01:9FE5`

