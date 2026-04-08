# SNES Bank Flow Datagram

This root-level note is intentionally narrow: it only shows the current
promoted flow between ROM banks in the original SNES codebase we are
disassembling.

## Current Promoted Bank Flow

```mermaid
flowchart LR
    classDef validated fill:#d9f7e8,stroke:#2f6f4f,color:#111;
    classDef active fill:#fff3cd,stroke:#8a6d3b,color:#111;
    classDef mixed fill:#ffe5b4,stroke:#946200,color:#111;
    classDef note fill:#f5f5f5,stroke:#777,color:#111;

    B00["bank0 / SNES $00<br/>kernel<br/>RESET + NMI + IRQ + callback staging"]
    B01["bank1 / SNES $01<br/>front-end corridor<br/>gameplay handoff + gameplay IRQ"]
    B02["bank2 / SNES $02<br/>gameplay main family<br/>02:9016 main / 02:8F3C nmi"]
    B0A["bank10 / SNES $0A<br/>physics + AI core"]
    B0B["bank11 / SNES $0B<br/>road raster + scanline/HDMA prep"]
    B15["bank21 / SNES $15<br/>object payload catalogs"]
    B1E["bank30 / SNES $1E<br/>compressed dispatch/data"]

    B00 -->|"dispatches active_main / active_irq / active_nmi"| B01
    B00 -->|"dispatches active_main / active_nmi"| B02
    B01 -->|"01:902D stages 02:9016 main and 02:8F3C nmi"| B02
    B02 -->|"calls/feeds gameplay support work"| B0A
    B02 -->|"feeds road-visible state and raster data"| B0B
    B0B -->|"visible split is materialized by 01:96A0 / 01:960D IRQ pair"| B01
    B01 -->|"pointer tables feed L001210 bank30 entries"| B1E
    B02 -->|"late gameplay selects object payloads"| B15
    B15 -->|"payloads are queued through bank0 DMA helpers"| B00
    B02 -->|"queue/OAM state is consumed by bank0 NMI body"| B00

    P00["pseudo<br/>promote pending callbacks<br/>jmp active_main irq nmi"]:::note
    P01["pseudo<br/>if menu path closes<br/>stage 02:9016 and 02:8F3C"]:::note
    P02["pseudo<br/>update gameplay state<br/>build queue and OAM"]:::note
    P03["pseudo<br/>step physics AI<br/>car and traffic logic"]:::note
    P04["pseudo<br/>build road scanline operands<br/>prepare HDMA shape"]:::note
    P05["pseudo<br/>obj = table[idx]<br/>payload = SNES $15 bytes"]:::note
    P06["pseudo<br/>ptr = table[idx]<br/>chunk = L001210(ptr)"]:::note

    B00 -.-> P00
    B01 -.-> P01
    B02 -.-> P02
    B0A -.-> P03
    B0B -.-> P04
    B15 -.-> P05
    B1E -.-> P06

    class B00,B01,B02 validated;
    class B0A active;
    class B0B validated;
    class B15,B1E mixed;
```

## Reading Notes

- `bank0` is the control kernel. It owns the callback slots/staging cells and
  wraps the actual `NMI` and `IRQ` dispatch.
- `bank1` is the strongest validated bridge bank:
  it closes the front-end path and explicitly stages the gameplay family at
  `01:902D`, while also owning the validated gameplay IRQ pair
  `01:96A0 / 01:960D`.
- `bank2` is the current promoted gameplay bank:
  main callback `02:9016`, NMI callback `02:8F3C`.
- `bank10` and `bank11` are gameplay-support banks, not top-level schedulers.
- the currently promoted object-catalog bank is SNES `$15`
  (repo file `bank21.asm`), not repo file `bank15.asm`
- `bank21/$15` and `bank30/$1E` are content/support banks whose consumers are
  known, but whose full provenance map is still being closed
