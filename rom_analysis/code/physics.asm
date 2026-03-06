; ROM Archaeology: Physics / AI Notes
;
; Primary target:
; - bank10.asm (physics/AI core)
;
; Known external-facing entry candidates:
;   $0A:0000  (from bank 6)
;   $0A:5322  (from bank 7)
;   $0A:8759  (from bank 7)
;   $0A:9FB5  (from bank 4)
;   $0A:B634  (from bank 11)
;
; Dependency note:
; - bank 10 calls into bank 30 dispatch/service entries.
;
; TODO physics archaeology:
; 1) Trace RAM state touched by each external bank 10 entry point.
; 2) Partition state into:
;    - vehicle dynamics
;    - AI/opponent behavior
;    - race/session state
; 3) Identify deterministic update cadence (per-frame, per-NMI, event-driven).
; 4) Derive a first C struct layout for portable runtime experiments.
;
; Quick hunt commands:
;   rg -n "jsl|jsr|rtl|rts" bank10.asm
;   rg -n "\\$1E:|bank30|jsl.*\\$1E" bank10.asm bank30.asm
;   rg -n "\\$0A:0000|\\$0A:5322|\\$0A:8759|\\$0A:9FB5|\\$0A:B634" docs/bank10_11_30_notes.md
