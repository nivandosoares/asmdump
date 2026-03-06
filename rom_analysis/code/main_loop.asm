; ROM Archaeology: Main Loop / Scheduler Notes
;
; Source anchors:
; - bank0.asm scheduler and callbacks (see docs/bank0_flow.md)
; - bank1.asm bootstrap callback chain (see docs/bootstrap_9D69_analysis.md)
;
; Confirmed callback slots:
;   Active main callback: $0038-$003A
;   Active NMI callback : $003B-$003D
;   Active IRQ callback : $003E-$0040
;
; Confirmed staging slots:
;   Pending main callback: $096C-$096E
;   Pending NMI callback : $096F-$0971
;
; NMI queue and DMA state:
;   Queue read/end: $53 / $54 -> WRAM $0600 descriptors
;   OAM DMA pending: $096A
;   DMA budget    : $0972-$0973
;
; TODO main-loop archaeology (priority order):
; 1) Find first front-end callback that stages a bank 30 target in $096C-$096E.
; 2) Record transition predicates (menu state, frame counter, input gates).
; 3) Build a callback transition graph for RESET -> attract -> menu -> race.
;
; Quick hunt commands:
;   rg -n "\\$096C|\\$096D|\\$096E|L000385|L0003A0" bank0.asm bank1.asm bank30.asm
;   rg -n "jsl\\s+\\$1E|jsl\\s+L1E|jsl.*bank30" bank*.asm
