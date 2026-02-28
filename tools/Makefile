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
BANK1_A00C_SCENE_PREFIX := $(OUT_DIR)/bank1_l00a00c_scene
BANK1_A00C_SCENE_VRAM := $(BANK1_A00C_SCENE_PREFIX)_vram.bin
BANK1_A00C_SCENE_CGRAM := $(BANK1_A00C_SCENE_PREFIX)_cgram.bin
BANK1_A00C_SCENE_PPU := $(BANK1_A00C_SCENE_PREFIX)_ppu_state.json
BANK1_A00C_SCENE_JSON := $(BANK1_A00C_SCENE_PREFIX).json
BANK1_A00C_SCENE_PPM := $(BANK1_A00C_SCENE_PREFIX).ppm
BANK1_QUEUE_978_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_978
BANK1_QUEUE_978_SCENE_VRAM := $(BANK1_QUEUE_978_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_978_SCENE_CGRAM := $(BANK1_QUEUE_978_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_978_SCENE_PPU := $(BANK1_QUEUE_978_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_978_SCENE_OAM := $(BANK1_QUEUE_978_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_978_SCENE_JSON := $(BANK1_QUEUE_978_SCENE_PREFIX).json
BANK1_QUEUE_978_SCENE_PPM := $(BANK1_QUEUE_978_SCENE_PREFIX).ppm
BANK1_QUEUE_978_SCENE_SEQUENCE := $(OUT_DIR)/bank1_bootstrap_queue_978_sequence.txt
BANK1_QUEUE_978_SCENE_SEQUENCE_JSON := $(OUT_DIR)/bank1_bootstrap_queue_978_sequence.json
BANK1_QUEUE_982_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_982
BANK1_QUEUE_982_SCENE_VRAM := $(BANK1_QUEUE_982_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_982_SCENE_CGRAM := $(BANK1_QUEUE_982_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_982_SCENE_PPU := $(BANK1_QUEUE_982_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_982_SCENE_OAM := $(BANK1_QUEUE_982_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_982_SCENE_JSON := $(BANK1_QUEUE_982_SCENE_PREFIX).json
BANK1_QUEUE_982_SCENE_PPM := $(BANK1_QUEUE_982_SCENE_PREFIX).ppm
BANK1_QUEUE_982_SCENE_SEQUENCE := $(OUT_DIR)/bank1_bootstrap_queue_982_sequence.txt
BANK1_QUEUE_982_SCENE_SEQUENCE_JSON := $(OUT_DIR)/bank1_bootstrap_queue_982_sequence.json
BANK1_QUEUE_986_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_986
BANK1_QUEUE_986_SCENE_VRAM := $(BANK1_QUEUE_986_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_986_SCENE_CGRAM := $(BANK1_QUEUE_986_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_986_SCENE_PPU := $(BANK1_QUEUE_986_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_986_SCENE_OAM := $(BANK1_QUEUE_986_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_986_SCENE_JSON := $(BANK1_QUEUE_986_SCENE_PREFIX).json
BANK1_QUEUE_986_SCENE_PPM := $(BANK1_QUEUE_986_SCENE_PREFIX).ppm
BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_986_noobj
BANK1_QUEUE_986_NOOBJ_SCENE_VRAM := $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_986_NOOBJ_SCENE_CGRAM := $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_986_NOOBJ_SCENE_PPU := $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_986_NOOBJ_SCENE_OAM := $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_986_NOOBJ_SCENE_JSON := $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX).json
BANK1_QUEUE_986_NOOBJ_SCENE_PPM := $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX).ppm
BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_986_bridgeoverride
BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM := $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_986_BRIDGEOAM_SCENE_CGRAM := $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPU := $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_986_BRIDGEOAM_SCENE_OAM := $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_986_BRIDGEOAM_SCENE_JSON := $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX).json
BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPM := $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX).ppm
BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_990_bridgeobj
BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM := $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_990_BRIDGEOAM_SCENE_CGRAM := $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPU := $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_990_BRIDGEOAM_SCENE_OAM := $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_990_BRIDGEOAM_SCENE_JSON := $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX).json
BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPM := $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX).ppm
BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX := $(OUT_DIR)/bank1_bootstrap_queue_994_bridgeobj
BANK1_QUEUE_994_BRIDGEOAM_SCENE_VRAM := $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX)_vram.bin
BANK1_QUEUE_994_BRIDGEOAM_SCENE_CGRAM := $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX)_cgram.bin
BANK1_QUEUE_994_BRIDGEOAM_SCENE_PPU := $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX)_ppu_state.json
BANK1_QUEUE_994_BRIDGEOAM_SCENE_OAM := $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX)_oam.bin
BANK1_QUEUE_994_BRIDGEOAM_SCENE_JSON := $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX).json
BANK1_QUEUE_994_BRIDGEOAM_SCENE_PPM := $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX).ppm
BANK1_VISIBLE_991_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_991
BANK1_VISIBLE_991_SCENE_VRAM := $(BANK1_VISIBLE_991_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_991_SCENE_CGRAM := $(BANK1_VISIBLE_991_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_991_SCENE_PPU := $(BANK1_VISIBLE_991_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_991_SCENE_OAM := $(BANK1_VISIBLE_991_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_991_SCENE_JSON := $(BANK1_VISIBLE_991_SCENE_PREFIX).json
BANK1_VISIBLE_991_SCENE_PPM := $(BANK1_VISIBLE_991_SCENE_PREFIX).ppm
BANK1_VISIBLE_992_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_992
BANK1_VISIBLE_992_SCENE_VRAM := $(BANK1_VISIBLE_992_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_992_SCENE_CGRAM := $(BANK1_VISIBLE_992_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_992_SCENE_PPU := $(BANK1_VISIBLE_992_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_992_SCENE_OAM := $(BANK1_VISIBLE_992_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_992_SCENE_JSON := $(BANK1_VISIBLE_992_SCENE_PREFIX).json
BANK1_VISIBLE_992_SCENE_PPM := $(BANK1_VISIBLE_992_SCENE_PREFIX).ppm
BANK1_VISIBLE_993_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_993
BANK1_VISIBLE_993_SCENE_VRAM := $(BANK1_VISIBLE_993_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_993_SCENE_CGRAM := $(BANK1_VISIBLE_993_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_993_SCENE_PPU := $(BANK1_VISIBLE_993_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_993_SCENE_OAM := $(BANK1_VISIBLE_993_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_993_SCENE_JSON := $(BANK1_VISIBLE_993_SCENE_PREFIX).json
BANK1_VISIBLE_993_SCENE_PPM := $(BANK1_VISIBLE_993_SCENE_PREFIX).ppm
BANK1_VISIBLE_994_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_994
BANK1_VISIBLE_994_SCENE_VRAM := $(BANK1_VISIBLE_994_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_994_SCENE_CGRAM := $(BANK1_VISIBLE_994_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_994_SCENE_PPU := $(BANK1_VISIBLE_994_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_994_SCENE_OAM := $(BANK1_VISIBLE_994_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_994_SCENE_JSON := $(BANK1_VISIBLE_994_SCENE_PREFIX).json
BANK1_VISIBLE_994_SCENE_PPM := $(BANK1_VISIBLE_994_SCENE_PREFIX).ppm
BANK1_VISIBLE_995_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_995
BANK1_VISIBLE_995_SCENE_VRAM := $(BANK1_VISIBLE_995_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_995_SCENE_CGRAM := $(BANK1_VISIBLE_995_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_995_SCENE_PPU := $(BANK1_VISIBLE_995_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_995_SCENE_OAM := $(BANK1_VISIBLE_995_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_995_SCENE_JSON := $(BANK1_VISIBLE_995_SCENE_PREFIX).json
BANK1_VISIBLE_995_SCENE_PPM := $(BANK1_VISIBLE_995_SCENE_PREFIX).ppm
BANK1_VISIBLE_996_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_996
BANK1_VISIBLE_996_SCENE_VRAM := $(BANK1_VISIBLE_996_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_996_SCENE_CGRAM := $(BANK1_VISIBLE_996_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_996_SCENE_PPU := $(BANK1_VISIBLE_996_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_996_SCENE_OAM := $(BANK1_VISIBLE_996_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_996_SCENE_JSON := $(BANK1_VISIBLE_996_SCENE_PREFIX).json
BANK1_VISIBLE_996_SCENE_PPM := $(BANK1_VISIBLE_996_SCENE_PREFIX).ppm
BANK1_VISIBLE_997_SCENE_PREFIX := $(OUT_DIR)/bank1_mode7_visible_997
BANK1_VISIBLE_997_SCENE_VRAM := $(BANK1_VISIBLE_997_SCENE_PREFIX)_vram.bin
BANK1_VISIBLE_997_SCENE_CGRAM := $(BANK1_VISIBLE_997_SCENE_PREFIX)_cgram.bin
BANK1_VISIBLE_997_SCENE_PPU := $(BANK1_VISIBLE_997_SCENE_PREFIX)_ppu_state.json
BANK1_VISIBLE_997_SCENE_OAM := $(BANK1_VISIBLE_997_SCENE_PREFIX)_oam.bin
BANK1_VISIBLE_997_SCENE_JSON := $(BANK1_VISIBLE_997_SCENE_PREFIX).json
BANK1_VISIBLE_997_SCENE_PPM := $(BANK1_VISIBLE_997_SCENE_PREFIX).ppm
MESEN_BOOT_FRAME := ../.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png
MESEN_FRAME ?= 300
MESEN_FRAME_DIR ?= $(OUT_DIR)/mesen_frame$(MESEN_FRAME)
MESEN_FRAME986_DIR := $(OUT_DIR)/mesen_frame986_assets_v2
MESEN_FRAME990_DIR := $(OUT_DIR)/mesen_frame990_assets_v2
MESEN_FRAME991_DIR := $(OUT_DIR)/mesen_frame991_assets_v1
MESEN_FRAME992_DIR := $(OUT_DIR)/mesen_frame992_assets_v1
MESEN_FRAME993_DIR := $(OUT_DIR)/mesen_frame993_assets_v1
MESEN_FRAME994_DIR := $(OUT_DIR)/mesen_frame994_assets_v1
MESEN_FRAME995_DIR := $(OUT_DIR)/mesen_frame995_assets_v1
MESEN_FRAME996_DIR := $(OUT_DIR)/mesen_frame996_assets_v1
MESEN_FRAME997_DIR := $(OUT_DIR)/mesen_frame997_assets_v1
MESEN_RANGE_998_1005_DIR := $(OUT_DIR)/mesen_range_998_1005_v1
MESEN_RANGE_998_1005_SEQUENCE := $(MESEN_RANGE_998_1005_DIR)/sequence.txt
MESEN_RANGE_998_1005_JSON := $(MESEN_RANGE_998_1005_DIR)/sequence.json
MESEN_RANGE_1006_1013_DIR := $(OUT_DIR)/mesen_range_1006_1013_v1
MESEN_RANGE_1006_1013_SEQUENCE := $(MESEN_RANGE_1006_1013_DIR)/sequence.txt
MESEN_RANGE_1006_1013_JSON := $(MESEN_RANGE_1006_1013_DIR)/sequence.json
MESEN_RANGE_1014_1021_DIR := $(OUT_DIR)/mesen_range_1014_1021_v1
MESEN_RANGE_1014_1021_SEQUENCE := $(MESEN_RANGE_1014_1021_DIR)/sequence.txt
MESEN_RANGE_1014_1021_JSON := $(MESEN_RANGE_1014_1021_DIR)/sequence.json
MESEN_RANGE_1022_1029_DIR := $(OUT_DIR)/mesen_range_1022_1029_v1
MESEN_RANGE_1022_1029_SEQUENCE := $(MESEN_RANGE_1022_1029_DIR)/sequence.txt
MESEN_RANGE_1022_1029_JSON := $(MESEN_RANGE_1022_1029_DIR)/sequence.json
MESEN_RANGE_1030_1037_DIR := $(OUT_DIR)/mesen_range_1030_1037_v1
MESEN_RANGE_1030_1037_SEQUENCE := $(MESEN_RANGE_1030_1037_DIR)/sequence.txt
MESEN_RANGE_1030_1037_JSON := $(MESEN_RANGE_1030_1037_DIR)/sequence.json
MESEN_RANGE_1038_1045_DIR := $(OUT_DIR)/mesen_range_1038_1045_v1
MESEN_RANGE_1038_1045_SEQUENCE := $(MESEN_RANGE_1038_1045_DIR)/sequence.txt
MESEN_RANGE_1038_1045_JSON := $(MESEN_RANGE_1038_1045_DIR)/sequence.json
MESEN_RANGE_1046_1053_DIR := $(OUT_DIR)/mesen_range_1046_1053_v1
MESEN_RANGE_1046_1053_SEQUENCE := $(MESEN_RANGE_1046_1053_DIR)/sequence.txt
MESEN_RANGE_1046_1053_JSON := $(MESEN_RANGE_1046_1053_DIR)/sequence.json
MESEN_RANGE_1054_1061_DIR := $(OUT_DIR)/mesen_range_1054_1061_v1
MESEN_RANGE_1054_1061_SEQUENCE := $(MESEN_RANGE_1054_1061_DIR)/sequence.txt
MESEN_RANGE_1054_1061_JSON := $(MESEN_RANGE_1054_1061_DIR)/sequence.json
MESEN_RANGE_1062_1069_DIR := $(OUT_DIR)/mesen_range_1062_1069_v1
MESEN_RANGE_1062_1069_SEQUENCE := $(MESEN_RANGE_1062_1069_DIR)/sequence.txt
MESEN_RANGE_1062_1069_JSON := $(MESEN_RANGE_1062_1069_DIR)/sequence.json
MESEN_RANGE_1070_1077_DIR := $(OUT_DIR)/mesen_range_1070_1077_v1
MESEN_RANGE_1070_1077_SEQUENCE := $(MESEN_RANGE_1070_1077_DIR)/sequence.txt
MESEN_RANGE_1070_1077_JSON := $(MESEN_RANGE_1070_1077_DIR)/sequence.json
MESEN_RANGE_1078_1085_DIR := $(OUT_DIR)/mesen_range_1078_1085_v1
MESEN_RANGE_1078_1085_SEQUENCE := $(MESEN_RANGE_1078_1085_DIR)/sequence.txt
MESEN_RANGE_1078_1085_JSON := $(MESEN_RANGE_1078_1085_DIR)/sequence.json
MESEN_RANGE_1086_1093_DIR := $(OUT_DIR)/mesen_range_1086_1093_v1
MESEN_RANGE_1086_1093_SEQUENCE := $(MESEN_RANGE_1086_1093_DIR)/sequence.txt
MESEN_RANGE_1086_1093_JSON := $(MESEN_RANGE_1086_1093_DIR)/sequence.json
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
INTRO_LOOP_HYBRID_BASE_SEQUENCE := $(OUT_DIR)/intro_loop_hybrid_ballistic_sequence.txt
INTRO_LOOP_HYBRID_BASE_JSON := $(OUT_DIR)/intro_loop_hybrid_ballistic_sequence.json
INTRO_LOOP_HYBRID_BRIDGE_SEQUENCE := $(OUT_DIR)/intro_loop_hybrid_bridge_sequence.txt
INTRO_LOOP_HYBRID_BRIDGE_JSON := $(OUT_DIR)/intro_loop_hybrid_bridge_sequence.json
INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_SEQUENCE := $(OUT_DIR)/intro_loop_hybrid_bridge_visible_sequence.txt
INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_JSON := $(OUT_DIR)/intro_loop_hybrid_bridge_visible_sequence.json
INTRO_NATIVE_978_DIR := $(OUT_DIR)/intro_native_978
INTRO_NATIVE_978_DERIVED_SEQUENCE := $(OUT_DIR)/intro_native_978_derived_sequence.txt
INTRO_NATIVE_978_DERIVED_JSON := $(OUT_DIR)/intro_native_978_derived_sequence.json
INTRO_NATIVE_978_BRIDGE_SEQUENCE := $(OUT_DIR)/intro_native_978_bridge_sequence.txt
INTRO_NATIVE_978_BRIDGE_JSON := $(OUT_DIR)/intro_native_978_bridge_sequence.json
INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE := $(OUT_DIR)/intro_native_978_bridge_visible_sequence.txt
INTRO_NATIVE_978_BRIDGE_VISIBLE_JSON := $(OUT_DIR)/intro_native_978_bridge_visible_sequence.json
INTRO_BOOTSTRAP_954_958_JSON := $(OUT_DIR)/intro_bootstrap_954_958_delta.json
INTRO_BOOTSTRAP_958_974_JSON := $(OUT_DIR)/intro_bootstrap_958_974_delta.json
INTRO_BOOTSTRAP_QUEUE_958_974_JSON := $(OUT_DIR)/intro_bootstrap_958_974_queue.json
INTRO_BOOTSTRAP_QUEUE_978_982_JSON := $(OUT_DIR)/intro_bootstrap_978_982_queue.json
INTRO_BOOTSTRAP_QUEUE_982_986_JSON := $(OUT_DIR)/intro_bootstrap_982_986_queue.json
INTRO_BOOTSTRAP_QUEUE_986_990_JSON := $(OUT_DIR)/intro_bootstrap_986_990_queue.json
INTRO_BOOTSTRAP_QUEUE_990_994_JSON := $(OUT_DIR)/intro_bootstrap_990_994_queue.json
MESEN_TIMEOUT_SECONDS ?= 75

.PHONY: all previews bank3-palettes boot-palettes boot-palettes-flat boot-screen-manifest boot-vram-preview boot-vram-overlay-preview boot-screen-preview boot-screen-overlay-preview bank6-preview bank7-scan bank7-headers bank7-42fb0 bank7-42fb0-preview bank7-26fb0 bank7-26fb0-preview bank7-chunk1-preview bank9-preview bank1-credits-scene-preview bank1-credits-scene-compare bank1-a35a-scene-preview bank1-a00c-scene-preview bank1-bootstrap-queue-978-preview bank1-bootstrap-queue-982-preview bank1-bootstrap-queue-986-preview bank1-bootstrap-queue-986-noobj-preview bank1-bootstrap-queue-986-bridgeoam-preview bank1-bootstrap-queue-990-bridgeoam-preview bank1-bootstrap-queue-994-bridgeoam-preview bank1-visible-mode7-window-preview intro-bootstrap-deltas intro-bootstrap-queue mesen-ppu-frame intro-loop-dump intro-loop-sequence ballistic-native-clip ballistic-rom-clip ballistic-callback-asset intro-loop-hybrid-sequence intro-loop-hybrid-bridge-sequence intro-loop-hybrid-bridge-visible-sequence intro-native-978 intro-native-978-derived intro-native-978-bridge intro-native-978-bridge-visible

all: previews

previews: bank3-palettes boot-palettes boot-palettes-flat boot-screen-manifest boot-vram-preview boot-screen-preview bank6-preview bank7-scan bank7-headers bank7-42fb0 bank7-42fb0-preview bank7-26fb0 bank7-26fb0-preview bank7-chunk1-preview bank9-preview bank1-credits-scene-preview bank1-a35a-scene-preview bank1-a00c-scene-preview

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

$(BANK1_A00C_SCENE_VRAM) $(BANK1_A00C_SCENE_CGRAM) $(BANK1_A00C_SCENE_PPU) $(BANK1_A00C_SCENE_JSON) $(BANK1_A00C_SCENE_PPM): build_bank1_l00a00c_scene.py $(ROM) $(OUT_DIR)/intro_loop_frame_00954_vram.bin $(OUT_DIR)/intro_loop_frame_00954_cgram.bin $(OUT_DIR)/intro_loop_frame_00974_ppu_state.json | $(OUT_DIR)
	$(PYTHON) build_bank1_l00a00c_scene.py $(ROM) $(BANK1_A00C_SCENE_PREFIX) \
		--seed-vram $(OUT_DIR)/intro_loop_frame_00954_vram.bin \
		--seed-cgram $(OUT_DIR)/intro_loop_frame_00954_cgram.bin \
		--ppu-state-template $(OUT_DIR)/intro_loop_frame_00974_ppu_state.json \
		--skip-palette

bank1-a00c-scene-preview: $(BANK1_A00C_SCENE_VRAM) $(BANK1_A00C_SCENE_CGRAM) $(BANK1_A00C_SCENE_PPU) $(BANK1_A00C_SCENE_JSON) $(BANK1_A00C_SCENE_PPM)

$(BANK1_QUEUE_978_SCENE_VRAM) $(BANK1_QUEUE_978_SCENE_CGRAM) $(BANK1_QUEUE_978_SCENE_PPU) $(BANK1_QUEUE_978_SCENE_OAM) $(BANK1_QUEUE_978_SCENE_JSON) $(BANK1_QUEUE_978_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_958_974_JSON) $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe_vram.bin $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/intro_loop_frame_00978_ppu_state.json $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe_wram.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_958_974_JSON) $(BANK1_QUEUE_978_SCENE_PREFIX) \
		--seed-vram $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe_vram.bin \
		--cgram $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/intro_loop_frame_00978_ppu_state.json \
		--wram $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe_wram.bin \
		--render-objects

bank1-bootstrap-queue-978-preview: $(BANK1_QUEUE_978_SCENE_VRAM) $(BANK1_QUEUE_978_SCENE_CGRAM) $(BANK1_QUEUE_978_SCENE_PPU) $(BANK1_QUEUE_978_SCENE_OAM) $(BANK1_QUEUE_978_SCENE_JSON) $(BANK1_QUEUE_978_SCENE_PPM)

$(BANK1_QUEUE_978_SCENE_SEQUENCE) $(BANK1_QUEUE_978_SCENE_SEQUENCE_JSON): $(BANK1_QUEUE_978_SCENE_VRAM) $(BANK1_QUEUE_978_SCENE_CGRAM) $(BANK1_QUEUE_978_SCENE_PPU) $(BANK1_QUEUE_978_SCENE_OAM) | $(OUT_DIR)
	printf '%s\n' '# type duration_frames path_a [path_b path_c path_d]' > $(BANK1_QUEUE_978_SCENE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_978_vram.bin bank1_bootstrap_queue_978_cgram.bin bank1_bootstrap_queue_978_ppu_state.json bank1_bootstrap_queue_978_oam.bin' >> $(BANK1_QUEUE_978_SCENE_SEQUENCE)
	$(PYTHON) -c 'import json, pathlib; pathlib.Path("$(BANK1_QUEUE_978_SCENE_SEQUENCE_JSON)").write_text(json.dumps({"manifest":"$(BANK1_QUEUE_978_SCENE_SEQUENCE)","entries":[{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_978_vram.bin","cgram":"bank1_bootstrap_queue_978_cgram.bin","ppu_state":"bank1_bootstrap_queue_978_ppu_state.json","oam":"bank1_bootstrap_queue_978_oam.bin"}],"total_duration_frames":4}, indent=2) + "\\n", encoding="utf-8")'

$(BANK1_QUEUE_982_SCENE_VRAM) $(BANK1_QUEUE_982_SCENE_CGRAM) $(BANK1_QUEUE_982_SCENE_PPU) $(BANK1_QUEUE_982_SCENE_OAM) $(BANK1_QUEUE_982_SCENE_JSON) $(BANK1_QUEUE_982_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_978_982_JSON) $(BANK1_QUEUE_978_SCENE_VRAM) $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_ppu_state.json $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_wram.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_978_982_JSON) $(BANK1_QUEUE_982_SCENE_PREFIX) \
		--seed-vram $(BANK1_QUEUE_978_SCENE_VRAM) \
		--cgram $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_ppu_state.json \
		--wram $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_wram.bin \
		--render-objects

bank1-bootstrap-queue-982-preview: $(BANK1_QUEUE_982_SCENE_VRAM) $(BANK1_QUEUE_982_SCENE_CGRAM) $(BANK1_QUEUE_982_SCENE_PPU) $(BANK1_QUEUE_982_SCENE_OAM) $(BANK1_QUEUE_982_SCENE_JSON) $(BANK1_QUEUE_982_SCENE_PPM)

$(BANK1_QUEUE_982_SCENE_SEQUENCE) $(BANK1_QUEUE_982_SCENE_SEQUENCE_JSON): $(BANK1_QUEUE_982_SCENE_VRAM) $(BANK1_QUEUE_982_SCENE_CGRAM) $(BANK1_QUEUE_982_SCENE_PPU) $(BANK1_QUEUE_982_SCENE_OAM) | $(OUT_DIR)
	printf '%s\n' '# type duration_frames path_a [path_b path_c path_d]' > $(BANK1_QUEUE_982_SCENE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_982_vram.bin bank1_bootstrap_queue_982_cgram.bin bank1_bootstrap_queue_982_ppu_state.json bank1_bootstrap_queue_982_oam.bin' >> $(BANK1_QUEUE_982_SCENE_SEQUENCE)
	$(PYTHON) -c 'import json, pathlib; pathlib.Path("$(BANK1_QUEUE_982_SCENE_SEQUENCE_JSON)").write_text(json.dumps({"manifest":"$(BANK1_QUEUE_982_SCENE_SEQUENCE)","entries":[{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_982_vram.bin","cgram":"bank1_bootstrap_queue_982_cgram.bin","ppu_state":"bank1_bootstrap_queue_982_ppu_state.json","oam":"bank1_bootstrap_queue_982_oam.bin"}],"total_duration_frames":4}, indent=2) + "\\n", encoding="utf-8")'

$(BANK1_QUEUE_986_SCENE_VRAM) $(BANK1_QUEUE_986_SCENE_CGRAM) $(BANK1_QUEUE_986_SCENE_PPU) $(BANK1_QUEUE_986_SCENE_OAM) $(BANK1_QUEUE_986_SCENE_JSON) $(BANK1_QUEUE_986_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(BANK1_QUEUE_982_SCENE_VRAM) $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_ppu_state.json $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(BANK1_QUEUE_986_SCENE_PREFIX) \
		--seed-vram $(BANK1_QUEUE_982_SCENE_VRAM) \
		--cgram $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_ppu_state.json \
		--wram $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin \
		--render-objects

bank1-bootstrap-queue-986-preview: $(BANK1_QUEUE_986_SCENE_VRAM) $(BANK1_QUEUE_986_SCENE_CGRAM) $(BANK1_QUEUE_986_SCENE_PPU) $(BANK1_QUEUE_986_SCENE_OAM) $(BANK1_QUEUE_986_SCENE_JSON) $(BANK1_QUEUE_986_SCENE_PPM)

$(BANK1_QUEUE_986_NOOBJ_SCENE_VRAM) $(BANK1_QUEUE_986_NOOBJ_SCENE_CGRAM) $(BANK1_QUEUE_986_NOOBJ_SCENE_PPU) $(BANK1_QUEUE_986_NOOBJ_SCENE_OAM) $(BANK1_QUEUE_986_NOOBJ_SCENE_JSON) $(BANK1_QUEUE_986_NOOBJ_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(BANK1_QUEUE_982_SCENE_VRAM) $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_ppu_state.json $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(BANK1_QUEUE_986_NOOBJ_SCENE_PREFIX) \
		--seed-vram $(BANK1_QUEUE_982_SCENE_VRAM) \
		--cgram $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_ppu_state.json \
		--wram $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin

bank1-bootstrap-queue-986-noobj-preview: $(BANK1_QUEUE_986_NOOBJ_SCENE_VRAM) $(BANK1_QUEUE_986_NOOBJ_SCENE_CGRAM) $(BANK1_QUEUE_986_NOOBJ_SCENE_PPU) $(BANK1_QUEUE_986_NOOBJ_SCENE_OAM) $(BANK1_QUEUE_986_NOOBJ_SCENE_JSON) $(BANK1_QUEUE_986_NOOBJ_SCENE_PPM)

$(BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_JSON) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(BANK1_QUEUE_982_SCENE_VRAM) $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_ppu_state.json $(OUT_DIR)/mesen_frame986_assets_v2/oam.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PREFIX) \
		--seed-vram $(BANK1_QUEUE_982_SCENE_VRAM) \
		--cgram $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_ppu_state.json \
		--oam-override $(OUT_DIR)/mesen_frame986_assets_v2/oam.bin \
		--render-objects

bank1-bootstrap-queue-986-bridgeoam-preview: $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_JSON) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPM)

$(BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_JSON) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_986_990_JSON) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM) $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_ppu_state.json $(MESEN_FRAME990_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_986_990_JSON) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PREFIX) \
		--seed-vram $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM) \
		--cgram $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_ppu_state.json \
		--oam-override $(MESEN_FRAME990_DIR)/oam.bin \
		--render-objects

bank1-bootstrap-queue-990-bridgeoam-preview: $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_JSON) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPM)

$(BANK1_QUEUE_994_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_JSON) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PPM): build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_990_994_JSON) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM) $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe_cgram.bin $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe_ppu_state.json $(MESEN_FRAME994_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_bootstrap_queue_scene.py $(ROM) $(INTRO_BOOTSTRAP_QUEUE_990_994_JSON) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PREFIX) \
		--seed-vram $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM) \
		--cgram $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe_cgram.bin \
		--ppu-state $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe_ppu_state.json \
		--oam-override $(MESEN_FRAME994_DIR)/oam.bin \
		--render-objects

bank1-bootstrap-queue-994-bridgeoam-preview: $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_JSON) $(BANK1_QUEUE_994_BRIDGEOAM_SCENE_PPM)

$(BANK1_VISIBLE_991_SCENE_VRAM) $(BANK1_VISIBLE_991_SCENE_CGRAM) $(BANK1_VISIBLE_991_SCENE_PPU) $(BANK1_VISIBLE_991_SCENE_OAM) $(BANK1_VISIBLE_991_SCENE_JSON) $(BANK1_VISIBLE_991_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME991_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_991_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME991_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME991_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME991_DIR)/oam.bin \
		--patch 0x4920:0x1AAA10:0x100 \
		--patch 0x49A0:0x1AACA0:0x100 \
		--render-objects

$(BANK1_VISIBLE_992_SCENE_VRAM) $(BANK1_VISIBLE_992_SCENE_CGRAM) $(BANK1_VISIBLE_992_SCENE_PPU) $(BANK1_VISIBLE_992_SCENE_OAM) $(BANK1_VISIBLE_992_SCENE_JSON) $(BANK1_VISIBLE_992_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME992_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_992_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME992_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME992_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME992_DIR)/oam.bin \
		--patch 0x4920:0x1AAB58:0x100 \
		--patch 0x49A0:0x1AACA0:0x100 \
		--render-objects

$(BANK1_VISIBLE_993_SCENE_VRAM) $(BANK1_VISIBLE_993_SCENE_CGRAM) $(BANK1_VISIBLE_993_SCENE_PPU) $(BANK1_VISIBLE_993_SCENE_OAM) $(BANK1_VISIBLE_993_SCENE_JSON) $(BANK1_VISIBLE_993_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME993_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_993_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME993_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME993_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME993_DIR)/oam.bin \
		--patch 0x4920:0x1AAB58:0x100 \
		--patch 0x49A0:0x1AAA10:0x100 \
		--render-objects

$(BANK1_VISIBLE_994_SCENE_VRAM) $(BANK1_VISIBLE_994_SCENE_CGRAM) $(BANK1_VISIBLE_994_SCENE_PPU) $(BANK1_VISIBLE_994_SCENE_OAM) $(BANK1_VISIBLE_994_SCENE_JSON) $(BANK1_VISIBLE_994_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME994_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_994_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME994_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME994_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME994_DIR)/oam.bin \
		--patch 0x4920:0x1AACA0:0x100 \
		--patch 0x49A0:0x1AAA10:0x100 \
		--render-objects

$(BANK1_VISIBLE_995_SCENE_VRAM) $(BANK1_VISIBLE_995_SCENE_CGRAM) $(BANK1_VISIBLE_995_SCENE_PPU) $(BANK1_VISIBLE_995_SCENE_OAM) $(BANK1_VISIBLE_995_SCENE_JSON) $(BANK1_VISIBLE_995_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME995_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_995_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME995_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME995_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME995_DIR)/oam.bin \
		--patch 0x4920:0x1AACA0:0x100 \
		--patch 0x49A0:0x1AAB58:0x100 \
		--render-objects

$(BANK1_VISIBLE_996_SCENE_VRAM) $(BANK1_VISIBLE_996_SCENE_CGRAM) $(BANK1_VISIBLE_996_SCENE_PPU) $(BANK1_VISIBLE_996_SCENE_OAM) $(BANK1_VISIBLE_996_SCENE_JSON) $(BANK1_VISIBLE_996_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME996_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_996_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME996_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME996_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME996_DIR)/oam.bin \
		--patch 0x4920:0x1AAA10:0x100 \
		--patch 0x49A0:0x1AAB58:0x100 \
		--render-objects

$(BANK1_VISIBLE_997_SCENE_VRAM) $(BANK1_VISIBLE_997_SCENE_CGRAM) $(BANK1_VISIBLE_997_SCENE_PPU) $(BANK1_VISIBLE_997_SCENE_OAM) $(BANK1_VISIBLE_997_SCENE_JSON) $(BANK1_VISIBLE_997_SCENE_PPM): build_mode7_source_scene.py $(ROM) $(MESEN_FRAME990_DIR)/oam.bin $(MESEN_FRAME997_DIR)/oam.bin | $(OUT_DIR)
	$(PYTHON) build_mode7_source_scene.py $(ROM) $(BANK1_VISIBLE_997_SCENE_PREFIX) \
		--seed-vram $(MESEN_FRAME990_DIR)/vram.bin \
		--cgram $(MESEN_FRAME997_DIR)/cgram.bin \
		--ppu-state $(MESEN_FRAME997_DIR)/ppu_state.json \
		--oam $(MESEN_FRAME997_DIR)/oam.bin \
		--patch 0x4920:0x1AAA10:0x100 \
		--patch 0x49A0:0x1AACA0:0x100 \
		--render-objects

bank1-visible-mode7-window-preview: $(BANK1_VISIBLE_991_SCENE_VRAM) $(BANK1_VISIBLE_991_SCENE_CGRAM) $(BANK1_VISIBLE_991_SCENE_PPU) $(BANK1_VISIBLE_991_SCENE_OAM) $(BANK1_VISIBLE_991_SCENE_JSON) $(BANK1_VISIBLE_991_SCENE_PPM) $(BANK1_VISIBLE_992_SCENE_VRAM) $(BANK1_VISIBLE_992_SCENE_CGRAM) $(BANK1_VISIBLE_992_SCENE_PPU) $(BANK1_VISIBLE_992_SCENE_OAM) $(BANK1_VISIBLE_992_SCENE_JSON) $(BANK1_VISIBLE_992_SCENE_PPM) $(BANK1_VISIBLE_993_SCENE_VRAM) $(BANK1_VISIBLE_993_SCENE_CGRAM) $(BANK1_VISIBLE_993_SCENE_PPU) $(BANK1_VISIBLE_993_SCENE_OAM) $(BANK1_VISIBLE_993_SCENE_JSON) $(BANK1_VISIBLE_993_SCENE_PPM) $(BANK1_VISIBLE_994_SCENE_VRAM) $(BANK1_VISIBLE_994_SCENE_CGRAM) $(BANK1_VISIBLE_994_SCENE_PPU) $(BANK1_VISIBLE_994_SCENE_OAM) $(BANK1_VISIBLE_994_SCENE_JSON) $(BANK1_VISIBLE_994_SCENE_PPM) $(BANK1_VISIBLE_995_SCENE_VRAM) $(BANK1_VISIBLE_995_SCENE_CGRAM) $(BANK1_VISIBLE_995_SCENE_PPU) $(BANK1_VISIBLE_995_SCENE_OAM) $(BANK1_VISIBLE_995_SCENE_JSON) $(BANK1_VISIBLE_995_SCENE_PPM) $(BANK1_VISIBLE_996_SCENE_VRAM) $(BANK1_VISIBLE_996_SCENE_CGRAM) $(BANK1_VISIBLE_996_SCENE_PPU) $(BANK1_VISIBLE_996_SCENE_OAM) $(BANK1_VISIBLE_996_SCENE_JSON) $(BANK1_VISIBLE_996_SCENE_PPM) $(BANK1_VISIBLE_997_SCENE_VRAM) $(BANK1_VISIBLE_997_SCENE_CGRAM) $(BANK1_VISIBLE_997_SCENE_PPU) $(BANK1_VISIBLE_997_SCENE_OAM) $(BANK1_VISIBLE_997_SCENE_JSON) $(BANK1_VISIBLE_997_SCENE_PPM)

$(INTRO_BOOTSTRAP_954_958_JSON): analyze_frame_delta.py $(OUT_DIR)/intro_loop_frame_00954_vram.bin $(OUT_DIR)/intro_loop_frame_00958_vram.bin $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_frame_delta.py $(OUT_DIR)/intro_loop_frame_00954 $(OUT_DIR)/intro_loop_frame_00958 $(INTRO_BOOTSTRAP_954_958_JSON) \
		--probe-json-b $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe.json

$(INTRO_BOOTSTRAP_958_974_JSON): analyze_frame_delta.py $(OUT_DIR)/intro_loop_frame_00958_vram.bin $(OUT_DIR)/intro_loop_frame_00974_vram.bin $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe.json $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_frame_delta.py $(OUT_DIR)/intro_loop_frame_00958 $(OUT_DIR)/intro_loop_frame_00974 $(INTRO_BOOTSTRAP_958_974_JSON) \
		--probe-json-a $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe.json \
		--probe-json-b $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe.json

intro-bootstrap-deltas: $(INTRO_BOOTSTRAP_954_958_JSON) $(INTRO_BOOTSTRAP_958_974_JSON)

$(INTRO_BOOTSTRAP_QUEUE_958_974_JSON): analyze_bootstrap_queue.py $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe.json $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_bootstrap_queue.py \
		$(OUT_DIR)/bootprobe_958_detail/td2_boot_probe_wram.bin \
		$(OUT_DIR)/bootprobe_974_detail/td2_boot_probe_wram.bin \
		--probe-json-a $(OUT_DIR)/bootprobe_958_detail/td2_boot_probe.json \
		--probe-json-b $(OUT_DIR)/bootprobe_974_detail/td2_boot_probe.json \
		$(INTRO_BOOTSTRAP_QUEUE_958_974_JSON)

$(INTRO_BOOTSTRAP_QUEUE_978_982_JSON): analyze_bootstrap_queue.py $(OUT_DIR)/bootprobe_978_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_978_detail/td2_boot_probe.json $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_bootstrap_queue.py \
		$(OUT_DIR)/bootprobe_978_detail/td2_boot_probe_wram.bin \
		$(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_wram.bin \
		--probe-json-a $(OUT_DIR)/bootprobe_978_detail/td2_boot_probe.json \
		--probe-json-b $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe.json \
		$(INTRO_BOOTSTRAP_QUEUE_978_982_JSON)

$(INTRO_BOOTSTRAP_QUEUE_982_986_JSON): analyze_bootstrap_queue.py $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe.json $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_bootstrap_queue.py \
		$(OUT_DIR)/bootprobe_982_detail/td2_boot_probe_wram.bin \
		$(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin \
		--probe-json-a $(OUT_DIR)/bootprobe_982_detail/td2_boot_probe.json \
		--probe-json-b $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe.json \
		$(INTRO_BOOTSTRAP_QUEUE_982_986_JSON)

$(INTRO_BOOTSTRAP_QUEUE_986_990_JSON): analyze_bootstrap_queue.py $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe.json $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_bootstrap_queue.py \
		$(OUT_DIR)/bootprobe_986_detail/td2_boot_probe_wram.bin \
		$(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_wram.bin \
		--probe-json-a $(OUT_DIR)/bootprobe_986_detail/td2_boot_probe.json \
		--probe-json-b $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe.json \
		$(INTRO_BOOTSTRAP_QUEUE_986_990_JSON)

$(INTRO_BOOTSTRAP_QUEUE_990_994_JSON): analyze_bootstrap_queue.py $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe_wram.bin $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe.json $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe.json | $(OUT_DIR)
	$(PYTHON) analyze_bootstrap_queue.py \
		$(OUT_DIR)/bootprobe_990_detail/td2_boot_probe_wram.bin \
		$(OUT_DIR)/bootprobe_994_detail/td2_boot_probe_wram.bin \
		--probe-json-a $(OUT_DIR)/bootprobe_990_detail/td2_boot_probe.json \
		--probe-json-b $(OUT_DIR)/bootprobe_994_detail/td2_boot_probe.json \
		$(INTRO_BOOTSTRAP_QUEUE_990_994_JSON)

intro-bootstrap-queue: $(INTRO_BOOTSTRAP_QUEUE_958_974_JSON) $(INTRO_BOOTSTRAP_QUEUE_978_982_JSON) $(INTRO_BOOTSTRAP_QUEUE_982_986_JSON) $(INTRO_BOOTSTRAP_QUEUE_986_990_JSON) $(INTRO_BOOTSTRAP_QUEUE_990_994_JSON)

mesen-ppu-frame: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame $(MESEN_FRAME) --out-dir $(MESEN_FRAME_DIR)

$(MESEN_FRAME986_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 986 --out-dir $(MESEN_FRAME986_DIR)

$(MESEN_FRAME990_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 990 --out-dir $(MESEN_FRAME990_DIR)

$(MESEN_FRAME991_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 991 --out-dir $(MESEN_FRAME991_DIR)

$(MESEN_FRAME992_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 992 --out-dir $(MESEN_FRAME992_DIR)

$(MESEN_FRAME993_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 993 --out-dir $(MESEN_FRAME993_DIR)

$(MESEN_FRAME994_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 994 --out-dir $(MESEN_FRAME994_DIR)

$(MESEN_FRAME995_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 995 --out-dir $(MESEN_FRAME995_DIR)

$(MESEN_FRAME996_DIR)/oam.bin: | $(OUT_DIR)
	./run_mesen_ppu_extract.sh --rom $(ROM) --frame 996 --out-dir $(MESEN_FRAME996_DIR)

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

$(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_LOOP_HYBRID_BASE_JSON): splice_sequence_manifest.py $(INTRO_LOOP_SEQUENCE_JSON) $(BALLISTIC_CALLBACK_ASSET) | $(OUT_DIR)
	$(PYTHON) splice_sequence_manifest.py $(INTRO_LOOP_SEQUENCE_JSON) $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) \
		--replace-start-frame 654 \
		--replace-end-frame-exclusive 958 \
		--replacement-type ballistic_a39c \
		--replacement-path $(BALLISTIC_CALLBACK_ASSET) \
		--replacement-duration 304 \
		--json-out $(INTRO_LOOP_HYBRID_BASE_JSON)

$(INTRO_NATIVE_978_DIR)/sequence.txt $(INTRO_NATIVE_978_DIR)/sequence.json: extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 978 --end-frame 982 --step 4 --out-dir $(INTRO_NATIVE_978_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_998_1005_SEQUENCE) $(MESEN_RANGE_998_1005_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 998 --end-frame 1005 --step 1 --out-dir $(MESEN_RANGE_998_1005_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1006_1013_SEQUENCE) $(MESEN_RANGE_1006_1013_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1006 --end-frame 1013 --step 1 --out-dir $(MESEN_RANGE_1006_1013_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1014_1021_SEQUENCE) $(MESEN_RANGE_1014_1021_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1014 --end-frame 1021 --step 1 --out-dir $(MESEN_RANGE_1014_1021_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1022_1029_SEQUENCE) $(MESEN_RANGE_1022_1029_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1022 --end-frame 1029 --step 1 --out-dir $(MESEN_RANGE_1022_1029_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1030_1037_SEQUENCE) $(MESEN_RANGE_1030_1037_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1030 --end-frame 1037 --step 1 --out-dir $(MESEN_RANGE_1030_1037_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1038_1045_SEQUENCE) $(MESEN_RANGE_1038_1045_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1038 --end-frame 1045 --step 1 --out-dir $(MESEN_RANGE_1038_1045_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1046_1053_SEQUENCE) $(MESEN_RANGE_1046_1053_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1046 --end-frame 1053 --step 1 --out-dir $(MESEN_RANGE_1046_1053_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1054_1061_SEQUENCE) $(MESEN_RANGE_1054_1061_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1054 --end-frame 1061 --step 1 --out-dir $(MESEN_RANGE_1054_1061_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1062_1069_SEQUENCE) $(MESEN_RANGE_1062_1069_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1062 --end-frame 1069 --step 1 --out-dir $(MESEN_RANGE_1062_1069_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1070_1077_SEQUENCE) $(MESEN_RANGE_1070_1077_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1070 --end-frame 1077 --step 1 --out-dir $(MESEN_RANGE_1070_1077_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1078_1085_SEQUENCE) $(MESEN_RANGE_1078_1085_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1078 --end-frame 1085 --step 1 --out-dir $(MESEN_RANGE_1078_1085_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(MESEN_RANGE_1086_1093_SEQUENCE) $(MESEN_RANGE_1086_1093_JSON): extract_mesen_scene_range.py | $(OUT_DIR)
	$(PYTHON) extract_mesen_scene_range.py --rom $(ROM) --start-frame 1086 --end-frame 1093 --step 1 --out-dir $(MESEN_RANGE_1086_1093_DIR) --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release

$(INTRO_NATIVE_978_DERIVED_SEQUENCE) $(INTRO_NATIVE_978_DERIVED_JSON): $(BANK1_QUEUE_978_SCENE_SEQUENCE) $(BANK1_QUEUE_982_SCENE_SEQUENCE) | $(OUT_DIR)
	printf '%s\n' '# type duration_frames path_a [path_b path_c path_d]' > $(INTRO_NATIVE_978_DERIVED_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_978_vram.bin bank1_bootstrap_queue_978_cgram.bin bank1_bootstrap_queue_978_ppu_state.json bank1_bootstrap_queue_978_oam.bin' >> $(INTRO_NATIVE_978_DERIVED_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_982_vram.bin bank1_bootstrap_queue_982_cgram.bin bank1_bootstrap_queue_982_ppu_state.json bank1_bootstrap_queue_982_oam.bin' >> $(INTRO_NATIVE_978_DERIVED_SEQUENCE)
	$(PYTHON) -c 'import json, pathlib; pathlib.Path("$(INTRO_NATIVE_978_DERIVED_JSON)").write_text(json.dumps({"manifest":"$(INTRO_NATIVE_978_DERIVED_SEQUENCE)","entries":[{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_978_vram.bin","cgram":"bank1_bootstrap_queue_978_cgram.bin","ppu_state":"bank1_bootstrap_queue_978_ppu_state.json","oam":"bank1_bootstrap_queue_978_oam.bin"},{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_982_vram.bin","cgram":"bank1_bootstrap_queue_982_cgram.bin","ppu_state":"bank1_bootstrap_queue_982_ppu_state.json","oam":"bank1_bootstrap_queue_982_oam.bin"}],"total_duration_frames":8}, indent=2) + "\\n", encoding="utf-8")'

$(INTRO_NATIVE_978_BRIDGE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_JSON): $(BANK1_QUEUE_978_SCENE_SEQUENCE) $(BANK1_QUEUE_982_SCENE_SEQUENCE) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_OAM) | $(OUT_DIR)
	printf '%s\n' '# type duration_frames path_a [path_b path_c path_d]' > $(INTRO_NATIVE_978_BRIDGE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_978_vram.bin bank1_bootstrap_queue_978_cgram.bin bank1_bootstrap_queue_978_ppu_state.json bank1_bootstrap_queue_978_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_982_vram.bin bank1_bootstrap_queue_982_cgram.bin bank1_bootstrap_queue_982_ppu_state.json bank1_bootstrap_queue_982_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_986_bridgeoverride_vram.bin bank1_bootstrap_queue_986_bridgeoverride_cgram.bin bank1_bootstrap_queue_986_bridgeoverride_ppu_state.json bank1_bootstrap_queue_986_bridgeoverride_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_990_bridgeobj_vram.bin bank1_bootstrap_queue_990_bridgeobj_cgram.bin bank1_bootstrap_queue_990_bridgeobj_ppu_state.json bank1_bootstrap_queue_990_bridgeobj_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_SEQUENCE)
	$(PYTHON) -c 'import json, pathlib; pathlib.Path("$(INTRO_NATIVE_978_BRIDGE_JSON)").write_text(json.dumps({"manifest":"$(INTRO_NATIVE_978_BRIDGE_SEQUENCE)","entries":[{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_978_vram.bin","cgram":"bank1_bootstrap_queue_978_cgram.bin","ppu_state":"bank1_bootstrap_queue_978_ppu_state.json","oam":"bank1_bootstrap_queue_978_oam.bin"},{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_982_vram.bin","cgram":"bank1_bootstrap_queue_982_cgram.bin","ppu_state":"bank1_bootstrap_queue_982_ppu_state.json","oam":"bank1_bootstrap_queue_982_oam.bin"},{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_986_bridgeoverride_vram.bin","cgram":"bank1_bootstrap_queue_986_bridgeoverride_cgram.bin","ppu_state":"bank1_bootstrap_queue_986_bridgeoverride_ppu_state.json","oam":"bank1_bootstrap_queue_986_bridgeoverride_oam.bin"},{"type":"snes_bg","duration_frames":4,"vram":"bank1_bootstrap_queue_990_bridgeobj_vram.bin","cgram":"bank1_bootstrap_queue_990_bridgeobj_cgram.bin","ppu_state":"bank1_bootstrap_queue_990_bridgeobj_ppu_state.json","oam":"bank1_bootstrap_queue_990_bridgeobj_oam.bin"}],"total_duration_frames":16}, indent=2) + "\\n", encoding="utf-8")'

$(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_VISIBLE_JSON): runtime_manifest_to_json.py $(BANK1_QUEUE_978_SCENE_SEQUENCE) $(BANK1_QUEUE_982_SCENE_SEQUENCE) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_986_BRIDGEOAM_SCENE_OAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_VRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_CGRAM) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_PPU) $(BANK1_QUEUE_990_BRIDGEOAM_SCENE_OAM) $(BANK1_VISIBLE_991_SCENE_VRAM) $(BANK1_VISIBLE_991_SCENE_CGRAM) $(BANK1_VISIBLE_991_SCENE_PPU) $(BANK1_VISIBLE_991_SCENE_OAM) $(BANK1_VISIBLE_992_SCENE_VRAM) $(BANK1_VISIBLE_992_SCENE_CGRAM) $(BANK1_VISIBLE_992_SCENE_PPU) $(BANK1_VISIBLE_992_SCENE_OAM) $(BANK1_VISIBLE_993_SCENE_VRAM) $(BANK1_VISIBLE_993_SCENE_CGRAM) $(BANK1_VISIBLE_993_SCENE_PPU) $(BANK1_VISIBLE_993_SCENE_OAM) $(BANK1_VISIBLE_994_SCENE_VRAM) $(BANK1_VISIBLE_994_SCENE_CGRAM) $(BANK1_VISIBLE_994_SCENE_PPU) $(BANK1_VISIBLE_994_SCENE_OAM) $(BANK1_VISIBLE_995_SCENE_VRAM) $(BANK1_VISIBLE_995_SCENE_CGRAM) $(BANK1_VISIBLE_995_SCENE_PPU) $(BANK1_VISIBLE_995_SCENE_OAM) $(BANK1_VISIBLE_996_SCENE_VRAM) $(BANK1_VISIBLE_996_SCENE_CGRAM) $(BANK1_VISIBLE_996_SCENE_PPU) $(BANK1_VISIBLE_996_SCENE_OAM) $(BANK1_VISIBLE_997_SCENE_VRAM) $(BANK1_VISIBLE_997_SCENE_CGRAM) $(BANK1_VISIBLE_997_SCENE_PPU) $(BANK1_VISIBLE_997_SCENE_OAM) $(MESEN_RANGE_998_1005_SEQUENCE) $(MESEN_RANGE_998_1005_JSON) $(MESEN_RANGE_1006_1013_SEQUENCE) $(MESEN_RANGE_1006_1013_JSON) $(MESEN_RANGE_1014_1021_SEQUENCE) $(MESEN_RANGE_1014_1021_JSON) $(MESEN_RANGE_1022_1029_SEQUENCE) $(MESEN_RANGE_1022_1029_JSON) $(MESEN_RANGE_1030_1037_SEQUENCE) $(MESEN_RANGE_1030_1037_JSON) $(MESEN_RANGE_1038_1045_SEQUENCE) $(MESEN_RANGE_1038_1045_JSON) $(MESEN_RANGE_1046_1053_SEQUENCE) $(MESEN_RANGE_1046_1053_JSON) $(MESEN_RANGE_1054_1061_SEQUENCE) $(MESEN_RANGE_1054_1061_JSON) $(MESEN_RANGE_1062_1069_SEQUENCE) $(MESEN_RANGE_1062_1069_JSON) $(MESEN_RANGE_1070_1077_SEQUENCE) $(MESEN_RANGE_1070_1077_JSON) $(MESEN_RANGE_1078_1085_SEQUENCE) $(MESEN_RANGE_1078_1085_JSON) $(MESEN_RANGE_1086_1093_SEQUENCE) $(MESEN_RANGE_1086_1093_JSON) | $(OUT_DIR)
	printf '%s\n' '# type duration_frames path_a [path_b path_c path_d]' > $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_978_vram.bin bank1_bootstrap_queue_978_cgram.bin bank1_bootstrap_queue_978_ppu_state.json bank1_bootstrap_queue_978_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_982_vram.bin bank1_bootstrap_queue_982_cgram.bin bank1_bootstrap_queue_982_ppu_state.json bank1_bootstrap_queue_982_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 4 bank1_bootstrap_queue_986_bridgeoverride_vram.bin bank1_bootstrap_queue_986_bridgeoverride_cgram.bin bank1_bootstrap_queue_986_bridgeoverride_ppu_state.json bank1_bootstrap_queue_986_bridgeoverride_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_bootstrap_queue_990_bridgeobj_vram.bin bank1_bootstrap_queue_990_bridgeobj_cgram.bin bank1_bootstrap_queue_990_bridgeobj_ppu_state.json bank1_bootstrap_queue_990_bridgeobj_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_991_vram.bin bank1_mode7_visible_991_cgram.bin bank1_mode7_visible_991_ppu_state.json bank1_mode7_visible_991_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_992_vram.bin bank1_mode7_visible_992_cgram.bin bank1_mode7_visible_992_ppu_state.json bank1_mode7_visible_992_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_993_vram.bin bank1_mode7_visible_993_cgram.bin bank1_mode7_visible_993_ppu_state.json bank1_mode7_visible_993_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_994_vram.bin bank1_mode7_visible_994_cgram.bin bank1_mode7_visible_994_ppu_state.json bank1_mode7_visible_994_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_995_vram.bin bank1_mode7_visible_995_cgram.bin bank1_mode7_visible_995_ppu_state.json bank1_mode7_visible_995_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_996_vram.bin bank1_mode7_visible_996_cgram.bin bank1_mode7_visible_996_ppu_state.json bank1_mode7_visible_996_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 bank1_mode7_visible_997_vram.bin bank1_mode7_visible_997_cgram.bin bank1_mode7_visible_997_ppu_state.json bank1_mode7_visible_997_oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_00998/vram.bin mesen_range_998_1005_v1/frame_00998/cgram.bin mesen_range_998_1005_v1/frame_00998/ppu_state.json mesen_range_998_1005_v1/frame_00998/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_00999/vram.bin mesen_range_998_1005_v1/frame_00999/cgram.bin mesen_range_998_1005_v1/frame_00999/ppu_state.json mesen_range_998_1005_v1/frame_00999/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_01000/vram.bin mesen_range_998_1005_v1/frame_01000/cgram.bin mesen_range_998_1005_v1/frame_01000/ppu_state.json mesen_range_998_1005_v1/frame_01000/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_01001/vram.bin mesen_range_998_1005_v1/frame_01001/cgram.bin mesen_range_998_1005_v1/frame_01001/ppu_state.json mesen_range_998_1005_v1/frame_01001/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_01002/vram.bin mesen_range_998_1005_v1/frame_01002/cgram.bin mesen_range_998_1005_v1/frame_01002/ppu_state.json mesen_range_998_1005_v1/frame_01002/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_01003/vram.bin mesen_range_998_1005_v1/frame_01003/cgram.bin mesen_range_998_1005_v1/frame_01003/ppu_state.json mesen_range_998_1005_v1/frame_01003/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_01004/vram.bin mesen_range_998_1005_v1/frame_01004/cgram.bin mesen_range_998_1005_v1/frame_01004/ppu_state.json mesen_range_998_1005_v1/frame_01004/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_998_1005_v1/frame_01005/vram.bin mesen_range_998_1005_v1/frame_01005/cgram.bin mesen_range_998_1005_v1/frame_01005/ppu_state.json mesen_range_998_1005_v1/frame_01005/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01006/vram.bin mesen_range_1006_1013_v1/frame_01006/cgram.bin mesen_range_1006_1013_v1/frame_01006/ppu_state.json mesen_range_1006_1013_v1/frame_01006/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01007/vram.bin mesen_range_1006_1013_v1/frame_01007/cgram.bin mesen_range_1006_1013_v1/frame_01007/ppu_state.json mesen_range_1006_1013_v1/frame_01007/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01008/vram.bin mesen_range_1006_1013_v1/frame_01008/cgram.bin mesen_range_1006_1013_v1/frame_01008/ppu_state.json mesen_range_1006_1013_v1/frame_01008/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01009/vram.bin mesen_range_1006_1013_v1/frame_01009/cgram.bin mesen_range_1006_1013_v1/frame_01009/ppu_state.json mesen_range_1006_1013_v1/frame_01009/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01010/vram.bin mesen_range_1006_1013_v1/frame_01010/cgram.bin mesen_range_1006_1013_v1/frame_01010/ppu_state.json mesen_range_1006_1013_v1/frame_01010/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01011/vram.bin mesen_range_1006_1013_v1/frame_01011/cgram.bin mesen_range_1006_1013_v1/frame_01011/ppu_state.json mesen_range_1006_1013_v1/frame_01011/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01012/vram.bin mesen_range_1006_1013_v1/frame_01012/cgram.bin mesen_range_1006_1013_v1/frame_01012/ppu_state.json mesen_range_1006_1013_v1/frame_01012/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1006_1013_v1/frame_01013/vram.bin mesen_range_1006_1013_v1/frame_01013/cgram.bin mesen_range_1006_1013_v1/frame_01013/ppu_state.json mesen_range_1006_1013_v1/frame_01013/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01014/vram.bin mesen_range_1014_1021_v1/frame_01014/cgram.bin mesen_range_1014_1021_v1/frame_01014/ppu_state.json mesen_range_1014_1021_v1/frame_01014/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01015/vram.bin mesen_range_1014_1021_v1/frame_01015/cgram.bin mesen_range_1014_1021_v1/frame_01015/ppu_state.json mesen_range_1014_1021_v1/frame_01015/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01016/vram.bin mesen_range_1014_1021_v1/frame_01016/cgram.bin mesen_range_1014_1021_v1/frame_01016/ppu_state.json mesen_range_1014_1021_v1/frame_01016/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01017/vram.bin mesen_range_1014_1021_v1/frame_01017/cgram.bin mesen_range_1014_1021_v1/frame_01017/ppu_state.json mesen_range_1014_1021_v1/frame_01017/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01018/vram.bin mesen_range_1014_1021_v1/frame_01018/cgram.bin mesen_range_1014_1021_v1/frame_01018/ppu_state.json mesen_range_1014_1021_v1/frame_01018/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01019/vram.bin mesen_range_1014_1021_v1/frame_01019/cgram.bin mesen_range_1014_1021_v1/frame_01019/ppu_state.json mesen_range_1014_1021_v1/frame_01019/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01020/vram.bin mesen_range_1014_1021_v1/frame_01020/cgram.bin mesen_range_1014_1021_v1/frame_01020/ppu_state.json mesen_range_1014_1021_v1/frame_01020/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1014_1021_v1/frame_01021/vram.bin mesen_range_1014_1021_v1/frame_01021/cgram.bin mesen_range_1014_1021_v1/frame_01021/ppu_state.json mesen_range_1014_1021_v1/frame_01021/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01022/vram.bin mesen_range_1022_1029_v1/frame_01022/cgram.bin mesen_range_1022_1029_v1/frame_01022/ppu_state.json mesen_range_1022_1029_v1/frame_01022/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01023/vram.bin mesen_range_1022_1029_v1/frame_01023/cgram.bin mesen_range_1022_1029_v1/frame_01023/ppu_state.json mesen_range_1022_1029_v1/frame_01023/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01024/vram.bin mesen_range_1022_1029_v1/frame_01024/cgram.bin mesen_range_1022_1029_v1/frame_01024/ppu_state.json mesen_range_1022_1029_v1/frame_01024/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01025/vram.bin mesen_range_1022_1029_v1/frame_01025/cgram.bin mesen_range_1022_1029_v1/frame_01025/ppu_state.json mesen_range_1022_1029_v1/frame_01025/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01026/vram.bin mesen_range_1022_1029_v1/frame_01026/cgram.bin mesen_range_1022_1029_v1/frame_01026/ppu_state.json mesen_range_1022_1029_v1/frame_01026/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01027/vram.bin mesen_range_1022_1029_v1/frame_01027/cgram.bin mesen_range_1022_1029_v1/frame_01027/ppu_state.json mesen_range_1022_1029_v1/frame_01027/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01028/vram.bin mesen_range_1022_1029_v1/frame_01028/cgram.bin mesen_range_1022_1029_v1/frame_01028/ppu_state.json mesen_range_1022_1029_v1/frame_01028/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1022_1029_v1/frame_01029/vram.bin mesen_range_1022_1029_v1/frame_01029/cgram.bin mesen_range_1022_1029_v1/frame_01029/ppu_state.json mesen_range_1022_1029_v1/frame_01029/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01030/vram.bin mesen_range_1030_1037_v1/frame_01030/cgram.bin mesen_range_1030_1037_v1/frame_01030/ppu_state.json mesen_range_1030_1037_v1/frame_01030/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01031/vram.bin mesen_range_1030_1037_v1/frame_01031/cgram.bin mesen_range_1030_1037_v1/frame_01031/ppu_state.json mesen_range_1030_1037_v1/frame_01031/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01032/vram.bin mesen_range_1030_1037_v1/frame_01032/cgram.bin mesen_range_1030_1037_v1/frame_01032/ppu_state.json mesen_range_1030_1037_v1/frame_01032/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01033/vram.bin mesen_range_1030_1037_v1/frame_01033/cgram.bin mesen_range_1030_1037_v1/frame_01033/ppu_state.json mesen_range_1030_1037_v1/frame_01033/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01034/vram.bin mesen_range_1030_1037_v1/frame_01034/cgram.bin mesen_range_1030_1037_v1/frame_01034/ppu_state.json mesen_range_1030_1037_v1/frame_01034/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01035/vram.bin mesen_range_1030_1037_v1/frame_01035/cgram.bin mesen_range_1030_1037_v1/frame_01035/ppu_state.json mesen_range_1030_1037_v1/frame_01035/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01036/vram.bin mesen_range_1030_1037_v1/frame_01036/cgram.bin mesen_range_1030_1037_v1/frame_01036/ppu_state.json mesen_range_1030_1037_v1/frame_01036/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1030_1037_v1/frame_01037/vram.bin mesen_range_1030_1037_v1/frame_01037/cgram.bin mesen_range_1030_1037_v1/frame_01037/ppu_state.json mesen_range_1030_1037_v1/frame_01037/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01038/vram.bin mesen_range_1038_1045_v1/frame_01038/cgram.bin mesen_range_1038_1045_v1/frame_01038/ppu_state.json mesen_range_1038_1045_v1/frame_01038/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01039/vram.bin mesen_range_1038_1045_v1/frame_01039/cgram.bin mesen_range_1038_1045_v1/frame_01039/ppu_state.json mesen_range_1038_1045_v1/frame_01039/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01040/vram.bin mesen_range_1038_1045_v1/frame_01040/cgram.bin mesen_range_1038_1045_v1/frame_01040/ppu_state.json mesen_range_1038_1045_v1/frame_01040/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01041/vram.bin mesen_range_1038_1045_v1/frame_01041/cgram.bin mesen_range_1038_1045_v1/frame_01041/ppu_state.json mesen_range_1038_1045_v1/frame_01041/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01042/vram.bin mesen_range_1038_1045_v1/frame_01042/cgram.bin mesen_range_1038_1045_v1/frame_01042/ppu_state.json mesen_range_1038_1045_v1/frame_01042/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01043/vram.bin mesen_range_1038_1045_v1/frame_01043/cgram.bin mesen_range_1038_1045_v1/frame_01043/ppu_state.json mesen_range_1038_1045_v1/frame_01043/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01044/vram.bin mesen_range_1038_1045_v1/frame_01044/cgram.bin mesen_range_1038_1045_v1/frame_01044/ppu_state.json mesen_range_1038_1045_v1/frame_01044/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1038_1045_v1/frame_01045/vram.bin mesen_range_1038_1045_v1/frame_01045/cgram.bin mesen_range_1038_1045_v1/frame_01045/ppu_state.json mesen_range_1038_1045_v1/frame_01045/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01046/vram.bin mesen_range_1046_1053_v1/frame_01046/cgram.bin mesen_range_1046_1053_v1/frame_01046/ppu_state.json mesen_range_1046_1053_v1/frame_01046/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01047/vram.bin mesen_range_1046_1053_v1/frame_01047/cgram.bin mesen_range_1046_1053_v1/frame_01047/ppu_state.json mesen_range_1046_1053_v1/frame_01047/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01048/vram.bin mesen_range_1046_1053_v1/frame_01048/cgram.bin mesen_range_1046_1053_v1/frame_01048/ppu_state.json mesen_range_1046_1053_v1/frame_01048/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01049/vram.bin mesen_range_1046_1053_v1/frame_01049/cgram.bin mesen_range_1046_1053_v1/frame_01049/ppu_state.json mesen_range_1046_1053_v1/frame_01049/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01050/vram.bin mesen_range_1046_1053_v1/frame_01050/cgram.bin mesen_range_1046_1053_v1/frame_01050/ppu_state.json mesen_range_1046_1053_v1/frame_01050/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01051/vram.bin mesen_range_1046_1053_v1/frame_01051/cgram.bin mesen_range_1046_1053_v1/frame_01051/ppu_state.json mesen_range_1046_1053_v1/frame_01051/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01052/vram.bin mesen_range_1046_1053_v1/frame_01052/cgram.bin mesen_range_1046_1053_v1/frame_01052/ppu_state.json mesen_range_1046_1053_v1/frame_01052/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1046_1053_v1/frame_01053/vram.bin mesen_range_1046_1053_v1/frame_01053/cgram.bin mesen_range_1046_1053_v1/frame_01053/ppu_state.json mesen_range_1046_1053_v1/frame_01053/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01054/vram.bin mesen_range_1054_1061_v1/frame_01054/cgram.bin mesen_range_1054_1061_v1/frame_01054/ppu_state.json mesen_range_1054_1061_v1/frame_01054/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01055/vram.bin mesen_range_1054_1061_v1/frame_01055/cgram.bin mesen_range_1054_1061_v1/frame_01055/ppu_state.json mesen_range_1054_1061_v1/frame_01055/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01056/vram.bin mesen_range_1054_1061_v1/frame_01056/cgram.bin mesen_range_1054_1061_v1/frame_01056/ppu_state.json mesen_range_1054_1061_v1/frame_01056/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01057/vram.bin mesen_range_1054_1061_v1/frame_01057/cgram.bin mesen_range_1054_1061_v1/frame_01057/ppu_state.json mesen_range_1054_1061_v1/frame_01057/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01058/vram.bin mesen_range_1054_1061_v1/frame_01058/cgram.bin mesen_range_1054_1061_v1/frame_01058/ppu_state.json mesen_range_1054_1061_v1/frame_01058/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01059/vram.bin mesen_range_1054_1061_v1/frame_01059/cgram.bin mesen_range_1054_1061_v1/frame_01059/ppu_state.json mesen_range_1054_1061_v1/frame_01059/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01060/vram.bin mesen_range_1054_1061_v1/frame_01060/cgram.bin mesen_range_1054_1061_v1/frame_01060/ppu_state.json mesen_range_1054_1061_v1/frame_01060/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1054_1061_v1/frame_01061/vram.bin mesen_range_1054_1061_v1/frame_01061/cgram.bin mesen_range_1054_1061_v1/frame_01061/ppu_state.json mesen_range_1054_1061_v1/frame_01061/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01062/vram.bin mesen_range_1062_1069_v1/frame_01062/cgram.bin mesen_range_1062_1069_v1/frame_01062/ppu_state.json mesen_range_1062_1069_v1/frame_01062/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01063/vram.bin mesen_range_1062_1069_v1/frame_01063/cgram.bin mesen_range_1062_1069_v1/frame_01063/ppu_state.json mesen_range_1062_1069_v1/frame_01063/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01064/vram.bin mesen_range_1062_1069_v1/frame_01064/cgram.bin mesen_range_1062_1069_v1/frame_01064/ppu_state.json mesen_range_1062_1069_v1/frame_01064/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01065/vram.bin mesen_range_1062_1069_v1/frame_01065/cgram.bin mesen_range_1062_1069_v1/frame_01065/ppu_state.json mesen_range_1062_1069_v1/frame_01065/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01066/vram.bin mesen_range_1062_1069_v1/frame_01066/cgram.bin mesen_range_1062_1069_v1/frame_01066/ppu_state.json mesen_range_1062_1069_v1/frame_01066/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01067/vram.bin mesen_range_1062_1069_v1/frame_01067/cgram.bin mesen_range_1062_1069_v1/frame_01067/ppu_state.json mesen_range_1062_1069_v1/frame_01067/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01068/vram.bin mesen_range_1062_1069_v1/frame_01068/cgram.bin mesen_range_1062_1069_v1/frame_01068/ppu_state.json mesen_range_1062_1069_v1/frame_01068/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1062_1069_v1/frame_01069/vram.bin mesen_range_1062_1069_v1/frame_01069/cgram.bin mesen_range_1062_1069_v1/frame_01069/ppu_state.json mesen_range_1062_1069_v1/frame_01069/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01070/vram.bin mesen_range_1070_1077_v1/frame_01070/cgram.bin mesen_range_1070_1077_v1/frame_01070/ppu_state.json mesen_range_1070_1077_v1/frame_01070/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01071/vram.bin mesen_range_1070_1077_v1/frame_01071/cgram.bin mesen_range_1070_1077_v1/frame_01071/ppu_state.json mesen_range_1070_1077_v1/frame_01071/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01072/vram.bin mesen_range_1070_1077_v1/frame_01072/cgram.bin mesen_range_1070_1077_v1/frame_01072/ppu_state.json mesen_range_1070_1077_v1/frame_01072/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01073/vram.bin mesen_range_1070_1077_v1/frame_01073/cgram.bin mesen_range_1070_1077_v1/frame_01073/ppu_state.json mesen_range_1070_1077_v1/frame_01073/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01074/vram.bin mesen_range_1070_1077_v1/frame_01074/cgram.bin mesen_range_1070_1077_v1/frame_01074/ppu_state.json mesen_range_1070_1077_v1/frame_01074/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01075/vram.bin mesen_range_1070_1077_v1/frame_01075/cgram.bin mesen_range_1070_1077_v1/frame_01075/ppu_state.json mesen_range_1070_1077_v1/frame_01075/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01076/vram.bin mesen_range_1070_1077_v1/frame_01076/cgram.bin mesen_range_1070_1077_v1/frame_01076/ppu_state.json mesen_range_1070_1077_v1/frame_01076/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1070_1077_v1/frame_01077/vram.bin mesen_range_1070_1077_v1/frame_01077/cgram.bin mesen_range_1070_1077_v1/frame_01077/ppu_state.json mesen_range_1070_1077_v1/frame_01077/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01078/vram.bin mesen_range_1078_1085_v1/frame_01078/cgram.bin mesen_range_1078_1085_v1/frame_01078/ppu_state.json mesen_range_1078_1085_v1/frame_01078/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01079/vram.bin mesen_range_1078_1085_v1/frame_01079/cgram.bin mesen_range_1078_1085_v1/frame_01079/ppu_state.json mesen_range_1078_1085_v1/frame_01079/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01080/vram.bin mesen_range_1078_1085_v1/frame_01080/cgram.bin mesen_range_1078_1085_v1/frame_01080/ppu_state.json mesen_range_1078_1085_v1/frame_01080/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01081/vram.bin mesen_range_1078_1085_v1/frame_01081/cgram.bin mesen_range_1078_1085_v1/frame_01081/ppu_state.json mesen_range_1078_1085_v1/frame_01081/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01082/vram.bin mesen_range_1078_1085_v1/frame_01082/cgram.bin mesen_range_1078_1085_v1/frame_01082/ppu_state.json mesen_range_1078_1085_v1/frame_01082/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01083/vram.bin mesen_range_1078_1085_v1/frame_01083/cgram.bin mesen_range_1078_1085_v1/frame_01083/ppu_state.json mesen_range_1078_1085_v1/frame_01083/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01084/vram.bin mesen_range_1078_1085_v1/frame_01084/cgram.bin mesen_range_1078_1085_v1/frame_01084/ppu_state.json mesen_range_1078_1085_v1/frame_01084/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1078_1085_v1/frame_01085/vram.bin mesen_range_1078_1085_v1/frame_01085/cgram.bin mesen_range_1078_1085_v1/frame_01085/ppu_state.json mesen_range_1078_1085_v1/frame_01085/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01086/vram.bin mesen_range_1086_1093_v1/frame_01086/cgram.bin mesen_range_1086_1093_v1/frame_01086/ppu_state.json mesen_range_1086_1093_v1/frame_01086/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01087/vram.bin mesen_range_1086_1093_v1/frame_01087/cgram.bin mesen_range_1086_1093_v1/frame_01087/ppu_state.json mesen_range_1086_1093_v1/frame_01087/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01088/vram.bin mesen_range_1086_1093_v1/frame_01088/cgram.bin mesen_range_1086_1093_v1/frame_01088/ppu_state.json mesen_range_1086_1093_v1/frame_01088/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01089/vram.bin mesen_range_1086_1093_v1/frame_01089/cgram.bin mesen_range_1086_1093_v1/frame_01089/ppu_state.json mesen_range_1086_1093_v1/frame_01089/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01090/vram.bin mesen_range_1086_1093_v1/frame_01090/cgram.bin mesen_range_1086_1093_v1/frame_01090/ppu_state.json mesen_range_1086_1093_v1/frame_01090/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01091/vram.bin mesen_range_1086_1093_v1/frame_01091/cgram.bin mesen_range_1086_1093_v1/frame_01091/ppu_state.json mesen_range_1086_1093_v1/frame_01091/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01092/vram.bin mesen_range_1086_1093_v1/frame_01092/cgram.bin mesen_range_1086_1093_v1/frame_01092/ppu_state.json mesen_range_1086_1093_v1/frame_01092/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	printf '%s\n' 'snes_bg 1 mesen_range_1086_1093_v1/frame_01093/vram.bin mesen_range_1086_1093_v1/frame_01093/cgram.bin mesen_range_1086_1093_v1/frame_01093/ppu_state.json mesen_range_1086_1093_v1/frame_01093/oam.bin' >> $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE)
	$(PYTHON) runtime_manifest_to_json.py $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_VISIBLE_JSON)

$(INTRO_LOOP_HYBRID_SEQUENCE) $(INTRO_LOOP_HYBRID_SEQUENCE_JSON): splice_runtime_manifest.py $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_NATIVE_978_DERIVED_SEQUENCE) | $(OUT_DIR)
	$(PYTHON) splice_runtime_manifest.py $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_NATIVE_978_DERIVED_SEQUENCE) $(INTRO_LOOP_HYBRID_SEQUENCE) \
		--base-frame 654 \
		--replace-start-frame 978 \
		--replace-end-frame-exclusive 986 \
		--json-out $(INTRO_LOOP_HYBRID_SEQUENCE_JSON)

intro-loop-hybrid-sequence: $(INTRO_LOOP_HYBRID_SEQUENCE) $(INTRO_LOOP_HYBRID_SEQUENCE_JSON)

$(INTRO_LOOP_HYBRID_BRIDGE_SEQUENCE) $(INTRO_LOOP_HYBRID_BRIDGE_JSON): splice_runtime_manifest.py $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_SEQUENCE) | $(OUT_DIR)
	$(PYTHON) splice_runtime_manifest.py $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_SEQUENCE) $(INTRO_LOOP_HYBRID_BRIDGE_SEQUENCE) \
		--base-frame 654 \
		--replace-start-frame 978 \
		--replace-end-frame-exclusive 994 \
		--json-out $(INTRO_LOOP_HYBRID_BRIDGE_JSON)

intro-loop-hybrid-bridge-sequence: $(INTRO_LOOP_HYBRID_BRIDGE_SEQUENCE) $(INTRO_LOOP_HYBRID_BRIDGE_JSON)

$(INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_SEQUENCE) $(INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_JSON): splice_runtime_manifest.py $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE) | $(OUT_DIR)
	$(PYTHON) splice_runtime_manifest.py $(INTRO_LOOP_HYBRID_BASE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE) $(INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_SEQUENCE) \
		--base-frame 654 \
		--replace-start-frame 978 \
		--replace-end-frame-exclusive 1094 \
		--json-out $(INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_JSON)

intro-loop-hybrid-bridge-visible-sequence: $(INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_SEQUENCE) $(INTRO_LOOP_HYBRID_BRIDGE_VISIBLE_JSON)

intro-native-978: $(INTRO_NATIVE_978_DIR)/sequence.txt $(INTRO_NATIVE_978_DIR)/sequence.json

intro-native-978-derived: $(INTRO_NATIVE_978_DERIVED_SEQUENCE) $(INTRO_NATIVE_978_DERIVED_JSON)

intro-native-978-bridge: $(INTRO_NATIVE_978_BRIDGE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_JSON)

intro-native-978-bridge-visible: $(INTRO_NATIVE_978_BRIDGE_VISIBLE_SEQUENCE) $(INTRO_NATIVE_978_BRIDGE_VISIBLE_JSON)
