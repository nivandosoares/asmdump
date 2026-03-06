; ROM Archaeology: Rendering / Rasterizer Notes
;
; Primary targets:
; - bank11.asm (road rasterizer and render staging)
; - bank0.asm IRQ split setup (L000341 / L000361)
; - bank1.asm front-end mode 7 transitions
;
; Known notes:
; - bank 11 is heavily internal-call oriented and has no RTL boundaries.
; - bank 11 depends on bank 10 (physics/AI side feeds render state).
; - gameplay split IRQ setup is routed through bank 0 helper L000341.
;
; TODO render archaeology:
; 1) Enumerate bank 11 externally reachable entry points and caller contexts.
; 2) Trace per-frame writes that influence:
;    - scroll registers cache at $0F32-$0F41
;    - HDMA tables used for split effects and cockpit/road composition
; 3) Identify road geometry table formats and tile/tilemap lookup schemes.
; 4) Produce candidate state contract for a software rasterizer port.
;
; Quick hunt commands:
;   rg -n "L000341|L000361|HDMAEN|DMADEST7|VTIMEL|HTIMEL" bank0.asm
;   rg -n "jsl|jsr|st[axy].*\\$0F3|sta.*\\$21" bank11.asm
;   rg -n "\\$0B:B643|\\$0B:122E|\\$0B:7422" docs/bank10_11_30_notes.md
