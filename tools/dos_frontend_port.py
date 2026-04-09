#!/usr/bin/env python3
"""Minimal contract-driven DOS frontend model for future language ports."""

from __future__ import annotations

import argparse
import json
from dataclasses import asdict, dataclass
from pathlib import Path


CAR_IDS = ("porsche_959", "lamborghini_diablo", "ferrari_f40")
SCENERY_IDS = ("desert_blast", "city_bound", "east_coast", "west_coast")


@dataclass
class DosFrontendState:
    graphics_driver: str = "ega"
    car_index: int = 0
    scenery_index: int = 0
    music_on: bool = True
    sound_on: bool = True
    keyboard_on: bool = True
    car_catalog_ready: bool = True
    scenery_catalog_ready: bool = True
    selected_car_id: str = CAR_IDS[0]
    selected_scenery_id: str = SCENERY_IDS[0]

    def sync_ids(self) -> None:
        self.selected_car_id = CAR_IDS[self.car_index % len(CAR_IDS)]
        self.selected_scenery_id = SCENERY_IDS[self.scenery_index % len(SCENERY_IDS)]

    def play_gate(self) -> dict[str, object]:
        missing = []
        if not self.car_catalog_ready:
            missing.append("car")
        if not self.scenery_catalog_ready:
            missing.append("scenery")
        return {
            "ready": not missing,
            "missing_catalogs": missing,
            "disk_role": "PLAY" if not missing else "MASTER",
        }


def apply_script(state: DosFrontendState, script: str) -> list[dict[str, object]]:
    events = []
    for raw_step in [part.strip() for part in script.split(",") if part.strip()]:
        if raw_step == "left_car":
            state.car_index = (state.car_index - 1) % len(CAR_IDS)
        elif raw_step == "right_car":
            state.car_index = (state.car_index + 1) % len(CAR_IDS)
        elif raw_step == "left_scenery":
            state.scenery_index = (state.scenery_index - 1) % len(SCENERY_IDS)
        elif raw_step == "right_scenery":
            state.scenery_index = (state.scenery_index + 1) % len(SCENERY_IDS)
        elif raw_step == "toggle_music":
            state.music_on = not state.music_on
        elif raw_step == "toggle_sound":
            state.sound_on = not state.sound_on
        elif raw_step == "toggle_keyboard":
            state.keyboard_on = not state.keyboard_on
        elif raw_step == "drop_car_catalog":
            state.car_catalog_ready = False
        elif raw_step == "drop_scenery_catalog":
            state.scenery_catalog_ready = False
        elif raw_step == "restore_car_catalog":
            state.car_catalog_ready = True
        elif raw_step == "restore_scenery_catalog":
            state.scenery_catalog_ready = True
        else:
            raise ValueError(f"unknown step: {raw_step}")
        state.sync_ids()
        events.append(
            {
                "step": raw_step,
                "state": asdict(state),
                "play_gate": state.play_gate(),
            }
        )
    return events


def build_payload(contract_json: Path, script: str) -> dict[str, object]:
    contracts = json.loads(contract_json.read_text(encoding="utf-8"))
    state = DosFrontendState()
    state.sync_ids()
    events = apply_script(state, script)
    return {
        "version": 1,
        "contract_source": str(contract_json),
        "script": script,
        "known_disk_roles": ["MASTER", "CAR", "SCENERY", "PLAY", "PROGRAM"],
        "known_resource_sidecars": contracts["summary"]["common_resource_sidecars"],
        "initial_state": asdict(DosFrontendState()),
        "events": events,
        "final_state": asdict(state),
        "final_play_gate": state.play_gate(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--contract-json", type=Path, required=True)
    parser.add_argument(
        "--script",
        default="right_car,right_scenery,toggle_music,drop_scenery_catalog,restore_scenery_catalog",
        help="comma-separated state transition script",
    )
    parser.add_argument("--json-out", type=Path, help="write the replay result here")
    args = parser.parse_args()

    payload = build_payload(args.contract_json, args.script)
    text = json.dumps(payload, indent=2) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(text, encoding="utf-8")
    else:
        print(text, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
