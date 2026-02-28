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
BOOT_SCREEN_PREVIEW := $(OUT_DIR)/bank1_boot_screen_variant0.ppm
BOOT_SCREEN_PREVIEW_JSON := $(OUT_DIR)/bank1_boot_screen_variant0.json
BOOT_SCREEN_OVERLAY_PREVIEW := $(OUT_DIR)/bank1_boot_screen_variant0_overlay.ppm
BOOT_SCREEN_OVERLAY_PREVIEW_JSON := $(OUT_DIR)/bank1_boot_screen_variant0_overlay.json
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
BANK1_CREDITS_SCENE_PREFIX := $(OUT_DIR)/bank1_credits_scene
BANK1_CREDITS_SCENE_VRAM := $(BANK1_CREDITS_SCENE_PREFIX)_vram.bin
BANK1_CREDITS_SCENE_CGRAM := $(BANK1_CREDITS_SCENE_PREFIX)_cgram.bin
BANK1_CREDITS_SCENE_PPU := $(BANK1_CREDITS_SCENE_PREFIX)_ppu_state.json
BANK1_CREDITS_SCENE_JSON := $(BANK1_CREDITS_SCENE_PREFIX).json
BANK1_CREDITS_SCENE_PPM := $(BANK1_CREDITS_SCENE_PREFIX).ppm
BANK1_CREDITS_SCENE_DIFF := $(OUT_DIR)/bank1_credits_scene_vs_mesen_diff.ppm
BANK1_A35A_SCENE_PREFIX := $(OUT_DIR)/bank1_l00a35a_scene
BANK1_A35A_SCENE_VRAM := $(BANK1_A35A_SCENE_PREFIX)_vram.bin
BANK1_A35A_SCENE_CGRAM := $(BANK1_A35A_SCENE_PREFIX)_cgram.bin
BANK1_A35A_SCENE_PPU := $(BANK1_A35A_SCENE_PREFIX)_ppu_state.json
BANK1_A35A_SCENE_JSON := $(BANK1_A35A_SCENE_PREFIX).json
BANK1_A35A_SCENE_PPM := $(BANK1_A35A_SCENE_PREFIX).ppm
MESEN_BOOT_FRAME := ../.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png
MESEN_FRAME ?= 300
MESEN_FRAME_DIR ?= $(OUT_DIR)/mesen_frame$(MESEN_FRAME)
INTRO_LOOP_PREFIX := $(OUT_DIR)/intro_loop
INTRO_LOOP_SUMMARY := $(INTRO_LOOP_PREFIX).json
INTRO_LOOP_SEQUENCE := $(OUT_DIR)/intro_loop_sequence.txt
INTRO_LOOP_SEQUENCE_JSON := $(OUT_DIR)/intro_loop_sequence.json
BALLISTIC_NATIVE_DIR := $(OUT_DIR)/ballistic_native
BALLISTIC_NATIVE_CLIP := $(BALLISTIC_NATIVE_DIR)/ballistic_splash.txt
BALLISTIC_NATIVE_JSON := $(BALLISTIC_NATIVE_DIR)/ballistic_splash.json
BALLISTIC_NATIVE_PREVIEW := $(BALLISTIC_NATIVE_DIR)/ballistic_splash_preview.ppm
BALLISTIC_NATIVE_SEQUENCE := $(OUT_DIR)/ballistic_native_sequence.txt
BALLISTIC_ROM_DIR := $(OUT_DIR)/ballistic_rom
BALLISTIC_ROM_CLIP := $(BALLISTIC_ROM_DIR)/ballistic_splash.txt
BALLISTIC_ROM_JSON := $(BALLISTIC_ROM_DIR)/ballistic_splash.json
BALLISTIC_ROM_PREVIEW := $(BALLISTIC_ROM_DIR)/ballistic_splash_preview.ppm
BALLISTIC_ROM_SEQUENCE := $(OUT_DIR)/ballistic_rom_sequence.txt
BALLISTIC_CALLBACK_DIR := $(OUT_DIR)/ballistic_callback
BALLISTIC_CALLBACK_ASSET := $(BALLISTIC_CALLBACK_DIR)/ballistic_a39c.txt
BALLISTIC_CALLBACK_JSON := $(BALLISTIC_CALLBACK_DIR)/ballistic_a39c.json
BALLISTIC_CALLBACK_SEQUENCE := $(OUT_DIR)/ballistic_callback_sequence.txt
INTRO_LOOP_HYBRID_SEQUENCE := $(OUT_DIR)/intro_loop_hybrid_sequence.txt
INTRO_LOOP_HYBRID_SEQUENCE_JSON := $(OUT_DIR)/intro_loop_hybrid_sequence.json
MESEN_TIMEOUT_SECONDS ?= 75

.PHONY: all previews bank3-palettes boot-palettes boot-palettes-flat boot-screen-manifest boot-vram-preview boot-vram-overlay-preview boot-screen-preview boot-screen-overlay-preview bank6-preview bank7-scan bank7-headers bank7-42fb0 bank7-42fb0-preview bank7-26fb0 bank7-26fb0-preview bank7-chunk1-preview bank9-preview bank1-credits-scene-preview bank1-credits-scene-compare bank1-a35a-scene-preview mesen-ppu-frame intro-loop-dump intro-loop-sequence ballistic-native-clip ballistic-rom-clip ballistic-callback-asset intro-loop-hybrid-sequence

all: previews

previews: bank3-palettes boot-palettes boot-palettes-flat boot-screen-manifest boot-vram-preview boot-screen-preview bank6-preview bank7-scan bank7-headers bank7-42fb0 bank7-42fb0-preview bank7-26fb0 bank7-26fb0-preview bank7-chunk1-preview bank9-preview bank1-credits-scene-preview bank1-a35a-scene-preview

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

$(BOOT_SCREEN_PREVIEW) $(BOOT_SCREEN_PREVIEW_JSON): render_boot_screen.py boot_state_model.py $(BOOT_VRAM_BIN) $(BOOT_PALETTE_JSON) $(ROM) | $(OUT_DIR)
	$(PYTHON) render_boot_screen.py $(BOOT_VRAM_BIN) $(BOOT_PALETTE_JSON) $(BOOT_SCREEN_PREVIEW) --rom $(ROM) --json-out $(BOOT_SCREEN_PREVIEW_JSON)

boot-screen-preview: $(BOOT_SCREEN_PREVIEW) $(BOOT_SCREEN_PREVIEW_JSON)

$(BOOT_SCREEN_OVERLAY_PREVIEW) $(BOOT_SCREEN_OVERLAY_PREVIEW_JSON): render_boot_screen.py boot_state_model.py $(BOOT_VRAM_OVERLAY_BIN) $(BOOT_PALETTE_JSON) $(ROM) | $(OUT_DIR)
	$(PYTHON) render_boot_screen.py $(BOOT_VRAM_OVERLAY_BIN) $(BOOT_PALETTE_JSON) $(BOOT_SCREEN_OVERLAY_PREVIEW) --rom $(ROM) --json-out $(BOOT_SCREEN_OVERLAY_PREVIEW_JSON)

boot-screen-overlay-preview: $(BOOT_SCREEN_OVERLAY_PREVIEW) $(BOOT_SCREEN_OVERLAY_PREVIEW_JSON)

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

$(BANK1_CREDITS_SCENE_VRAM) $(BANK1_CREDITS_SCENE_CGRAM) $(BANK1_CREDITS_SCENE_PPU) $(BANK1_CREDITS_SCENE_JSON) $(BANK1_CREDITS_SCENE_PPM): build_bank1_credits_scene.py build_boot_vram.py render_boot_screen.py $(ROM) | $(OUT_DIR)
	$(PYTHON) build_bank1_credits_scene.py $(ROM) $(BANK1_CREDITS_SCENE_PREFIX)

bank1-credits-scene-preview: $(BANK1_CREDITS_SCENE_VRAM) $(BANK1_CREDITS_SCENE_CGRAM) $(BANK1_CREDITS_SCENE_PPU) $(BANK1_CREDITS_SCENE_JSON) $(BANK1_CREDITS_SCENE_PPM)

$(BANK1_CREDITS_SCENE_DIFF): compare_frames.py $(MESEN_BOOT_FRAME) $(BANK1_CREDITS_SCENE_PPM) | $(OUT_DIR)
	$(PYTHON) compare_frames.py $(MESEN_BOOT_FRAME) $(BANK1_CREDITS_SCENE_PPM) --diff-out $(BANK1_CREDITS_SCENE_DIFF)

bank1-credits-scene-compare: $(BANK1_CREDITS_SCENE_DIFF)

$(BANK1_A35A_SCENE_VRAM) $(BANK1_A35A_SCENE_CGRAM) $(BANK1_A35A_SCENE_PPU) $(BANK1_A35A_SCENE_JSON) $(BANK1_A35A_SCENE_PPM): build_bank1_helper_scene.py build_boot_vram.py render_boot_screen.py $(ROM) | $(OUT_DIR)
	$(PYTHON) build_bank1_helper_scene.py $(ROM) $(BANK1_A35A_SCENE_PREFIX) --helper-index 4 --visible-layer bg1 --scene-name bank1_L00A35A_frontend --source-routine 01:A35A

bank1-a35a-scene-preview: $(BANK1_A35A_SCENE_VRAM) $(BANK1_A35A_SCENE_CGRAM) $(BANK1_A35A_SCENE_PPU) $(BANK1_A35A_SCENE_JSON) $(BANK1_A35A_SCENE_PPM)

mesen-ppu-frame: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame $(MESEN_FRAME) --out-dir $(MESEN_FRAME_DIR)

$(INTRO_LOOP_SUMMARY): | $(OUT_DIR)
	MESEN_TIMEOUT_SECONDS=$(MESEN_TIMEOUT_SECONDS) \
	TD2_BG_RANGE_START_FRAME=654 \
	TD2_BG_RANGE_END_FRAME=2070 \
	TD2_BG_RANGE_STEP=4 \
	TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
	TD2_BG_RANGE_OUTPUT_PREFIX=$(abspath $(INTRO_LOOP_PREFIX)) \
	../validation/run_mesen_dump_bg_range.sh $(abspath $(ROM))

intro-loop-dump: $(INTRO_LOOP_SUMMARY)

$(INTRO_LOOP_SEQUENCE) $(INTRO_LOOP_SEQUENCE_JSON): build_scene_sequence_manifest.py $(INTRO_LOOP_SUMMARY) | $(OUT_DIR)
	$(PYTHON) build_scene_sequence_manifest.py $(INTRO_LOOP_SUMMARY) $(INTRO_LOOP_SEQUENCE) --json-out $(INTRO_LOOP_SEQUENCE_JSON) --end-frame-exclusive 2072 --prefer-screenshot

intro-loop-sequence: $(INTRO_LOOP_SEQUENCE) $(INTRO_LOOP_SEQUENCE_JSON)

$(BALLISTIC_NATIVE_CLIP) $(BALLISTIC_NATIVE_JSON) $(BALLISTIC_NATIVE_PREVIEW) $(BALLISTIC_NATIVE_SEQUENCE): build_indexed_palette_animation.py $(INTRO_LOOP_SUMMARY) | $(OUT_DIR)
	mkdir -p $(BALLISTIC_NATIVE_DIR)
	$(PYTHON) build_indexed_palette_animation.py $(INTRO_LOOP_SUMMARY) $(BALLISTIC_NATIVE_CLIP) \
		--start-frame 654 \
		--end-frame-exclusive 958 \
		--json-out $(BALLISTIC_NATIVE_JSON) \
		--preview-out $(BALLISTIC_NATIVE_PREVIEW) \
		--sequence-manifest $(BALLISTIC_NATIVE_SEQUENCE)

ballistic-native-clip: $(BALLISTIC_NATIVE_CLIP) $(BALLISTIC_NATIVE_JSON) $(BALLISTIC_NATIVE_PREVIEW) $(BALLISTIC_NATIVE_SEQUENCE)

$(BALLISTIC_ROM_CLIP) $(BALLISTIC_ROM_JSON) $(BALLISTIC_ROM_PREVIEW) $(BALLISTIC_ROM_SEQUENCE): build_ballistic_rom_clip.py $(ROM) $(BANK1_A35A_SCENE_CGRAM) $(BALLISTIC_NATIVE_JSON) $(BALLISTIC_NATIVE_CLIP) | $(OUT_DIR)
	mkdir -p $(BALLISTIC_ROM_DIR)
	$(PYTHON) build_ballistic_rom_clip.py $(ROM) $(BANK1_A35A_SCENE_CGRAM) $(BALLISTIC_NATIVE_JSON) $(BALLISTIC_ROM_CLIP) \
		--json-out $(BALLISTIC_ROM_JSON) \
		--preview-out $(BALLISTIC_ROM_PREVIEW) \
		--sequence-manifest $(BALLISTIC_ROM_SEQUENCE)

ballistic-rom-clip: $(BALLISTIC_ROM_CLIP) $(BALLISTIC_ROM_JSON) $(BALLISTIC_ROM_PREVIEW) $(BALLISTIC_ROM_SEQUENCE)

$(BALLISTIC_CALLBACK_ASSET) $(BALLISTIC_CALLBACK_JSON) $(BALLISTIC_CALLBACK_SEQUENCE): build_ballistic_callback_asset.py $(ROM) $(BANK1_A35A_SCENE_CGRAM) $(BALLISTIC_ROM_JSON) | $(OUT_DIR)
	mkdir -p $(BALLISTIC_CALLBACK_DIR)
	$(PYTHON) build_ballistic_callback_asset.py $(ROM) $(BANK1_A35A_SCENE_CGRAM) $(BALLISTIC_ROM_JSON) $(BALLISTIC_CALLBACK_ASSET) \
		--json-out $(BALLISTIC_CALLBACK_JSON) \
		--sequence-manifest $(BALLISTIC_CALLBACK_SEQUENCE)

ballistic-callback-asset: $(BALLISTIC_CALLBACK_ASSET) $(BALLISTIC_CALLBACK_JSON) $(BALLISTIC_CALLBACK_SEQUENCE)

$(INTRO_LOOP_HYBRID_SEQUENCE) $(INTRO_LOOP_HYBRID_SEQUENCE_JSON): splice_sequence_manifest.py $(INTRO_LOOP_SEQUENCE_JSON) $(BALLISTIC_CALLBACK_ASSET) | $(OUT_DIR)
	$(PYTHON) splice_sequence_manifest.py $(INTRO_LOOP_SEQUENCE_JSON) $(INTRO_LOOP_HYBRID_SEQUENCE) \
		--replace-start-frame 654 \
		--replace-end-frame-exclusive 958 \
		--replacement-type ballistic_a39c \
		--replacement-path $(BALLISTIC_CALLBACK_ASSET) \
		--replacement-duration 304 \
		--json-out $(INTRO_LOOP_HYBRID_SEQUENCE_JSON)

intro-loop-hybrid-sequence: $(INTRO_LOOP_HYBRID_SEQUENCE) $(INTRO_LOOP_HYBRID_SEQUENCE_JSON)
