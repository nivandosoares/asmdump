using System.Runtime.InteropServices;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace MesenPpuExtract;

internal static class Program
{
    private static readonly string[] LayerNames = ["bg1", "bg2", "bg3", "bg4", "main", "sub"];
    private static readonly bool TraceEnabled = Environment.GetEnvironmentVariable("MESEN_PPU_EXTRACT_TRACE") == "1";

    private static int Main(string[] args)
    {
        Options options;
        try {
            options = Options.Parse(args);
        } catch(Exception ex) {
            Console.Error.WriteLine(ex.Message);
            Options.PrintUsage();
            return 2;
        }

        Directory.CreateDirectory(options.OutDir);
        string homeDir = Path.Combine(options.OutDir, ".mesen-home");
        Directory.CreateDirectory(homeDir);
        if(TraceEnabled) {
            Trace(
                "Marshal sizes: " +
                $"SnesPpuState={Marshal.SizeOf<SnesPpuState>()}, " +
                $"SnesPpuToolsState={Marshal.SizeOf<SnesPpuToolsState>()}, " +
                $"DebugPaletteInfo={Marshal.SizeOf<DebugPaletteInfo>()}, " +
                $"DebugSpriteInfo={Marshal.SizeOf<DebugSpriteInfo>()}"
            );
            Trace(
                "SnesPpuState offsets: " +
                $"FrameCount={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.FrameCount))}, " +
                $"ForcedBlank={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.ForcedBlank))}, " +
                $"Mode7={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.Mode7))}, " +
                $"BgMode={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.BgMode))}, " +
                $"MainScreenLayers={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.MainScreenLayers))}, " +
                $"Layers={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.Layers))}, " +
                $"Window={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.Window))}, " +
                $"VramAddress={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.VramAddress))}, " +
                $"OamRamAddress={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.OamRamAddress))}, " +
                $"ColorMathClipMode={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.ColorMathClipMode))}, " +
                $"FixedColor={Marshal.OffsetOf<SnesPpuState>(nameof(SnesPpuState.FixedColor))}"
            );
        }

        try {
            Trace("InitDll");
            MesenCore.InitDll();
            Trace("InitializeEmu");
            MesenCore.InitializeEmu(homeDir, IntPtr.Zero, IntPtr.Zero, true, true, true, true);
            Trace("SetEmulationFlag(ConsoleMode)");
            MesenCore.SetEmulationFlag(EmulationFlags.ConsoleMode, true);

            Trace("LoadRom");
            if(!MesenCore.LoadRom(options.RomPath, string.Empty)) {
                Console.Error.WriteLine($"Failed to load ROM: {options.RomPath}");
                return 1;
            }
            Trace("Pause after LoadRom");
            MesenCore.Pause();

            if(options.Frame > 0) {
                if(options.HoldB || options.HoldStart) {
                    throw new NotSupportedException("Input override stepping is not wired for the non-debugger frame-advance path yet.");
                }

                Trace($"Resume until frame >= {options.Frame}");
                MesenCore.Resume();
                MesenCore.WaitForFrame(CpuType.Snes, (uint)options.Frame, TimeSpan.FromSeconds(options.FrameTimeoutSeconds));
                Trace("Pause at target frame");
                MesenCore.Pause();
            }

            if(options.HoldB || options.HoldStart) {
                var input = new DebugControllerState {
                    B = options.HoldB,
                    Start = options.HoldStart,
                };
                Trace("InitializeDebugger for input overrides");
                MesenCore.InitializeDebugger();
                MesenCore.SetInputOverrides(0, input);
            } else {
                Trace("InitializeDebugger");
                MesenCore.InitializeDebugger();
            }

            Trace("GetPpuState");
            SnesPpuState ppuState = MesenCore.GetPpuState();
            Trace("GetPpuToolsState");
            SnesPpuToolsState toolsState = MesenCore.GetPpuToolsState();
            Trace("GetMemoryState(VRAM/CGRAM/OAM)");
            byte[] vram = MesenCore.GetMemoryState(MemoryType.SnesVideoRam);
            byte[] cgram = MesenCore.GetMemoryState(MemoryType.SnesCgRam);
            byte[] oam = MesenCore.GetMemoryState(MemoryType.SnesSpriteRam);
            Trace("GetPaletteInfo");
            DebugPaletteInfo paletteInfo = MesenCore.GetPaletteInfo(CpuType.Snes, new GetPaletteInfoOptions());
            uint[] rgbPalette = paletteInfo.GetRgbPalette();

            File.WriteAllBytes(Path.Combine(options.OutDir, "vram.bin"), vram);
            File.WriteAllBytes(Path.Combine(options.OutDir, "cgram.bin"), cgram);
            File.WriteAllBytes(Path.Combine(options.OutDir, "oam.bin"), oam);

            SavePaletteJson(Path.Combine(options.OutDir, "palette.json"), paletteInfo, rgbPalette);
            SavePalettePreview(Path.Combine(options.OutDir, "palette.ppm"), paletteInfo, rgbPalette);

            var layerSummaries = new List<object>();
            for(int layerIndex = 0; layerIndex < LayerNames.Length; layerIndex++) {
                GetTilemapOptions tilemapOptions = new() {
                    Layer = (byte)layerIndex,
                    DisplayMode = TilemapDisplayMode.Default,
                    TileHighlightMode = TilemapHighlightMode.None,
                    AttributeHighlightMode = TilemapHighlightMode.None,
                };

                FrameInfo size = MesenCore.GetTilemapSize(CpuType.Snes, tilemapOptions, ppuState);
                if(size.Width == 0 || size.Height == 0) {
                    layerSummaries.Add(new {
                        name = LayerNames[layerIndex],
                        layer = layerIndex,
                        enabled = false,
                    });
                    continue;
                }

                uint[] pixels = new uint[size.Width * size.Height];
                Trace($"GetTilemap({LayerNames[layerIndex]})");
                DebugTilemapInfo info = MesenCore.GetTilemap(CpuType.Snes, tilemapOptions, ppuState, toolsState, vram, rgbPalette, pixels);
                string prefix = Path.Combine(options.OutDir, LayerNames[layerIndex]);
                SavePpm(prefix + ".ppm", (int)size.Width, (int)size.Height, pixels);
                uint[] visiblePixels = CropVisibleRegion(
                    pixels,
                    (int)size.Width,
                    (int)size.Height,
                    NormalizeScroll(info.ScrollX, size.Width),
                    NormalizeScroll(info.ScrollY, size.Height),
                    256,
                    ppuState.OverscanMode ? 239 : 224
                );
                SavePpm(prefix + "_visible.ppm", 256, ppuState.OverscanMode ? 239 : 224, visiblePixels);
                SaveJson(prefix + ".json", new {
                    name = LayerNames[layerIndex],
                    layer = layerIndex,
                    enabled = true,
                    size = new { width = size.Width, height = size.Height },
                    visibleSize = new { width = 256, height = ppuState.OverscanMode ? 239 : 224 },
                    tilemap = new {
                        bpp = info.Bpp,
                        format = info.Format.ToString(),
                        mirroring = info.Mirroring.ToString(),
                        tileWidth = info.TileWidth,
                        tileHeight = info.TileHeight,
                        scrollX = info.ScrollX,
                        scrollWidth = info.ScrollWidth,
                        scrollY = info.ScrollY,
                        scrollHeight = info.ScrollHeight,
                        rowCount = info.RowCount,
                        columnCount = info.ColumnCount,
                        tilemapAddress = info.TilemapAddress,
                        tilesetAddress = info.TilesetAddress,
                        priority = info.Priority,
                    },
                });

                layerSummaries.Add(new {
                    name = LayerNames[layerIndex],
                    layer = layerIndex,
                    enabled = true,
                    size = new { width = size.Width, height = size.Height },
                    bpp = info.Bpp,
                    format = info.Format.ToString(),
                    tilemapAddress = info.TilemapAddress,
                    tilesetAddress = info.TilesetAddress,
                });
            }

            var tilesetSummaries = new List<object>();
            for(int layerIndex = 0; layerIndex < 4; layerIndex++) {
                LayerTilesetPreset? preset = BuildLayerTilesetPreset(ppuState, layerIndex);
                if(preset == null) {
                    continue;
                }

                DebugPaletteInfo tilesetPaletteInfo = MesenCore.GetPaletteInfo(CpuType.Snes, new GetPaletteInfoOptions { Format = preset.Value.Format });
                uint[] tilesetPalette = tilesetPaletteInfo.GetRgbPalette();
                GetTileViewOptions tileViewOptions = new() {
                    MemType = MemoryType.SnesVideoRam,
                    Format = preset.Value.Format,
                    Layout = TileLayout.Normal,
                    Filter = TileFilter.None,
                    Background = TileBackground.Default,
                    Width = 16,
                    Height = 64,
                    StartAddress = preset.Value.StartAddress,
                    Palette = preset.Value.Palette,
                    UseGrayscalePalette = false,
                };

                int outputWidth = tileViewOptions.Width * 8;
                int outputHeight = tileViewOptions.Height * 8;
                uint[] tilePixels = new uint[outputWidth * outputHeight];
                Trace($"GetTileView(bg{layerIndex + 1})");
                MesenCore.GetTileView(CpuType.Snes, tileViewOptions, vram, tilesetPalette, tilePixels);

                string tilesetPrefix = Path.Combine(options.OutDir, $"tiles_bg{layerIndex + 1}");
                SavePpm(tilesetPrefix + ".ppm", outputWidth, outputHeight, tilePixels);
                SaveJson(tilesetPrefix + ".json", new {
                    layer = layerIndex,
                    name = $"bg{layerIndex + 1}",
                    startAddress = preset.Value.StartAddress,
                    format = preset.Value.Format.ToString(),
                    palette = preset.Value.Palette,
                    widthTiles = tileViewOptions.Width,
                    heightTiles = tileViewOptions.Height,
                    widthPixels = outputWidth,
                    heightPixels = outputHeight,
                    chrAddress = ppuState.Layers[layerIndex].ChrAddress,
                    bgMode = ppuState.BgMode,
                    directColor = ppuState.DirectColorMode,
                    extBg = ppuState.ExtBgEnabled,
                });

                tilesetSummaries.Add(new {
                    layer = layerIndex,
                    name = $"bg{layerIndex + 1}",
                    file = $"tiles_bg{layerIndex + 1}.ppm",
                    startAddress = preset.Value.StartAddress,
                    format = preset.Value.Format.ToString(),
                    palette = preset.Value.Palette,
                });
            }

            GetSpritePreviewOptions spriteOptions = new() { Background = SpriteBackground.Black };
            Trace("GetSpritePreviewInfo");
            DebugSpritePreviewInfo spritePreviewInfo = MesenCore.GetSpritePreviewInfo(CpuType.Snes, spriteOptions, ppuState, toolsState);
            DebugSpriteInfo[] sprites = Array.Empty<DebugSpriteInfo>();
            uint[] spritePreviews = Array.Empty<uint>();
            uint[] screenPreview = new uint[Math.Max(1, spritePreviewInfo.Width * spritePreviewInfo.Height)];
            Trace("GetSpriteList");
            MesenCore.GetSpriteList(ref sprites, ref spritePreviews, CpuType.Snes, spriteOptions, ppuState, toolsState, vram, oam, rgbPalette, screenPreview);

            SavePpm(
                Path.Combine(options.OutDir, "sprites_screen.ppm"),
                (int)Math.Max(1, spritePreviewInfo.Width),
                (int)Math.Max(1, spritePreviewInfo.Height),
                screenPreview
            );
            string spritePreviewDir = Path.Combine(options.OutDir, "sprite_previews");
            Directory.CreateDirectory(spritePreviewDir);
            for(int i = 0; i < sprites.Length; i++) {
                uint[] spritePixels = new uint[128 * 128];
                Array.Copy(spritePreviews, i * 128 * 128, spritePixels, 0, spritePixels.Length);
                SavePpm(Path.Combine(spritePreviewDir, $"sprite_{i:D3}.ppm"), 128, 128, spritePixels);
            }
            SaveJson(Path.Combine(options.OutDir, "sprites.json"), new {
                preview = new {
                    width = spritePreviewInfo.Width,
                    height = spritePreviewInfo.Height,
                    spriteCount = spritePreviewInfo.SpriteCount,
                    coordOffsetX = spritePreviewInfo.CoordOffsetX,
                    coordOffsetY = spritePreviewInfo.CoordOffsetY,
                    visibleX = spritePreviewInfo.VisibleX,
                    visibleY = spritePreviewInfo.VisibleY,
                    visibleWidth = spritePreviewInfo.VisibleWidth,
                    visibleHeight = spritePreviewInfo.VisibleHeight,
                    wrapBottomToTop = spritePreviewInfo.WrapBottomToTop,
                    wrapRightToLeft = spritePreviewInfo.WrapRightToLeft,
                },
                sprites = sprites.Select(sprite => new {
                    spriteIndex = sprite.SpriteIndex,
                    x = sprite.X,
                    y = sprite.Y,
                    rawX = sprite.RawX,
                    rawY = sprite.RawY,
                    width = sprite.Width,
                    height = sprite.Height,
                    tileIndex = sprite.TileIndex,
                    tileAddress = sprite.TileAddress,
                    palette = sprite.Palette,
                    paletteAddress = sprite.PaletteAddress,
                    bpp = sprite.Bpp,
                    priority = sprite.Priority.ToString(),
                    mode = sprite.Mode.ToString(),
                    visibility = sprite.Visibility.ToString(),
                    horizontalMirror = sprite.HorizontalMirror.ToString(),
                    verticalMirror = sprite.VerticalMirror.ToString(),
                    previewFile = $"sprite_previews/sprite_{sprite.SpriteIndex:D3}.ppm",
                }),
            });

            SaveJson(Path.Combine(options.OutDir, "state.json"), new {
                rom = options.RomPath,
                frameRequest = options.Frame,
                holdB = options.HoldB,
                holdStart = options.HoldStart,
                ppu = new {
                    frameCount = ppuState.FrameCount,
                    scanline = ppuState.Scanline,
                    cycle = ppuState.Cycle,
                    bgMode = ppuState.BgMode,
                    mainScreenLayers = ppuState.MainScreenLayers,
                    subScreenLayers = ppuState.SubScreenLayers,
                    forcedBlank = ppuState.ForcedBlank,
                    brightness = ppuState.ScreenBrightness,
                    directColorMode = ppuState.DirectColorMode,
                    layers = ppuState.Layers.Select(layer => new {
                        tilemapAddress = layer.TilemapAddress,
                        chrAddress = layer.ChrAddress,
                        hScroll = layer.HScroll,
                        vScroll = layer.VScroll,
                        doubleWidth = layer.DoubleWidth,
                        doubleHeight = layer.DoubleHeight,
                        largeTiles = layer.LargeTiles,
                    }),
                    mode7 = new {
                        matrix = ppuState.Mode7.Matrix,
                        hScroll = ppuState.Mode7.HScroll,
                        vScroll = ppuState.Mode7.VScroll,
                        centerX = ppuState.Mode7.CenterX,
                        centerY = ppuState.Mode7.CenterY,
                        largeMap = ppuState.Mode7.LargeMap,
                        fillWithTile0 = ppuState.Mode7.FillWithTile0,
                        horizontalMirroring = ppuState.Mode7.HorizontalMirroring,
                        verticalMirroring = ppuState.Mode7.VerticalMirroring,
                    },
                },
                ppuTools = new {
                    scanlineBgMode = toolsState.ScanlineBgMode,
                },
                layers = layerSummaries,
                tilesets = tilesetSummaries,
            });
            SaveJson(Path.Combine(options.OutDir, "ppu_state.json"), BuildPortCompatiblePpuState(ppuState));

            Console.WriteLine($"Extracted frame {options.Frame} to {options.OutDir}");
            return 0;
        } finally {
            try {
                MesenCore.ReleaseDebugger();
            } catch {
            }
            try {
                MesenCore.Release();
            } catch {
            }
        }
    }

    private static void SavePaletteJson(string path, DebugPaletteInfo info, uint[] rgbPalette)
    {
        var palettes = new List<List<int[]>>();
        int colorsPerPalette = (int)Math.Max(1, info.ColorsPerPalette);
        for(int paletteIndex = 0; paletteIndex < rgbPalette.Length; paletteIndex += colorsPerPalette) {
            List<int[]> colors = new();
            for(int i = 0; i < colorsPerPalette && paletteIndex + i < rgbPalette.Length; i++) {
                colors.Add(ToRgbTriplet(rgbPalette[paletteIndex + i]));
            }
            palettes.Add(colors);
        }

        SaveJson(path, new {
            colorCount = info.ColorCount,
            bgColorCount = info.BgColorCount,
            spriteColorCount = info.SpriteColorCount,
            spritePaletteOffset = info.SpritePaletteOffset,
            colorsPerPalette = info.ColorsPerPalette,
            rawFormat = info.RawFormat.ToString(),
            palettes,
        });
    }

    private static void SavePalettePreview(string path, DebugPaletteInfo info, uint[] rgbPalette)
    {
        int colorsPerPalette = (int)Math.Max(1, info.ColorsPerPalette);
        int paletteCount = Math.Max(1, (int)Math.Ceiling(rgbPalette.Length / (double)colorsPerPalette));
        const int swatchSize = 16;
        int width = colorsPerPalette * swatchSize;
        int height = paletteCount * swatchSize;
        uint[] pixels = Enumerable.Repeat(0xFF000000u, width * height).ToArray();

        for(int paletteIndex = 0; paletteIndex < paletteCount; paletteIndex++) {
            for(int colorIndex = 0; colorIndex < colorsPerPalette; colorIndex++) {
                int srcIndex = paletteIndex * colorsPerPalette + colorIndex;
                if(srcIndex >= rgbPalette.Length) {
                    continue;
                }

                uint color = rgbPalette[srcIndex];
                int startX = colorIndex * swatchSize;
                int startY = paletteIndex * swatchSize;
                for(int y = 0; y < swatchSize; y++) {
                    int row = (startY + y) * width;
                    for(int x = 0; x < swatchSize; x++) {
                        pixels[row + startX + x] = color;
                    }
                }
            }
        }

        SavePpm(path, width, height, pixels);
    }

    private static void SavePpm(string path, int width, int height, uint[] pixels)
    {
        using FileStream stream = File.Create(path);
        using BinaryWriter writer = new(stream);
        writer.Write(System.Text.Encoding.ASCII.GetBytes($"P6\n{width} {height}\n255\n"));
        for(int i = 0; i < width * height; i++) {
            uint color = pixels[i];
            writer.Write((byte)((color >> 16) & 0xFF));
            writer.Write((byte)((color >> 8) & 0xFF));
            writer.Write((byte)(color & 0xFF));
        }
    }

    private static uint[] CropVisibleRegion(uint[] pixels, int sourceWidth, int sourceHeight, int scrollX, int scrollY, int outputWidth, int outputHeight)
    {
        uint[] output = new uint[outputWidth * outputHeight];
        for(int y = 0; y < outputHeight; y++) {
            int srcY = (scrollY + y) % sourceHeight;
            for(int x = 0; x < outputWidth; x++) {
                int srcX = (scrollX + x) % sourceWidth;
                output[y * outputWidth + x] = pixels[srcY * sourceWidth + srcX];
            }
        }
        return output;
    }

    private static int NormalizeScroll(uint scroll, uint size)
    {
        if(size == 0) {
            return 0;
        }
        uint normalized = scroll & 0x03FF;
        if(normalized == 0x03FF) {
            normalized = 0;
        }
        return (int)(normalized % size);
    }

    private static LayerTilesetPreset? BuildLayerTilesetPreset(SnesPpuState ppuState, int layerIndex)
    {
        if(layerIndex < 0 || layerIndex >= 4) {
            return null;
        }

        int[,] layerBpp = {
            { 2, 2, 2, 2 },
            { 4, 4, 2, 0 },
            { 4, 4, 0, 0 },
            { 8, 4, 0, 0 },
            { 8, 2, 0, 0 },
            { 4, 2, 0, 0 },
            { 4, 0, 0, 0 },
            { 8, 0, 0, 0 },
        };

        if(ppuState.BgMode == 7) {
            return new LayerTilesetPreset(
                0,
                ppuState.ExtBgEnabled ? TileFormat.Mode7ExtBg : (ppuState.DirectColorMode ? TileFormat.Mode7DirectColor : TileFormat.Mode7),
                0
            );
        }

        if(ppuState.BgMode < 0 || ppuState.BgMode >= layerBpp.GetLength(0)) {
            return null;
        }

        int bpp = layerBpp[ppuState.BgMode, layerIndex];
        if(bpp == 0) {
            return null;
        }

        TileFormat format = bpp switch {
            2 => TileFormat.Bpp2,
            4 => TileFormat.Bpp4,
            8 => ppuState.DirectColorMode ? TileFormat.DirectColor : TileFormat.Bpp8,
            _ => TileFormat.Bpp2,
        };

        return new LayerTilesetPreset(ppuState.Layers[layerIndex].ChrAddress * 2, format, 0);
    }

    private static void SaveJson(string path, object value)
    {
        JsonSerializerOptions options = new() {
            WriteIndented = true,
            DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
        };
        File.WriteAllText(path, JsonSerializer.Serialize(value, options));
    }

    private static int[] ToRgbTriplet(uint color)
    {
        return [
            (int)((color >> 16) & 0xFF),
            (int)((color >> 8) & 0xFF),
            (int)(color & 0xFF),
        ];
    }

    private static void Trace(string message)
    {
        if(TraceEnabled) {
            Console.Error.WriteLine($"[mesen_ppu_extract] {message}");
        }
    }

    private static Dictionary<string, object> BuildPortCompatiblePpuState(SnesPpuState ppuState)
    {
        Dictionary<string, object> flat = new() {
            ["ppu.bgMode"] = ppuState.BgMode,
            ["ppu.mode1Bg3Priority"] = ppuState.Mode1Bg3Priority,
            ["ppu.mainScreenLayers"] = ppuState.MainScreenLayers,
            ["ppu.subScreenLayers"] = ppuState.SubScreenLayers,
            ["ppu.forcedBlank"] = ppuState.ForcedBlank,
            ["ppu.brightness"] = ppuState.ScreenBrightness,
            ["ppu.extBgEnabled"] = ppuState.ExtBgEnabled,
            ["ppu.hiResMode"] = ppuState.HiResMode,
            ["ppu.screenInterlace"] = ppuState.ScreenInterlace,
            ["ppu.mode7.fillWithTile0"] = ppuState.Mode7.FillWithTile0,
            ["ppu.mode7.horizontalMirroring"] = ppuState.Mode7.HorizontalMirroring,
            ["ppu.mode7.verticalMirroring"] = ppuState.Mode7.VerticalMirroring,
            ["ppu.mode7.largeMap"] = ppuState.Mode7.LargeMap,
            ["ppu.mode7.centerX"] = ppuState.Mode7.CenterX,
            ["ppu.mode7.centerY"] = ppuState.Mode7.CenterY,
            ["ppu.mode7.hscroll"] = ppuState.Mode7.HScroll,
            ["ppu.mode7.vscroll"] = ppuState.Mode7.VScroll,
            ["ppu.oamRamAddress"] = ppuState.OamRamAddress,
            ["ppu.internalOamAddress"] = ppuState.InternalOamRamAddress,
            ["ppu.oamMode"] = ppuState.OamMode,
            ["ppu.oamBaseAddress"] = ppuState.OamBaseAddress,
            ["ppu.oamAddressOffset"] = ppuState.OamAddressOffset,
            ["ppu.enableOamPriority"] = ppuState.EnableOamPriority,
            ["ppu.objInterlace"] = ppuState.ObjInterlace,
            ["ppu.overscanMode"] = ppuState.OverscanMode,
            ["ppu.directColorMode"] = ppuState.DirectColorMode,
            ["ppu.colorMathClipMode"] = ppuState.ColorMathClipMode.ToString(),
            ["ppu.colorMathPreventMode"] = ppuState.ColorMathPreventMode.ToString(),
            ["ppu.colorMathAddSubscreen"] = ppuState.ColorMathAddSubscreen,
            ["ppu.colorMathEnabled"] = ppuState.ColorMathEnabled,
            ["ppu.colorMathSubtractMode"] = ppuState.ColorMathSubtractMode,
            ["ppu.colorMathHalveResult"] = ppuState.ColorMathHalveResult,
            ["ppu.fixedColor"] = ppuState.FixedColor,
        };

        for(int i = 0; i < ppuState.Mode7.Matrix.Length; i++) {
            flat[$"ppu.mode7.matrix[{i}]"] = ppuState.Mode7.Matrix[i];
        }

        for(int layerIndex = 0; layerIndex < ppuState.Layers.Length; layerIndex++) {
            LayerConfig layer = ppuState.Layers[layerIndex];
            flat[$"ppu.layers[{layerIndex}].tilemapAddress"] = layer.TilemapAddress;
            flat[$"ppu.layers[{layerIndex}].chrAddress"] = layer.ChrAddress;
            flat[$"ppu.layers[{layerIndex}].doubleWidth"] = layer.DoubleWidth;
            flat[$"ppu.layers[{layerIndex}].doubleHeight"] = layer.DoubleHeight;
            flat[$"ppu.layers[{layerIndex}].largeTiles"] = layer.LargeTiles;
            flat[$"ppu.layers[{layerIndex}].hscroll"] = layer.HScroll;
            flat[$"ppu.layers[{layerIndex}].vscroll"] = layer.VScroll;
        }

        for(int windowIndex = 0; windowIndex < ppuState.Window.Length; windowIndex++) {
            WindowConfig window = ppuState.Window[windowIndex];
            flat[$"ppu.window[{windowIndex}].left"] = window.Left;
            flat[$"ppu.window[{windowIndex}].right"] = window.Right;
            for(int layerIndex = 0; layerIndex < window.ActiveLayers.Length; layerIndex++) {
                flat[$"ppu.window[{windowIndex}].activeLayers[{layerIndex}]"] = window.ActiveLayers[layerIndex];
                flat[$"ppu.window[{windowIndex}].invertedLayers[{layerIndex}]"] = window.InvertedLayers[layerIndex];
            }
        }

        for(int logicIndex = 0; logicIndex < ppuState.MaskLogic.Length; logicIndex++) {
            flat[$"ppu.windowMaskLogic[{logicIndex}]"] = ppuState.MaskLogic[logicIndex].ToString();
        }

        for(int maskIndex = 0; maskIndex < ppuState.WindowMaskMain.Length; maskIndex++) {
            flat[$"ppu.windowMaskMain[{maskIndex}]"] = ppuState.WindowMaskMain[maskIndex];
            flat[$"ppu.windowMaskSub[{maskIndex}]"] = ppuState.WindowMaskSub[maskIndex];
        }

        return flat;
    }
}

internal readonly record struct LayerTilesetPreset(int StartAddress, TileFormat Format, int Palette);

internal sealed record Options(string RomPath, int Frame, string OutDir, bool HoldB, bool HoldStart, double FrameTimeoutSeconds)
{
    public static Options Parse(string[] args)
    {
        string? romPath = null;
        int frame = 0;
        string? outDir = null;
        bool holdB = false;
        bool holdStart = false;
        double frameTimeoutSeconds = 30.0;

        for(int i = 0; i < args.Length; i++) {
            switch(args[i]) {
                case "--rom":
                    romPath = RequireValue(args, ref i, "--rom");
                    break;
                case "--frame":
                    frame = int.Parse(RequireValue(args, ref i, "--frame"));
                    break;
                case "--out-dir":
                    outDir = RequireValue(args, ref i, "--out-dir");
                    break;
                case "--frame-timeout-seconds":
                    frameTimeoutSeconds = double.Parse(RequireValue(args, ref i, "--frame-timeout-seconds"));
                    break;
                case "--hold-b":
                    holdB = true;
                    break;
                case "--hold-start":
                    holdStart = true;
                    break;
                default:
                    throw new ArgumentException($"Unknown argument: {args[i]}");
            }
        }

        if(string.IsNullOrWhiteSpace(romPath)) {
            throw new ArgumentException("Missing required argument: --rom");
        }
        if(string.IsNullOrWhiteSpace(outDir)) {
            throw new ArgumentException("Missing required argument: --out-dir");
        }
        if(frameTimeoutSeconds <= 0.0) {
            throw new ArgumentException("--frame-timeout-seconds must be greater than zero");
        }

        return new Options(Path.GetFullPath(romPath), frame, Path.GetFullPath(outDir), holdB, holdStart, frameTimeoutSeconds);
    }

    public static void PrintUsage()
    {
        Console.Error.WriteLine("Usage: mesen_ppu_extract --rom <path> --frame <n> --out-dir <dir> [--frame-timeout-seconds <seconds>] [--hold-b] [--hold-start]");
    }

    private static string RequireValue(string[] args, ref int index, string argName)
    {
        if(index + 1 >= args.Length) {
            throw new ArgumentException($"Missing value for {argName}");
        }
        index++;
        return args[index];
    }
}

internal static class MesenCore
{
    private const string DllPath = "MesenCore.so";

    [DllImport(DllPath)]
    public static extern void InitDll();

    [DllImport(DllPath)]
    public static extern void InitializeDebugger();

    [DllImport(DllPath)]
    public static extern void ReleaseDebugger();

    [DllImport(DllPath)]
    public static extern void InitializeEmu(
        [MarshalAs(UnmanagedType.LPUTF8Str)] string homeFolder,
        IntPtr windowHandle,
        IntPtr dxViewerHandle,
        [MarshalAs(UnmanagedType.I1)] bool useSoftwareRenderer,
        [MarshalAs(UnmanagedType.I1)] bool noAudio,
        [MarshalAs(UnmanagedType.I1)] bool noVideo,
        [MarshalAs(UnmanagedType.I1)] bool noInput
    );

    [DllImport(DllPath)]
    public static extern void Release();

    [DllImport(DllPath)]
    public static extern void Pause();

    [DllImport(DllPath)]
    public static extern void Resume();

    [DllImport(DllPath)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool LoadRom(
        [MarshalAs(UnmanagedType.LPUTF8Str)] string filepath,
        [MarshalAs(UnmanagedType.LPUTF8Str)] string patchFile
    );

    [DllImport(DllPath)]
    public static extern TimingInfo GetTimingInfo(CpuType cpuType);

    [DllImport(DllPath)]
    public static extern void Step(CpuType cpuType, int instructionCount, StepType type);

    [DllImport(DllPath)]
    public static extern void ResumeExecution();

    [DllImport(DllPath)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool IsExecutionStopped();

    [DllImport(DllPath)]
    public static extern void SetEmulationFlag(EmulationFlags flag, bool enabled);

    [DllImport(DllPath)]
    public static extern void SetInputOverrides(uint index, DebugControllerState state);

    [DllImport(DllPath)]
    private static extern void GetPpuState(IntPtr state, CpuType cpuType);

    [DllImport(DllPath)]
    private static extern void GetPpuToolsState(CpuType cpuType, IntPtr state);

    [DllImport(DllPath)]
    public static extern int GetMemorySize(MemoryType type);

    [DllImport(DllPath, EntryPoint = "GetMemoryState")]
    private static extern void GetMemoryStateNative(MemoryType type, [In, Out] byte[] buffer);

    [DllImport(DllPath)]
    private static extern FrameInfo GetTilemapSize(CpuType cpuType, InteropGetTilemapOptions options, IntPtr state);

    [DllImport(DllPath)]
    private static extern DebugTilemapInfo GetTilemap(CpuType cpuType, InteropGetTilemapOptions options, IntPtr state, IntPtr ppuToolsState, byte[] vram, uint[] palette, IntPtr outputBuffer);

    [DllImport(DllPath)]
    private static extern void GetTileView(CpuType cpuType, GetTileViewOptions options, byte[] source, int srcSize, uint[] palette, IntPtr buffer);

    [DllImport(DllPath)]
    private static extern DebugSpritePreviewInfo GetSpritePreviewInfo(CpuType cpuType, GetSpritePreviewOptions options, IntPtr state, IntPtr ppuToolsState);

    [DllImport(DllPath)]
    private static extern void GetSpriteList(CpuType cpuType, GetSpritePreviewOptions options, IntPtr state, IntPtr ppuToolsState, byte[] vram, byte[] spriteRam, uint[] palette, IntPtr sprites, IntPtr spritePreviews, IntPtr screenPreview);

    [DllImport(DllPath)]
    public static extern DebugPaletteInfo GetPaletteInfo(CpuType cpuType, GetPaletteInfoOptions options);

    public static SnesPpuState GetPpuState()
    {
        return GetStateStruct<SnesPpuState>(ptr => GetPpuState(ptr, CpuType.Snes));
    }

    public static SnesPpuToolsState GetPpuToolsState()
    {
        return GetStateStruct<SnesPpuToolsState>(ptr => GetPpuToolsState(CpuType.Snes, ptr));
    }

    public static byte[] GetMemoryState(MemoryType type)
    {
        byte[] buffer = new byte[GetMemorySize(type)];
        GetMemoryStateNative(type, buffer);
        return buffer;
    }

    public static FrameInfo GetTilemapSize(CpuType cpuType, GetTilemapOptions options, SnesPpuState state)
    {
        return WithState(state, statePtr => GetTilemapSize(cpuType, options.ToInterop(), statePtr));
    }

    public static DebugTilemapInfo GetTilemap(CpuType cpuType, GetTilemapOptions options, SnesPpuState state, SnesPpuToolsState toolsState, byte[] vram, uint[] palette, uint[] pixels)
    {
        GCHandle pixelHandle = GCHandle.Alloc(pixels, GCHandleType.Pinned);
        try {
            return WithStates(
                state,
                toolsState,
                (statePtr, toolsPtr) => GetTilemap(cpuType, options.ToInterop(), statePtr, toolsPtr, vram, palette, pixelHandle.AddrOfPinnedObject())
            );
        } finally {
            pixelHandle.Free();
        }
    }

    public static DebugSpritePreviewInfo GetSpritePreviewInfo(CpuType cpuType, GetSpritePreviewOptions options, SnesPpuState state, SnesPpuToolsState toolsState)
    {
        return WithStates(state, toolsState, (statePtr, toolsPtr) => GetSpritePreviewInfo(cpuType, options, statePtr, toolsPtr));
    }

    public static void GetTileView(CpuType cpuType, GetTileViewOptions options, byte[] source, uint[] palette, uint[] pixels)
    {
        GCHandle pixelHandle = GCHandle.Alloc(pixels, GCHandleType.Pinned);
        try {
            GetTileView(cpuType, options, source, source.Length, palette, pixelHandle.AddrOfPinnedObject());
        } finally {
            pixelHandle.Free();
        }
    }

    public static void GetSpriteList(ref DebugSpriteInfo[] sprites, ref uint[] spritePreviews, CpuType cpuType, GetSpritePreviewOptions options, SnesPpuState state, SnesPpuToolsState toolsState, byte[] vram, byte[] spriteRam, uint[] palette, uint[] screenPreview)
    {
        DebugSpritePreviewInfo previewInfo = GetSpritePreviewInfo(cpuType, options, state, toolsState);
        int spriteCount = (int)previewInfo.SpriteCount;
        if(sprites.Length != spriteCount) {
            Array.Resize(ref sprites, spriteCount);
        }
        if(spritePreviews.Length != spriteCount * 128 * 128) {
            Array.Resize(ref spritePreviews, spriteCount * 128 * 128);
        }

        GCHandle spriteHandle = GCHandle.Alloc(sprites, GCHandleType.Pinned);
        GCHandle previewHandle = GCHandle.Alloc(spritePreviews, GCHandleType.Pinned);
        GCHandle screenHandle = GCHandle.Alloc(screenPreview, GCHandleType.Pinned);
        try {
            WithStates(state, toolsState, (statePtr, toolsPtr) => {
                GetSpriteList(
                    cpuType,
                    options,
                    statePtr,
                    toolsPtr,
                    vram,
                    spriteRam,
                    palette,
                    spriteHandle.AddrOfPinnedObject(),
                    previewHandle.AddrOfPinnedObject(),
                    screenHandle.AddrOfPinnedObject()
                );
                return 0;
            });
        } finally {
            spriteHandle.Free();
            previewHandle.Free();
            screenHandle.Free();
        }
    }

    public static void WaitForStepComplete(TimeSpan timeout)
    {
        DateTime deadline = DateTime.UtcNow + timeout;
        bool sawRunning = false;
        while(DateTime.UtcNow < deadline) {
            bool stopped = IsExecutionStopped();
            if(!stopped) {
                sawRunning = true;
            } else if(sawRunning) {
                return;
            }
            Thread.Sleep(1);
        }

        throw new TimeoutException("Timed out waiting for Mesen debugger step to complete.");
    }

    public static void WaitForFrame(CpuType cpuType, uint minimumFrameCount, TimeSpan timeout)
    {
        DateTime deadline = DateTime.UtcNow + timeout;
        while(DateTime.UtcNow < deadline) {
            TimingInfo timing = GetTimingInfo(cpuType);
            if(timing.FrameCount >= minimumFrameCount) {
                return;
            }
            Thread.Sleep(1);
        }

        throw new TimeoutException($"Timed out waiting for frame {minimumFrameCount}.");
    }

    private static T GetStateStruct<T>(Action<IntPtr> reader) where T : struct
    {
        IntPtr ptr = Marshal.AllocHGlobal(Marshal.SizeOf<T>());
        try {
            reader(ptr);
            return Marshal.PtrToStructure<T>(ptr);
        } finally {
            Marshal.FreeHGlobal(ptr);
        }
    }

    private static TResult WithState<TState, TResult>(TState state, Func<IntPtr, TResult> callback) where TState : struct
    {
        IntPtr ptr = Marshal.AllocHGlobal(Marshal.SizeOf<TState>());
        try {
            Marshal.StructureToPtr(state, ptr, false);
            return callback(ptr);
        } finally {
            Marshal.FreeHGlobal(ptr);
        }
    }

    private static TResult WithStates<TState, TToolsState, TResult>(TState state, TToolsState toolsState, Func<IntPtr, IntPtr, TResult> callback)
        where TState : struct
        where TToolsState : struct
    {
        IntPtr statePtr = Marshal.AllocHGlobal(Marshal.SizeOf<TState>());
        IntPtr toolsPtr = Marshal.AllocHGlobal(Marshal.SizeOf<TToolsState>());
        try {
            Marshal.StructureToPtr(state, statePtr, false);
            Marshal.StructureToPtr(toolsState, toolsPtr, false);
            return callback(statePtr, toolsPtr);
        } finally {
            Marshal.FreeHGlobal(statePtr);
            Marshal.FreeHGlobal(toolsPtr);
        }
    }
}

internal enum EmulationFlags : uint
{
    ConsoleMode = 0x10,
}

internal enum CpuType : byte
{
    Snes = 0,
}

internal enum StepType
{
    Step,
    StepOut,
    StepOver,
    CpuCycleStep,
    PpuStep,
    PpuScanline,
    PpuFrame,
    SpecificScanline,
    RunToNmi,
    RunToIrq,
    StepBack,
}

internal enum MemoryType
{
    SnesMemory,
    SpcMemory,
    Sa1Memory,
    NecDspMemory,
    GsuMemory,
    Cx4Memory,
    St018Memory,
    GameboyMemory,
    NesMemory,
    NesPpuMemory,
    PceMemory,
    SmsMemory,
    GbaMemory,
    WsMemory,
    SnesPrgRom,
    SnesWorkRam,
    SnesSaveRam,
    SnesVideoRam,
    SnesSpriteRam,
    SnesCgRam,
}

internal struct FrameInfo
{
    public uint Width;
    public uint Height;
}

internal struct TimingInfo
{
    public double Fps;
    public ulong MasterClock;
    public uint MasterClockRate;
    public uint FrameCount;
    public uint ScanlineCount;
    public int FirstScanline;
    public uint CycleCount;
}

internal enum TilemapDisplayMode
{
    Default,
    Grayscale,
    AttributeView,
}

internal enum TilemapHighlightMode
{
    None,
    Changes,
    Writes,
}

internal sealed class GetTilemapOptions
{
    public byte Layer;
    public ulong MasterClock;
    public TilemapHighlightMode TileHighlightMode;
    public TilemapHighlightMode AttributeHighlightMode;
    public TilemapDisplayMode DisplayMode;

    public InteropGetTilemapOptions ToInterop()
    {
        return new InteropGetTilemapOptions {
            Layer = Layer,
            CompareVram = IntPtr.Zero,
            AccessCounters = IntPtr.Zero,
            MasterClock = MasterClock,
            TileHighlightMode = TileHighlightMode,
            AttributeHighlightMode = AttributeHighlightMode,
            DisplayMode = DisplayMode,
        };
    }
}

[StructLayout(LayoutKind.Sequential)]
internal struct InteropGetTilemapOptions
{
    public byte Layer;
    public IntPtr CompareVram;
    public IntPtr AccessCounters;
    public ulong MasterClock;
    public TilemapHighlightMode TileHighlightMode;
    public TilemapHighlightMode AttributeHighlightMode;
    public TilemapDisplayMode DisplayMode;
}

internal enum TilemapMirroring
{
    None,
    Horizontal,
    Vertical,
    SingleScreenA,
    SingleScreenB,
    FourScreens,
}

internal enum TileFormat
{
    Bpp2,
    Bpp4,
    Bpp8,
    DirectColor,
    Mode7,
    Mode7DirectColor,
    Mode7ExtBg,
}

internal enum TileLayout
{
    Normal,
    SingleLine8x16,
    SingleLine16x16,
}

internal enum TileFilter
{
    None,
    HideUnused,
    HideUsed,
}

internal enum TileBackground
{
    Default,
    Transparent,
    PaletteColor,
    Black,
    White,
    Magenta,
}

[StructLayout(LayoutKind.Sequential)]
internal struct GetTileViewOptions
{
    public MemoryType MemType;
    public TileFormat Format;
    public TileLayout Layout;
    public TileFilter Filter;
    public TileBackground Background;
    public int Width;
    public int Height;
    public int StartAddress;
    public int Palette;
    [MarshalAs(UnmanagedType.I1)] public bool UseGrayscalePalette;
}

internal enum SpriteBackground
{
    Gray,
    Background,
    Transparent,
    Black,
    White,
    Magenta,
}

[StructLayout(LayoutKind.Sequential)]
internal struct GetSpritePreviewOptions
{
    public SpriteBackground Background;
}

[StructLayout(LayoutKind.Sequential)]
internal struct GetPaletteInfoOptions
{
    public TileFormat Format;
}

[StructLayout(LayoutKind.Sequential)]
internal struct DebugTilemapInfo
{
    public uint Bpp;
    public TileFormat Format;
    public TilemapMirroring Mirroring;
    public uint TileWidth;
    public uint TileHeight;
    public uint ScrollX;
    public uint ScrollWidth;
    public uint ScrollY;
    public uint ScrollHeight;
    public uint RowCount;
    public uint ColumnCount;
    public uint TilemapAddress;
    public uint TilesetAddress;
    public sbyte Priority;
}

[StructLayout(LayoutKind.Sequential)]
internal struct DebugSpritePreviewInfo
{
    public uint Width;
    public uint Height;
    public uint SpriteCount;
    public int CoordOffsetX;
    public int CoordOffsetY;
    public uint VisibleX;
    public uint VisibleY;
    public uint VisibleWidth;
    public uint VisibleHeight;
    [MarshalAs(UnmanagedType.I1)] public bool WrapBottomToTop;
    [MarshalAs(UnmanagedType.I1)] public bool WrapRightToLeft;
}

internal enum DebugSpritePriority : sbyte
{
    Undefined = -1,
    Number0 = 0,
    Number1 = 1,
    Number2 = 2,
    Number3 = 3,
    Foreground = 4,
    Background = 5,
}

internal enum DebugSpriteMode : sbyte
{
    Undefined = -1,
    Normal = 0,
    Blending,
    Window,
    Stereoscopic,
}

internal enum SpriteVisibility : byte
{
    Visible = 0,
    Offscreen = 1,
    Disabled = 2,
}

internal enum NullableBoolean : sbyte
{
    Undefined = -1,
    False = 0,
    True = 1,
}

[StructLayout(LayoutKind.Sequential)]
internal unsafe struct DebugSpriteInfo
{
    public int TileIndex;
    public int TileAddress;
    public int PaletteAddress;
    public TileFormat Format;
    public short SpriteIndex;
    public short X;
    public short Y;
    public short RawX;
    public short RawY;
    public short Bpp;
    public short Palette;
    public DebugSpritePriority Priority;
    public DebugSpriteMode Mode;
    public ushort Width;
    public ushort Height;
    public NullableBoolean HorizontalMirror;
    public NullableBoolean VerticalMirror;
    public NullableBoolean MosaicEnabled;
    public NullableBoolean TransformEnabled;
    public NullableBoolean DoubleSize;
    public sbyte TransformParamIndex;
    public SpriteVisibility Visibility;
    [MarshalAs(UnmanagedType.I1)] public bool UseExtendedVram;
    public NullableBoolean UseSecondTable;
    public uint TileCount;
    public fixed uint TileAddresses[64];
}

internal enum RawPaletteFormat
{
    Indexed,
    Rgb555,
    Rgb333,
    Rgb222,
    Rgb444,
    Bgr444,
}

[StructLayout(LayoutKind.Sequential)]
internal unsafe struct DebugPaletteInfo
{
    public MemoryType PaletteMemType;
    public uint PaletteMemOffset;
    [MarshalAs(UnmanagedType.I1)] public bool HasMemType;
    public uint ColorCount;
    public uint BgColorCount;
    public uint SpriteColorCount;
    public uint SpritePaletteOffset;
    public uint ColorsPerPalette;
    public RawPaletteFormat RawFormat;
    public fixed uint RawPalette[512];
    public fixed uint RgbPalette[512];

    public uint[] GetRgbPalette()
    {
        uint[] result = new uint[ColorCount];
        fixed(uint* source = RgbPalette) {
            for(int i = 0; i < result.Length; i++) {
                result[i] = source[i];
            }
        }
        return result;
    }
}

[StructLayout(LayoutKind.Sequential)]
internal struct DebugControllerState
{
    [MarshalAs(UnmanagedType.I1)] public bool A;
    [MarshalAs(UnmanagedType.I1)] public bool B;
    [MarshalAs(UnmanagedType.I1)] public bool X;
    [MarshalAs(UnmanagedType.I1)] public bool Y;
    [MarshalAs(UnmanagedType.I1)] public bool L;
    [MarshalAs(UnmanagedType.I1)] public bool R;
    [MarshalAs(UnmanagedType.I1)] public bool U;
    [MarshalAs(UnmanagedType.I1)] public bool D;
    [MarshalAs(UnmanagedType.I1)] public bool Up;
    [MarshalAs(UnmanagedType.I1)] public bool Down;
    [MarshalAs(UnmanagedType.I1)] public bool Left;
    [MarshalAs(UnmanagedType.I1)] public bool Right;
    [MarshalAs(UnmanagedType.I1)] public bool Select;
    [MarshalAs(UnmanagedType.I1)] public bool Start;
}

[StructLayout(LayoutKind.Sequential)]
internal struct LayerConfig
{
    public ushort TilemapAddress;
    public ushort ChrAddress;
    public ushort HScroll;
    public ushort VScroll;
    [MarshalAs(UnmanagedType.I1)] public bool DoubleWidth;
    [MarshalAs(UnmanagedType.I1)] public bool DoubleHeight;
    [MarshalAs(UnmanagedType.I1)] public bool LargeTiles;
}

[StructLayout(LayoutKind.Sequential)]
internal struct WindowConfig
{
    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 6)]
    public byte[] ActiveLayers;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 6)]
    public byte[] InvertedLayers;

    public byte Left;
    public byte Right;
}

[StructLayout(LayoutKind.Sequential)]
internal struct Mode7Config
{
    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 4)]
    public short[] Matrix;

    public short HScroll;
    public short VScroll;
    public short CenterX;
    public short CenterY;
    public byte ValueLatch;
    [MarshalAs(UnmanagedType.I1)] public bool LargeMap;
    [MarshalAs(UnmanagedType.I1)] public bool FillWithTile0;
    [MarshalAs(UnmanagedType.I1)] public bool HorizontalMirroring;
    [MarshalAs(UnmanagedType.I1)] public bool VerticalMirroring;
    public short HScrollLatch;
    public short VScrollLatch;
}

internal enum WindowMaskLogic
{
    Or = 0,
    And = 1,
    Xor = 2,
    Xnor = 3,
}

internal enum ColorWindowMode
{
    Never = 0,
    OutsideWindow = 1,
    InsideWindow = 2,
    Always = 3,
}

[StructLayout(LayoutKind.Sequential)]
internal struct SnesPpuState
{
    public ushort Cycle;
    public ushort Scanline;
    public ushort HClock;
    public uint FrameCount;
    [MarshalAs(UnmanagedType.I1)] public bool ForcedBlank;
    public byte ScreenBrightness;
    public Mode7Config Mode7;
    public byte BgMode;
    [MarshalAs(UnmanagedType.I1)] public bool Mode1Bg3Priority;
    public byte MainScreenLayers;
    public byte SubScreenLayers;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 4)]
    public LayerConfig[] Layers;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 2)]
    public WindowConfig[] Window;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 6)]
    public WindowMaskLogic[] MaskLogic;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 5)]
    public byte[] WindowMaskMain;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 5)]
    public byte[] WindowMaskSub;

    public ushort VramAddress;
    public byte VramIncrementValue;
    public byte VramAddressRemapping;
    [MarshalAs(UnmanagedType.I1)] public bool VramAddrIncrementOnSecondReg;
    public ushort VramReadBuffer;
    public byte Ppu1OpenBus;
    public byte Ppu2OpenBus;
    public byte CgramAddress;
    public byte InternalCgramAddress;
    public byte CgramWriteBuffer;
    [MarshalAs(UnmanagedType.I1)] public bool CgramAddressLatch;
    public byte MosaicSize;
    public byte MosaicEnabled;
    public ushort OamRamAddress;
    public ushort InternalOamRamAddress;
    public byte OamMode;
    public ushort OamBaseAddress;
    public ushort OamAddressOffset;
    [MarshalAs(UnmanagedType.I1)] public bool EnableOamPriority;
    [MarshalAs(UnmanagedType.I1)] public bool ExtBgEnabled;
    [MarshalAs(UnmanagedType.I1)] public bool HiResMode;
    [MarshalAs(UnmanagedType.I1)] public bool ScreenInterlace;
    [MarshalAs(UnmanagedType.I1)] public bool ObjInterlace;
    [MarshalAs(UnmanagedType.I1)] public bool OverscanMode;
    [MarshalAs(UnmanagedType.I1)] public bool DirectColorMode;
    public ColorWindowMode ColorMathClipMode;
    public ColorWindowMode ColorMathPreventMode;
    [MarshalAs(UnmanagedType.I1)] public bool ColorMathAddSubscreen;
    public byte ColorMathEnabled;
    [MarshalAs(UnmanagedType.I1)] public bool ColorMathSubtractMode;
    [MarshalAs(UnmanagedType.I1)] public bool ColorMathHalveResult;
    public ushort FixedColor;
}

[StructLayout(LayoutKind.Sequential)]
internal struct SnesPpuToolsState
{
    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 239)]
    public byte[] ScanlineBgMode;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 239)]
    public int[] Mode7StartX;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 239)]
    public int[] Mode7StartY;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 239)]
    public int[] Mode7EndX;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst = 239)]
    public int[] Mode7EndY;
}
