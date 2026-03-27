# Raw Visible BG Diff

- Reference frame: `1640`
- Comparison frame: `1780`
- Layer: `bg2`
- Reference PPU state: `/home/nivando-soares/asmdump/tools/out/car_select_frame_1640_rightnav_frame_01640_ppu_state.json`
- Comparison PPU state: `/home/nivando-soares/asmdump/tools/out/car_select_frame_1780_right2_frame_01780_ppu_state.json`

## Summary

- State fields match: `True`
- Changed visible cells: `27`
- Unchanged visible cells: `869`
- Zero -> nonzero: `0`
- Nonzero -> zero: `0`
- Nonzero -> nonzero: `27`
- Changed pixel bbox: `{'screenPixelLeft': 32, 'screenPixelTop': 0, 'screenPixelRight': 247, 'screenPixelBottom': 7}`

## State

- Reference state: `{'tilemapAddress': 4096, 'chrAddress': 12288, 'doubleWidth': False, 'doubleHeight': True, 'largeTiles': False, 'hscroll': 0, 'vscroll': 1023}`
- Comparison state: `{'tilemapAddress': 4096, 'chrAddress': 12288, 'doubleWidth': False, 'doubleHeight': True, 'largeTiles': False, 'hscroll': 0, 'vscroll': 1023}`

## Sample Changes

- screen=(4,0) ref={'entryWord': 307, 'tileIndex': 307, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 293, 'tileIndex': 293, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(5,0) ref={'entryWord': 249, 'tileIndex': 249, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 233, 'tileIndex': 233, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(6,0) ref={'entryWord': 308, 'tileIndex': 308, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 294, 'tileIndex': 294, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(7,0) ref={'entryWord': 309, 'tileIndex': 309, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 295, 'tileIndex': 295, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(8,0) ref={'entryWord': 310, 'tileIndex': 310, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 296, 'tileIndex': 296, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(9,0) ref={'entryWord': 311, 'tileIndex': 311, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 297, 'tileIndex': 297, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(10,0) ref={'entryWord': 312, 'tileIndex': 312, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 298, 'tileIndex': 298, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(11,0) ref={'entryWord': 313, 'tileIndex': 313, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 299, 'tileIndex': 299, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(12,0) ref={'entryWord': 314, 'tileIndex': 314, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 300, 'tileIndex': 300, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(13,0) ref={'entryWord': 315, 'tileIndex': 315, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 301, 'tileIndex': 301, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(14,0) ref={'entryWord': 316, 'tileIndex': 316, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 302, 'tileIndex': 302, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(15,0) ref={'entryWord': 317, 'tileIndex': 317, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 303, 'tileIndex': 303, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(16,0) ref={'entryWord': 318, 'tileIndex': 318, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 300, 'tileIndex': 300, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(17,0) ref={'entryWord': 319, 'tileIndex': 319, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 304, 'tileIndex': 304, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(18,0) ref={'entryWord': 320, 'tileIndex': 320, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 305, 'tileIndex': 305, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(19,0) ref={'entryWord': 321, 'tileIndex': 321, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 306, 'tileIndex': 306, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(20,0) ref={'entryWord': 322, 'tileIndex': 322, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 307, 'tileIndex': 307, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(21,0) ref={'entryWord': 323, 'tileIndex': 323, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 308, 'tileIndex': 308, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(22,0) ref={'entryWord': 227, 'tileIndex': 227, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 309, 'tileIndex': 309, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(23,0) ref={'entryWord': 228, 'tileIndex': 228, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 212, 'tileIndex': 212, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(24,0) ref={'entryWord': 228, 'tileIndex': 228, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 212, 'tileIndex': 212, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(25,0) ref={'entryWord': 324, 'tileIndex': 324, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 310, 'tileIndex': 310, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(26,0) ref={'entryWord': 325, 'tileIndex': 325, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 311, 'tileIndex': 311, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(27,0) ref={'entryWord': 326, 'tileIndex': 326, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 312, 'tileIndex': 312, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(28,0) ref={'entryWord': 327, 'tileIndex': 327, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 313, 'tileIndex': 313, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(29,0) ref={'entryWord': 328, 'tileIndex': 328, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 314, 'tileIndex': 314, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
- screen=(30,0) ref={'entryWord': 103, 'tileIndex': 103, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0} cmp={'entryWord': 95, 'tileIndex': 95, 'palette': 0, 'priority': 0, 'hflip': 0, 'vflip': 0}
