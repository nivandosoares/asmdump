#!/usr/bin/env python3
"""Build design-review views from the DOS engine manifest."""

from __future__ import annotations

import argparse
import html
import json
from pathlib import Path


def load_manifest(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def max_visual_size(bundle: dict[str, object]) -> int:
    sizes = []
    for key, value in bundle["bundle_roles"].items():
        if not key.startswith("visual_"):
            continue
        sizes.extend(item["size"] for item in value.values())
    return max(sizes)


def render_token_grid(tokens: list[str]) -> str:
    cells = "".join(f"<span class='token'>{html.escape(token)}</span>" for token in tokens)
    return f"<div class='token-grid'>{cells}</div>"


def render_html(payload: dict[str, object]) -> str:
    cars = payload["car_bundles"]
    scenes = payload["scene_catalog"]
    bootstrap = payload["selection_bootstrap"]
    max_size = max(max_visual_size(bundle) for bundle in cars)

    car_sections = []
    for bundle in cars:
        layout = bundle["bundle_roles"]["layout_descriptor"]
        visual_rows = []
        for role_name in ("visual_dash", "visual_rear", "visual_road", "visual_st"):
            role = bundle["bundle_roles"][role_name]
            pes = role["pes"]["size"]
            pcs = role["pcs"]["size"]
            bar = int((max(pes, pcs) / max_size) * 180) if max_size else 0
            visual_rows.append(
                f"<tr><td>{role_name.replace('visual_', '')}</td>"
                f"<td>{pes}</td><td>{pcs}</td>"
                f"<td><div class='bar' style='width:{bar}px'></div></td></tr>"
            )
        car_sections.append(
            "<section class='card'>"
            f"<h3>{html.escape(bundle['display_name'])} <code>{html.escape(bundle['id'])}</code></h3>"
            f"<p class='meta'>preview contract: <code>{html.escape(bundle['preview_contract']['layout_descriptor'])}</code> + "
            f"<code>{html.escape(bundle['preview_contract']['measured_packed_asset'])}</code></p>"
            "<div class='split'>"
            "<div>"
            "<h4>Logic Prefix</h4>"
            f"<p>main: <code>{bundle['bundle_roles']['logic_main']['u16_prefix']}</code></p>"
            f"<p>aux: <code>{bundle['bundle_roles']['logic_aux']['u16_prefix']}</code></p>"
            "</div>"
            "<div>"
            f"<h4>Layout Tokens ({layout['count']})</h4>"
            f"<p>params: <code>{layout['param_1']}</code>, <code>{layout['param_2']}</code></p>"
            f"{render_token_grid(layout['tokens'])}"
            "</div>"
            "</div>"
            "<table><thead><tr><th>role</th><th>.pes</th><th>.pcs</th><th>relative size</th></tr></thead>"
            f"<tbody>{''.join(visual_rows)}</tbody></table>"
            "</section>"
        )

    scene_rows = "".join(
        f"<tr><td><code>{html.escape(scene['id'])}</code></td><td>{html.escape(scene['display_name_runtime'])}</td><td>{scene['play_disk']}</td></tr>"
        for scene in scenes
    )

    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>DOS Design Review</title>
  <style>
    :root {{
      --bg: #f3efe7;
      --panel: #fffaf0;
      --ink: #1e1a16;
      --muted: #6b6257;
      --accent: #9a3412;
      --line: #d8c8b6;
    }}
    body {{
      margin: 0;
      font-family: Georgia, "Times New Roman", serif;
      background: radial-gradient(circle at top, #fff6e8, var(--bg));
      color: var(--ink);
    }}
    main {{ max-width: 1200px; margin: 0 auto; padding: 32px 24px 64px; }}
    h1, h2, h3, h4 {{ margin: 0 0 12px; }}
    p, li {{ line-height: 1.45; }}
    .hero {{
      background: linear-gradient(135deg, #fffaf0, #f2e6d8);
      border: 1px solid var(--line);
      padding: 24px;
      margin-bottom: 24px;
    }}
    .hero-grid {{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 12px;
      margin-top: 16px;
    }}
    .stat {{ background: rgba(255,255,255,0.65); padding: 12px; border: 1px solid var(--line); }}
    .cards {{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
      gap: 18px;
    }}
    .card {{
      background: var(--panel);
      border: 1px solid var(--line);
      padding: 18px;
      box-shadow: 0 12px 28px rgba(60, 40, 20, 0.08);
    }}
    .meta {{ color: var(--muted); }}
    .split {{
      display: grid;
      grid-template-columns: 1fr;
      gap: 12px;
      margin: 16px 0;
    }}
    .token-grid {{
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
    }}
    .token {{
      border: 1px solid var(--line);
      padding: 4px 8px;
      background: #fff;
      font-size: 13px;
    }}
    table {{ width: 100%; border-collapse: collapse; margin-top: 12px; }}
    th, td {{ border-top: 1px solid var(--line); padding: 8px 6px; text-align: left; }}
    .bar {{ height: 10px; background: linear-gradient(90deg, #ea580c, #f59e0b); border-radius: 999px; }}
    .review {{
      margin-top: 28px;
      background: #201a16;
      color: #f8efe5;
      padding: 20px;
    }}
    code {{ font-family: "DejaVu Sans Mono", monospace; }}
  </style>
</head>
<body>
  <main>
    <section class="hero">
      <h1>DOS Engine Review Surface</h1>
      <p>This page is for design review before packed rendering exists. It shows the current DOS engine direction: catalogs, bootstrap state, per-car bundle roles, and preview layout tokens.</p>
      <div class="hero-grid">
        <div class="stat"><strong>Bootstrap IDs</strong><br><code>{html.escape(str(bootstrap['id_slots']))}</code></div>
        <div class="stat"><strong>Bootstrap selectors</strong><br><code>{html.escape(str(bootstrap['selector_values']))}</code></div>
        <div class="stat"><strong>Cars</strong><br>{len(cars)}</div>
        <div class="stat"><strong>Scenes</strong><br>{len(scenes)}</div>
      </div>
    </section>
    <section class="card">
      <h2>Scene Catalog / Play Disk Routing</h2>
      <table>
        <thead><tr><th>id</th><th>name</th><th>play disk</th></tr></thead>
        <tbody>{scene_rows}</tbody>
      </table>
    </section>
    <h2 style="margin:28px 0 16px;">Car Bundles</h2>
    <section class="cards">
      {''.join(car_sections)}
    </section>
    <section class="review">
      <h2>Design Review Questions</h2>
      <ul>
        <li>Do the DOS car bundles feel like the right engine abstraction for future mods: one ID stem owning logic, layout, and visual roles?</li>
        <li>Do the `.SS` token patterns suggest a reusable layout language for previews and cockpit compositions?</li>
        <li>Should scene review stay at the play-disk/catalog level for now, instead of pretending we already have decoded scenery rendering?</li>
        <li>Is the current bootstrap selection (`P959`, `ROSS`, `CCC`) a good default review seed for future prototype flows?</li>
      </ul>
    </section>
  </main>
</body>
</html>
"""


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Design Review",
        "",
        "## Bootstrap",
        "",
        f"- selector values: `{payload['selection_bootstrap']['selector_values']}`",
        f"- id slots: `{payload['selection_bootstrap']['id_slots']}`",
        "",
        "## Car Bundle Review",
        "",
    ]
    for bundle in payload["car_bundles"]:
        layout = bundle["bundle_roles"]["layout_descriptor"]
        lines.append(f"- `{bundle['id']}` `{bundle['display_name']}`")
        lines.append(
            f"  preview: `{bundle['preview_contract']['layout_descriptor']}` + `{bundle['preview_contract']['measured_packed_asset']}`"
        )
        lines.append(
            f"  tokens ({layout['count']}): `{', '.join(layout['tokens'])}`"
        )
        lines.append(
            f"  main prefix: `{bundle['bundle_roles']['logic_main']['u16_prefix']}`"
        )
    lines.extend(
        [
            "",
            "## Scene Review",
            "",
        ]
    )
    for scene in payload["scene_catalog"]:
        lines.append(f"- `{scene['id']}` `{scene['display_name_runtime']}` play disk `{scene['play_disk']}`")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest-json", type=Path, required=True)
    parser.add_argument("--html-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    payload = load_manifest(args.manifest_json)
    args.html_out.parent.mkdir(parents=True, exist_ok=True)
    args.html_out.write_text(render_html(payload), encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
