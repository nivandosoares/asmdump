# Raw Visible BG Diff

- Reference frame: `1500`
- Comparison frame: `1780`
- Layer: `bg2`
- Reference PPU state: `/home/nivando-soares/asmdump/tools/out/car_select_frame_1500_frame_01500_ppu_state.json`
- Comparison PPU state: `/home/nivando-soares/asmdump/tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json`

## Summary

- State fields match: `True`
- Changed visible cells: `11`
- Unchanged visible cells: `885`
- Zero -> nonzero: `0`
- Nonzero -> zero: `0`
- Nonzero -> nonzero: `11`
- Changed pixel bbox: `{'screenPixelLeft': 40, 'screenPixelTop': 0, 'screenPixelRight': 247, 'screenPixelBottom': 7}`

## State

- Reference state: `{'tilemapAddress': 4096, 'chrAddress': 12288, 'doubleWidth': False, 'doubleHeight': True, 'largeTiles': False, 'hscroll': 0, 'vscroll': 1023}`
- Comparison state: `{'tilemapAddress': 4096, 'chrAddress': 12288, 'doubleWidth': False, 'doubleHeight': True, 'largeTiles': False, 'hscroll': 0, 'vscroll': 1023}`

## Sample Changes

- screen=(5,0) ref={'entryWord': 235, 'tileIndex': 235, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 233, 'tileIndex': 233, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(16,0) ref={'entryWord': 304, 'tileIndex': 304, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 300, 'tileIndex': 300, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(17,0) ref={'entryWord': 305, 'tileIndex': 305, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 304, 'tileIndex': 304, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(18,0) ref={'entryWord': 306, 'tileIndex': 306, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 305, 'tileIndex': 305, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(19,0) ref={'entryWord': 307, 'tileIndex': 307, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 306, 'tileIndex': 306, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(20,0) ref={'entryWord': 308, 'tileIndex': 308, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 307, 'tileIndex': 307, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(21,0) ref={'entryWord': 309, 'tileIndex': 309, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 308, 'tileIndex': 308, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(22,0) ref={'entryWord': 213, 'tileIndex': 213, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 309, 'tileIndex': 309, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(23,0) ref={'entryWord': 214, 'tileIndex': 214, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 212, 'tileIndex': 212, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(24,0) ref={'entryWord': 214, 'tileIndex': 214, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 212, 'tileIndex': 212, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(30,0) ref={'entryWord': 97, 'tileIndex': 97, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 95, 'tileIndex': 95, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
