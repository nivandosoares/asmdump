# Mode 7 Blob Cycle Report

## Inputs

- `probeJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1134_1200/td2_boot_probe.json`
- `dmaWritesJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json`
- `vramWritesJson`: `/home/nivando-soares/asmdump/tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json`
- `rom`: `/home/nivando-soares/asmdump/game.smc`

## Trace Window

- frames: `1134`..`1200`

## Summary

- burst frames: `28` across `1165, 1170, 1172, 1174, 1175, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193, 1194, 1195, 1196, 1198, 1199, 1200`
- distinct direct blob labels: `AA10, AB58, ACA0`
- distinct DMA blob labels: `AA10, AB58, ACA0`
- distinct VMADD targets: `0x4920, 0x49A0`
- frames with OAM DMA: `1165, 1166, 1167, 1168, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193, 1194, 1195, 1196, 1197, 1198, 1199, 1200`

## Burst Frames

| frame | main | irq | state0204 | dp0054 | vmadd | direct blob | dma blob | oam dma |
|---|---|---|---:|---:|---|---|---|---|
| 1165 | 00:8029 | 00:835F | 2 | 0x88 | 0x49A0 | AB58 | AB58 | yes |
| 1170 | 00:8029 | 00:835F | 3 | 0x90 | 0x4920 | ACA0 | ACA0 | yes |
| 1172 | 00:8029 | 00:835F | 1 | 0x98 | 0x49A0 | AA10 | AA10 | yes |
| 1174 | 00:8029 | 00:835F | 3 | 0xA8 | 0x4920 | AB58 | AB58 | yes |
| 1175 | 00:8029 | 00:835F | 3 | 0xA8 | 0x49A0 | ACA0 | ACA0 | yes |
| 1177 | 00:8029 | 00:835F | 2 | 0xB8 | 0x4920 | AA10 | AA10 | yes |
| 1178 | 00:8029 | 00:835F | 3 | 0xC0 | 0x49A0 | AB58 | AB58 | yes |
| 1179 | 00:8029 | 00:835F | 1 | 0xC8 | 0x4920 | ACA0 | ACA0 | yes |
| 1180 | 00:8029 | 00:835F | 2 | 0xD0 | 0x49A0 | AA10 | AA10 | yes |
| 1181 | 00:8029 | 00:835F | 3 | 0xD8 | 0x4920 | AB58 | AB58 | yes |
| 1182 | 00:8029 | 00:835F | 1 | 0xE0 | 0x49A0 | ACA0 | ACA0 | yes |
| 1183 | 00:8029 | 00:835F | 3 | 0xE8 | 0x4920 | AA10 | AA10 | yes |
| 1184 | 00:8029 | 00:835F | 1 | 0xF0 | 0x49A0 | ACA0 | ACA0 | yes |
| 1185 | 00:8029 | 00:835F | 2 | 0xF8 | 0x4920 | AA10 | AA10 | yes |
| 1186 | 00:8029 | 00:835F | 1 | 0x00 | 0x49A0 | AB58 | AB58 | yes |
| 1187 | 00:8029 | 00:835F | 2 | 0x08 | 0x4920 | AA10 | AA10 | yes |
| 1188 | 00:8029 | 00:835F | 1 | 0x10 | 0x49A0 | AB58 | AB58 | yes |
| 1189 | 00:8029 | 00:835F | 2 | 0x18 | 0x4920 | AA10 | AA10 | yes |
| 1190 | 00:8029 | 00:835F | 1 | 0x20 | 0x49A0 | AB58 | AB58 | yes |
| 1191 | 00:8029 | 00:835F | 3 | 0x28 | 0x4920 | AA10 | AA10 | yes |
| 1192 | 00:8029 | 00:835F | 2 | 0x30 | 0x49A0 | ACA0 | ACA0 | yes |
| 1193 | 00:8029 | 00:835F | 1 | 0x38 | 0x4920 | AB58 | AB58 | yes |
| 1194 | 00:8029 | 00:835F | 2 | 0x40 | 0x49A0 | AA10 | AA10 | yes |
| 1195 | 00:8029 | 00:835F | 1 | 0x48 | 0x4920 | AB58 | AB58 | yes |
| 1196 | 00:8029 | 00:835F | 1 | 0x48 | 0x49A0 | AA10 | AA10 | yes |
| 1198 | 00:8029 | 00:835F | 2 | 0x58 | 0x4920 | ACA0 | ACA0 | yes |
| 1199 | 00:8029 | 00:835F | 1 | 0x60 | 0x49A0 | AB58 | AB58 | yes |
| 1200 | 00:8029 | 00:835F | 3 | 0x68 | 0x4920 | AA10 | AA10 | yes |

## Ranges

- `state0204` on burst frames: `[{'value': 2, 'startFrame': 1165, 'endFrame': 1165}, {'value': 3, 'startFrame': 1170, 'endFrame': 1170}, {'value': 1, 'startFrame': 1172, 'endFrame': 1172}, {'value': 3, 'startFrame': 1174, 'endFrame': 1175}, {'value': 2, 'startFrame': 1177, 'endFrame': 1177}, {'value': 3, 'startFrame': 1178, 'endFrame': 1178}, {'value': 1, 'startFrame': 1179, 'endFrame': 1179}, {'value': 2, 'startFrame': 1180, 'endFrame': 1180}, {'value': 3, 'startFrame': 1181, 'endFrame': 1181}, {'value': 1, 'startFrame': 1182, 'endFrame': 1182}, {'value': 3, 'startFrame': 1183, 'endFrame': 1183}, {'value': 1, 'startFrame': 1184, 'endFrame': 1184}, {'value': 2, 'startFrame': 1185, 'endFrame': 1185}, {'value': 1, 'startFrame': 1186, 'endFrame': 1186}, {'value': 2, 'startFrame': 1187, 'endFrame': 1187}, {'value': 1, 'startFrame': 1188, 'endFrame': 1188}, {'value': 2, 'startFrame': 1189, 'endFrame': 1189}, {'value': 1, 'startFrame': 1190, 'endFrame': 1190}, {'value': 3, 'startFrame': 1191, 'endFrame': 1191}, {'value': 2, 'startFrame': 1192, 'endFrame': 1192}, {'value': 1, 'startFrame': 1193, 'endFrame': 1193}, {'value': 2, 'startFrame': 1194, 'endFrame': 1194}, {'value': 1, 'startFrame': 1195, 'endFrame': 1196}, {'value': 2, 'startFrame': 1198, 'endFrame': 1198}, {'value': 1, 'startFrame': 1199, 'endFrame': 1199}, {'value': 3, 'startFrame': 1200, 'endFrame': 1200}]`
- `dp0054` on burst frames: `[{'value': '0x88', 'startFrame': 1165, 'endFrame': 1165}, {'value': '0x90', 'startFrame': 1170, 'endFrame': 1170}, {'value': '0x98', 'startFrame': 1172, 'endFrame': 1172}, {'value': '0xA8', 'startFrame': 1174, 'endFrame': 1175}, {'value': '0xB8', 'startFrame': 1177, 'endFrame': 1177}, {'value': '0xC0', 'startFrame': 1178, 'endFrame': 1178}, {'value': '0xC8', 'startFrame': 1179, 'endFrame': 1179}, {'value': '0xD0', 'startFrame': 1180, 'endFrame': 1180}, {'value': '0xD8', 'startFrame': 1181, 'endFrame': 1181}, {'value': '0xE0', 'startFrame': 1182, 'endFrame': 1182}, {'value': '0xE8', 'startFrame': 1183, 'endFrame': 1183}, {'value': '0xF0', 'startFrame': 1184, 'endFrame': 1184}, {'value': '0xF8', 'startFrame': 1185, 'endFrame': 1185}, {'value': '0x00', 'startFrame': 1186, 'endFrame': 1186}, {'value': '0x08', 'startFrame': 1187, 'endFrame': 1187}, {'value': '0x10', 'startFrame': 1188, 'endFrame': 1188}, {'value': '0x18', 'startFrame': 1189, 'endFrame': 1189}, {'value': '0x20', 'startFrame': 1190, 'endFrame': 1190}, {'value': '0x28', 'startFrame': 1191, 'endFrame': 1191}, {'value': '0x30', 'startFrame': 1192, 'endFrame': 1192}, {'value': '0x38', 'startFrame': 1193, 'endFrame': 1193}, {'value': '0x40', 'startFrame': 1194, 'endFrame': 1194}, {'value': '0x48', 'startFrame': 1195, 'endFrame': 1196}, {'value': '0x58', 'startFrame': 1198, 'endFrame': 1198}, {'value': '0x60', 'startFrame': 1199, 'endFrame': 1199}, {'value': '0x68', 'startFrame': 1200, 'endFrame': 1200}]`
- direct blob sequence: `[{'value': 'AB58', 'startFrame': 1165, 'endFrame': 1165}, {'value': 'ACA0', 'startFrame': 1170, 'endFrame': 1170}, {'value': 'AA10', 'startFrame': 1172, 'endFrame': 1172}, {'value': 'AB58', 'startFrame': 1174, 'endFrame': 1174}, {'value': 'ACA0', 'startFrame': 1175, 'endFrame': 1175}, {'value': 'AA10', 'startFrame': 1177, 'endFrame': 1177}, {'value': 'AB58', 'startFrame': 1178, 'endFrame': 1178}, {'value': 'ACA0', 'startFrame': 1179, 'endFrame': 1179}, {'value': 'AA10', 'startFrame': 1180, 'endFrame': 1180}, {'value': 'AB58', 'startFrame': 1181, 'endFrame': 1181}, {'value': 'ACA0', 'startFrame': 1182, 'endFrame': 1182}, {'value': 'AA10', 'startFrame': 1183, 'endFrame': 1183}, {'value': 'ACA0', 'startFrame': 1184, 'endFrame': 1184}, {'value': 'AA10', 'startFrame': 1185, 'endFrame': 1185}, {'value': 'AB58', 'startFrame': 1186, 'endFrame': 1186}, {'value': 'AA10', 'startFrame': 1187, 'endFrame': 1187}, {'value': 'AB58', 'startFrame': 1188, 'endFrame': 1188}, {'value': 'AA10', 'startFrame': 1189, 'endFrame': 1189}, {'value': 'AB58', 'startFrame': 1190, 'endFrame': 1190}, {'value': 'AA10', 'startFrame': 1191, 'endFrame': 1191}, {'value': 'ACA0', 'startFrame': 1192, 'endFrame': 1192}, {'value': 'AB58', 'startFrame': 1193, 'endFrame': 1193}, {'value': 'AA10', 'startFrame': 1194, 'endFrame': 1194}, {'value': 'AB58', 'startFrame': 1195, 'endFrame': 1195}, {'value': 'AA10', 'startFrame': 1196, 'endFrame': 1196}, {'value': 'ACA0', 'startFrame': 1198, 'endFrame': 1198}, {'value': 'AB58', 'startFrame': 1199, 'endFrame': 1199}, {'value': 'AA10', 'startFrame': 1200, 'endFrame': 1200}]`
- VMADD target sequence: `[{'value': '0x49A0', 'startFrame': 1165, 'endFrame': 1165}, {'value': '0x4920', 'startFrame': 1170, 'endFrame': 1170}, {'value': '0x49A0', 'startFrame': 1172, 'endFrame': 1172}, {'value': '0x4920', 'startFrame': 1174, 'endFrame': 1174}, {'value': '0x49A0', 'startFrame': 1175, 'endFrame': 1175}, {'value': '0x4920', 'startFrame': 1177, 'endFrame': 1177}, {'value': '0x49A0', 'startFrame': 1178, 'endFrame': 1178}, {'value': '0x4920', 'startFrame': 1179, 'endFrame': 1179}, {'value': '0x49A0', 'startFrame': 1180, 'endFrame': 1180}, {'value': '0x4920', 'startFrame': 1181, 'endFrame': 1181}, {'value': '0x49A0', 'startFrame': 1182, 'endFrame': 1182}, {'value': '0x4920', 'startFrame': 1183, 'endFrame': 1183}, {'value': '0x49A0', 'startFrame': 1184, 'endFrame': 1184}, {'value': '0x4920', 'startFrame': 1185, 'endFrame': 1185}, {'value': '0x49A0', 'startFrame': 1186, 'endFrame': 1186}, {'value': '0x4920', 'startFrame': 1187, 'endFrame': 1187}, {'value': '0x49A0', 'startFrame': 1188, 'endFrame': 1188}, {'value': '0x4920', 'startFrame': 1189, 'endFrame': 1189}, {'value': '0x49A0', 'startFrame': 1190, 'endFrame': 1190}, {'value': '0x4920', 'startFrame': 1191, 'endFrame': 1191}, {'value': '0x49A0', 'startFrame': 1192, 'endFrame': 1192}, {'value': '0x4920', 'startFrame': 1193, 'endFrame': 1193}, {'value': '0x49A0', 'startFrame': 1194, 'endFrame': 1194}, {'value': '0x4920', 'startFrame': 1195, 'endFrame': 1195}, {'value': '0x49A0', 'startFrame': 1196, 'endFrame': 1196}, {'value': '0x4920', 'startFrame': 1198, 'endFrame': 1198}, {'value': '0x49A0', 'startFrame': 1199, 'endFrame': 1199}, {'value': '0x4920', 'startFrame': 1200, 'endFrame': 1200}]`
