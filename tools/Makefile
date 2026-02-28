PYTHON ?= python3
ROM ?= ../game.smc
OUT_DIR := out
PALETTE_JSON := $(OUT_DIR)/bank3_palettes.json
BOOT_PALETTE_JSON := $(OUT_DIR)/bank1_boot_palettes.json
BOOT_PALETTE_FLAT_JSON := $(OUT_DIR)/bank1_boot_palettes_flat.json
BOOT_SCREEN_JSON := $(OUT_DIR)/bank1_boot_screen.json
BOOT_VRAM_BIN := $(OUT_DIR)/bank1_boot_vram_variant0.bin
BOOT_VRAM_JSON := $(OUT_DIR)/bank1_boot_vram_variant0.json
BOOT_VRAM_4BPP := $(OUT_DIR)/bank1_boot_vram_variant0_4bpp.ppm
BOOT_VRAM_OVERLAY_BIN := $(OUT_DIR)/bank1_boot_vram_variant0_overlay.bin
BOOT_VRAM_OVERLAY_JSON := $(OUT_DIR)/bank1_boot_vram_variant0_overlay.json
BOOT_VRAM_OVERLAY_4BPP := $(OUT_DIR)/bank1_boot_vram_variant0_overlay_4bpp.ppm
BANK7_HEADER_JSON := $(OUT_DIR)/bank7_compression_headers.json
BANK7_42FB0_BIN := $(OUT_DIR)/bank7_42fb_8000.bin
BANK7_42FB0_JSON := $(OUT_DIR)/bank7_42fb_8000.json
BANK7_42FB0_GRAY := $(OUT_DIR)/bank7_42fb_8000_gray.ppm
BANK7_26FB0_BIN := $(OUT_DIR)/bank7_26fb_817a.bin
BANK7_26FB0_JSON := $(OUT_DIR)/bank7_26fb_817a.json
BANK7_26FB0_GRAY := $(OUT_DIR)/bank7_26fb_817a_gray.ppm
BANK6_GRAY := $(OUT_DIR)/bank6_tiles_gray.ppm
BANK6_PALETTE0 := $(OUT_DIR)/bank6_tiles_palette0.ppm
BANK7_CHUNKS := $(OUT_DIR)/bank7_chunks.json
BANK7_CHUNK1_GRAY := $(OUT_DIR)/bank7_chunk1_gray.ppm
BANK7_CHUNK1_PALETTE0 := $(OUT_DIR)/bank7_chunk1_palette0.ppm
BANK9_2BPP := $(OUT_DIR)/bank9_tiles_2bpp.ppm

.PHONY: all previews bank3-palettes boot-palettes boot-palettes-flat boot-screen-manifest boot-vram-preview boot-vram-overlay-preview bank6-preview bank7-scan bank7-headers bank7-42fb0 bank7-42fb0-preview bank7-26fb0 bank7-26fb0-preview bank7-chunk1-preview bank9-preview

all: previews

previews: bank3-palettes boot-palettes boot-palettes-flat boot-screen-manifest boot-vram-preview bank6-preview bank7-scan bank7-headers bank7-42fb0 bank7-42fb0-preview bank7-26fb0 bank7-26fb0-preview bank7-chunk1-preview bank9-preview

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(PALETTE_JSON): extract_bank3_palettes.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_bank3_palettes.py $(ROM) $(PALETTE_JSON)

bank3-palettes: $(PALETTE_JSON)

$(BOOT_PALETTE_JSON): extract_boot_palette_manifest.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_boot_palette_manifest.py $(ROM) $(BOOT_PALETTE_JSON)

boot-palettes: $(BOOT_PALETTE_JSON)

$(BOOT_PALETTE_FLAT_JSON): flatten_palette_manifest.py $(BOOT_PALETTE_JSON) | $(OUT_DIR)
	$(PYTHON) flatten_palette_manifest.py $(BOOT_PALETTE_JSON) $(BOOT_PALETTE_FLAT_JSON)

boot-palettes-flat: $(BOOT_PALETTE_FLAT_JSON)

$(BOOT_SCREEN_JSON): extract_boot_screen_manifest.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_boot_screen_manifest.py $(ROM) $(BOOT_SCREEN_JSON)

boot-screen-manifest: $(BOOT_SCREEN_JSON)

$(BOOT_VRAM_BIN) $(BOOT_VRAM_JSON): build_boot_vram.py $(ROM) $(BOOT_SCREEN_JSON) | $(OUT_DIR)
	$(PYTHON) build_boot_vram.py $(ROM) $(BOOT_SCREEN_JSON) $(BOOT_VRAM_BIN) --json-out $(BOOT_VRAM_JSON)

$(BOOT_VRAM_4BPP): extract_snes_tiles.py $(BOOT_VRAM_BIN) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(BOOT_VRAM_BIN) $(BOOT_VRAM_4BPP) --raw-binary --bpp 4 --byte-length 0xC000 --columns 32

boot-vram-preview: $(BOOT_VRAM_BIN) $(BOOT_VRAM_JSON) $(BOOT_VRAM_4BPP)

$(BOOT_VRAM_OVERLAY_BIN) $(BOOT_VRAM_OVERLAY_JSON): build_boot_vram.py $(ROM) $(BOOT_SCREEN_JSON) | $(OUT_DIR)
	$(PYTHON) build_boot_vram.py $(ROM) $(BOOT_SCREEN_JSON) $(BOOT_VRAM_OVERLAY_BIN) --json-out $(BOOT_VRAM_OVERLAY_JSON) --apply-optional-overlay

$(BOOT_VRAM_OVERLAY_4BPP): extract_snes_tiles.py $(BOOT_VRAM_OVERLAY_BIN) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(BOOT_VRAM_OVERLAY_BIN) $(BOOT_VRAM_OVERLAY_4BPP) --raw-binary --bpp 4 --byte-length 0xC000 --columns 32

boot-vram-overlay-preview: $(BOOT_VRAM_OVERLAY_BIN) $(BOOT_VRAM_OVERLAY_JSON) $(BOOT_VRAM_OVERLAY_4BPP)

$(BANK6_GRAY): extract_snes_tiles.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(ROM) $(BANK6_GRAY) --bank 6 --bpp 4

$(BANK6_PALETTE0): extract_snes_tiles.py $(PALETTE_JSON) $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(ROM) $(BANK6_PALETTE0) --bank 6 --bpp 4 --palette-json $(PALETTE_JSON) --palette-index 0

bank6-preview: $(BANK6_GRAY) $(BANK6_PALETTE0)

$(BANK7_CHUNKS): scan_structured_bank.py $(ROM) | $(OUT_DIR)
	$(PYTHON) scan_structured_bank.py $(ROM) --bank 7 --json-out $(BANK7_CHUNKS)

bank7-scan: $(BANK7_CHUNKS)

$(BANK7_HEADER_JSON): extract_compression_header_manifest.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_compression_header_manifest.py $(ROM) --bank 7 --json-out $(BANK7_HEADER_JSON)

bank7-headers: $(BANK7_HEADER_JSON)

$(BANK7_42FB0_BIN) $(BANK7_42FB0_JSON): decompress_td2_chunk.py $(ROM) | $(OUT_DIR)
	$(PYTHON) decompress_td2_chunk.py $(ROM) $(BANK7_42FB0_BIN) --bank 7 --addr 0x8000 --json-out $(BANK7_42FB0_JSON)

bank7-42fb0: $(BANK7_42FB0_BIN) $(BANK7_42FB0_JSON)

$(BANK7_42FB0_GRAY): extract_snes_tiles.py $(BANK7_42FB0_BIN) $(BANK7_42FB0_JSON) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(BANK7_42FB0_BIN) $(BANK7_42FB0_GRAY) --raw-binary --offset 0x6 --byte-length 0x1000 --bpp 4 --columns 16

bank7-42fb0-preview: $(BANK7_42FB0_GRAY)

$(BANK7_26FB0_BIN) $(BANK7_26FB0_JSON): decompress_td2_chunk.py $(ROM) | $(OUT_DIR)
	$(PYTHON) decompress_td2_chunk.py $(ROM) $(BANK7_26FB0_BIN) --bank 7 --addr 0x817A --json-out $(BANK7_26FB0_JSON)

bank7-26fb0: $(BANK7_26FB0_BIN) $(BANK7_26FB0_JSON)

$(BANK7_26FB0_GRAY): extract_snes_tiles.py $(BANK7_26FB0_BIN) $(BANK7_26FB0_JSON) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(BANK7_26FB0_BIN) $(BANK7_26FB0_GRAY) --raw-binary --bpp 4 --columns 16

bank7-26fb0-preview: $(BANK7_26FB0_GRAY)

$(BANK7_CHUNK1_GRAY): extract_snes_tiles.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(ROM) $(BANK7_CHUNK1_GRAY) --bank 7 --bpp 4 --offset 0x017e --byte-length 0x64c

$(BANK7_CHUNK1_PALETTE0): extract_snes_tiles.py $(PALETTE_JSON) $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(ROM) $(BANK7_CHUNK1_PALETTE0) --bank 7 --bpp 4 --offset 0x017e --byte-length 0x64c --palette-json $(PALETTE_JSON) --palette-index 0

bank7-chunk1-preview: $(BANK7_CHUNK1_GRAY) $(BANK7_CHUNK1_PALETTE0)

$(BANK9_2BPP): extract_snes_tiles.py $(ROM) | $(OUT_DIR)
	$(PYTHON) extract_snes_tiles.py $(ROM) $(BANK9_2BPP) --bank 9 --bpp 2

bank9-preview: $(BANK9_2BPP)
