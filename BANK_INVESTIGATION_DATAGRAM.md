# Bank Investigation Datagram

This root-level note is a high-level map of how the repo currently investigates
ROM banks and which bank roles/callback links are already promoted.

## Investigation Loop

```mermaid
flowchart LR
    ROM[game.smc]
    SYM[game.sym]
    ASM[bank*.asm static read]
    PROBE[Mesen probes / scanline traces / design packs]
    DECODE[chunk decoders / extractors]
    XREF[static + runtime cross-check]
    CLAIM[promoted claim]
    OUT1[bank typing]
    OUT2[callback contracts]
    OUT3[asset provenance]

    ROM --> ASM
    SYM --> ASM
    ROM --> PROBE
    ROM --> DECODE
    ASM --> XREF
    PROBE --> XREF
    DECODE --> XREF
    XREF --> CLAIM
    CLAIM --> OUT1
    CLAIM --> OUT2
    CLAIM --> OUT3
```

## Current Validated Spine

```mermaid
flowchart LR
    classDef validated fill:#d9f7e8,stroke:#2f6f4f,color:#111;
    classDef active fill:#fff3cd,stroke:#8a6d3b,color:#111;
    classDef mixed fill:#ffe5b4,stroke:#946200,color:#111;
    classDef note fill:#f5f5f5,stroke:#777,color:#111;

    ROM[game.smc]

    subgraph Control[Validated control / callback spine]
        B00[bank0.asm / SNES $00<br/>RESET + NMI + IRQ + scheduler]
        STAGE[$0038/$003B/$003E active<br/>$096C/$096F pending]
        B01[bank1.asm / SNES $01<br/>front-end + gameplay handoff]
        MAIN[bank2.asm / SNES $02 main<br/>02:9016]
        IRQ[bank1.asm / SNES $01 IRQ<br/>01:96A0 / 01:960D]
        NMI[bank2.asm / SNES $02 NMI<br/>02:8F3C]
    end

    subgraph Support[Typed support banks]
        B0A[bank10.asm / SNES $0A<br/>physics + AI core]
        B0B[bank11.asm / SNES $0B<br/>road raster + scanline HDMA]
        B0F[bank15.asm / SNES $0F<br/>object payload source<br/>local proof: 15:B4A8 to 15:B4B8]
        B1E[bank30.asm / SNES $1E<br/>compressed dispatch/data<br/>DA96 map-like, EE7F still open]
    end

    subgraph Handoff[Visible handoff]
        Q[0600 DMA queue]
        OAM[0700 OAM staging]
        PPU[bank0 NMI body to VRAM/OAM/PPU]
    end

    ROM --> B00
    ROM --> B01
    ROM --> B0A
    ROM --> B0B
    ROM --> B0F
    ROM --> B1E

    B00 --> STAGE
    B01 -- 01:902D stages main --> MAIN
    B01 -- 01:902D stages nmi --> NMI
    STAGE -- active main --> MAIN
    STAGE -- active irq --> IRQ
    STAGE -- active nmi --> NMI

    MAIN --> B0A
    MAIN --> B0B
    MAIN --> Q
    MAIN --> OAM
    B0B --> IRQ
    B0F --> Q
    B01 -- pointer tables / L001210 --> B1E
    Q --> PPU
    OAM --> PPU
    IRQ --> PPU
    NMI --> PPU

    P00["pseudo<br/>promote pending main<br/>promote pending nmi<br/>jump active_main"]:::note
    P01["pseudo<br/>stage main 02:9016<br/>stage nmi 02:8F3C<br/>enter 01:9111"]:::note
    P02["pseudo<br/>update gameplay state<br/>build HUD and OAM<br/>advance queue cursors"]:::note
    P03["pseudo<br/>write TMAIN and HOFS/VOFS<br/>next_irq = 960D or 96A0"]:::note
    P04["pseudo<br/>dma queue 0600<br/>dma oam 0700<br/>sample JOY1"]:::note
    P05["pseudo<br/>ptr = table[idx]<br/>chunk = decompress(ptr)<br/>classify consumer"]:::note
    P06["pseudo<br/>obj = 15:B4A8<br/>payload = 15:B4B8<br/>queue vram 0x6180"]:::note

    B00 -.-> P00
    B01 -.-> P01
    MAIN -.-> P02
    IRQ -.-> P03
    PPU -.-> P04
    B1E -.-> P05
    B0F -.-> P06

    class B00,B01,MAIN,IRQ,NMI validated;
    class B0A active;
    class B0B validated;
    class B0F,B1E mixed;
```

## Reading Notes

- `bank0` is the control kernel. It owns RESET, the NMI wrapper/body, the IRQ
  wrapper, and callback staging/promotion.
- `bank1` is the validated handoff bank for the front-end to gameplay
  corridor. `01:902D` explicitly stages `02:9016` and `02:8F3C`.
- `bank2` is the promoted gameplay callback family currently seen as main
  `02:9016` and NMI `02:8F3C`.
- `bank1` also owns the validated gameplay IRQ pair `01:96A0 / 01:960D`.
- `bank10` and `bank11` are the active gameplay-support banks for physics/AI
  and road/split raster work.
- `bank15` and `bank30` are typed as content/support banks, but their role is
  still consumer/provenance-driven rather than fully closed as one-line
  labels.
