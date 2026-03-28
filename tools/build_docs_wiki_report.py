#!/usr/bin/env python3
from __future__ import annotations

import argparse
import html
import json
import os
import re
import shutil
import struct
import zlib
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_MANIFEST = REPO_ROOT / "rom_analysis" / "docs" / "wiki_doc_index.json"
DEFAULT_OUTPUT = REPO_ROOT / "tools" / "out" / "docs_wiki"
DEFAULT_MARKDOWN_BUNDLE_OUTPUT = REPO_ROOT / "tools" / "out" / "docs_wiki_markdown_bundle"


HEADING_RE = re.compile(r"^(#{1,6})\s+(.*)$")
UNORDERED_RE = re.compile(r"^[-*]\s+(.*)$")
ORDERED_RE = re.compile(r"^\d+\.\s+(.*)$")
FENCE_RE = re.compile(r"^```(.*)$")
LINK_RE = re.compile(r"\[([^\]]+)\]\(([^)]+)\)")
STRONG_RE = re.compile(r"\*\*(.+?)\*\*")
IMAGE_RE = re.compile(r"([A-Za-z0-9_./-]+\.(?:png|ppm|jpg|jpeg|gif|webp|bmp))")
IMAGE_EXTS = {".png", ".ppm", ".jpg", ".jpeg", ".gif", ".webp", ".bmp"}


@dataclass(frozen=True)
class DocEntry:
    path: Path
    label: str
    note: str
    section_id: str
    section_title: str
    section_description: str


@dataclass(frozen=True)
class ArtifactImage:
    source_path: Path
    preview_path: Path
    converted: bool


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build a simple wiki-style HTML index for curated repo docs."
    )
    parser.add_argument(
        "--manifest",
        type=Path,
        default=DEFAULT_MANIFEST,
        help="Curated doc manifest JSON path.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT,
        help="Output directory for the generated HTML site.",
    )
    parser.add_argument(
        "--markdown-bundle-dir",
        type=Path,
        default=DEFAULT_MARKDOWN_BUNDLE_OUTPUT,
        help="Output directory for the NotebookLM-friendly markdown bundle.",
    )
    return parser.parse_args()


def ensure_relative_repo_path(path_text: str) -> Path:
    path = Path(path_text)
    if path.is_absolute():
        raise ValueError(f"manifest path must be repo-relative: {path_text}")
    normalized = path.as_posix()
    if normalized.startswith("../"):
        raise ValueError(f"manifest path escapes repo root: {path_text}")
    return path


def read_manifest(manifest_path: Path) -> tuple[dict, list[DocEntry]]:
    data = json.loads(manifest_path.read_text(encoding="utf-8"))
    entries: list[DocEntry] = []
    for section in data["sections"]:
        section_id = section["id"]
        section_title = section["title"]
        section_description = section.get("description", "")
        for entry in section["entries"]:
            rel_path = ensure_relative_repo_path(entry["path"])
            full_path = REPO_ROOT / rel_path
            if not full_path.exists():
                raise FileNotFoundError(f"manifest entry missing: {rel_path}")
            entries.append(
                DocEntry(
                    path=rel_path,
                    label=entry.get("label", rel_path.stem),
                    note=entry.get("note", ""),
                    section_id=section_id,
                    section_title=section_title,
                    section_description=section_description,
                )
            )
    return data, entries


def skip_pnm_space_and_comments(data: bytes, offset: int) -> int:
    while offset < len(data):
        byte = data[offset]
        if byte in b" \t\r\n":
            offset += 1
            continue
        if byte == 35:  # '#'
            while offset < len(data) and data[offset] not in b"\r\n":
                offset += 1
            continue
        break
    return offset


def read_pnm_token(data: bytes, offset: int) -> tuple[str, int]:
    offset = skip_pnm_space_and_comments(data, offset)
    start = offset
    while offset < len(data) and data[offset] not in b" \t\r\n#":
        offset += 1
    if start == offset:
        raise ValueError("unexpected end of PNM header")
    return data[start:offset].decode("ascii"), offset


def scale_sample(sample: int, maxval: int) -> int:
    if maxval <= 0:
        return 0
    if maxval == 255:
        return sample
    return round(sample * 255 / maxval)


def read_pnm_rgb(source_path: Path) -> tuple[int, int, bytes]:
    data = source_path.read_bytes()
    magic, offset = read_pnm_token(data, 0)
    if magic not in {"P6", "P5", "P3", "P2"}:
        raise ValueError(f"unsupported PNM format: {magic}")

    width_token, offset = read_pnm_token(data, offset)
    height_token, offset = read_pnm_token(data, offset)
    maxval_token, offset = read_pnm_token(data, offset)
    width = int(width_token)
    height = int(height_token)
    maxval = int(maxval_token)
    if width <= 0 or height <= 0:
        raise ValueError("invalid PNM dimensions")

    if magic in {"P6", "P5"}:
        offset = skip_pnm_space_and_comments(data, offset)
        channels = 3 if magic == "P6" else 1
        bytes_per_sample = 1 if maxval < 256 else 2
        sample_count = width * height * channels
        expected_bytes = sample_count * bytes_per_sample
        payload = data[offset : offset + expected_bytes]
        if len(payload) != expected_bytes:
            raise ValueError("truncated PNM payload")

        if bytes_per_sample == 1:
            samples = list(payload)
        else:
            samples = [
                int.from_bytes(payload[index : index + 2], "big")
                for index in range(0, len(payload), 2)
            ]
        samples = [scale_sample(sample, maxval) for sample in samples]
    else:
        channels = 3 if magic == "P3" else 1
        sample_count = width * height * channels
        samples = []
        for _ in range(sample_count):
            token, offset = read_pnm_token(data, offset)
            samples.append(scale_sample(int(token), maxval))

    if channels == 3:
        rgb = bytes(samples)
    else:
        rgb = bytes(component for sample in samples for component in (sample, sample, sample))
    return width, height, rgb


def png_chunk(tag: bytes, payload: bytes) -> bytes:
    return (
        struct.pack(">I", len(payload))
        + tag
        + payload
        + struct.pack(">I", zlib.crc32(tag + payload) & 0xFFFFFFFF)
    )


def write_png_from_rgb(dest_path: Path, width: int, height: int, rgb: bytes) -> None:
    rows = []
    stride = width * 3
    for row_index in range(height):
        start = row_index * stride
        rows.append(b"\x00" + rgb[start : start + stride])
    payload = zlib.compress(b"".join(rows), level=9)
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    png_bytes = b"\x89PNG\r\n\x1a\n" + png_chunk(b"IHDR", ihdr) + png_chunk(b"IDAT", payload) + png_chunk(b"IEND", b"")
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    dest_path.write_bytes(png_bytes)


def resolve_image_candidate(candidate: str, source_rel: Path) -> Path | None:
    candidate_path = Path(candidate)
    search_roots = [REPO_ROOT]
    if source_rel.parent != Path("."):
        search_roots.append(REPO_ROOT / source_rel.parent)
    for base in search_roots:
        target = (base / candidate_path).resolve()
        try:
            target.relative_to(REPO_ROOT.resolve())
        except ValueError:
            continue
        if target.is_file():
            return target
    return None


def collect_image_artifacts(markdown_text: str, source_rel: Path, limit: int = 8) -> list[Path]:
    artifacts: list[Path] = []
    seen: set[Path] = set()
    for match in IMAGE_RE.finditer(markdown_text):
        resolved = resolve_image_candidate(match.group(1), source_rel)
        if resolved is None:
            continue
        rel = resolved.relative_to(REPO_ROOT)
        if rel in seen:
            continue
        seen.add(rel)
        artifacts.append(rel)
        if len(artifacts) >= limit:
            break
    return artifacts


def prepare_artifact_image(
    source_rel: Path,
    output_dir: Path,
    cache: dict[Path, ArtifactImage],
) -> ArtifactImage:
    if source_rel in cache:
        return cache[source_rel]

    source_abs = REPO_ROOT / source_rel
    suffix = source_rel.suffix.lower()
    if suffix not in IMAGE_EXTS:
        raise ValueError(f"unsupported artifact extension: {source_rel}")

    if suffix == ".ppm":
        preview_rel = Path("artifacts") / source_rel.with_suffix(".png")
        preview_abs = output_dir / preview_rel
        width, height, rgb = read_pnm_rgb(source_abs)
        write_png_from_rgb(preview_abs, width, height, rgb)
        artifact = ArtifactImage(
            source_path=source_rel,
            preview_path=preview_abs,
            converted=True,
        )
    else:
        preview_rel = Path("artifacts") / source_rel
        preview_abs = output_dir / preview_rel
        preview_abs.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source_abs, preview_abs)
        artifact = ArtifactImage(
            source_path=source_rel,
            preview_path=preview_abs,
            converted=False,
        )

    cache[source_rel] = artifact
    return artifact


def first_heading(markdown_text: str, fallback: str) -> str:
    for line in markdown_text.splitlines():
        match = HEADING_RE.match(line.strip())
        if match:
            return match.group(2).strip()
    return fallback


def first_excerpt(markdown_text: str, fallback: str) -> str:
    lines = markdown_text.splitlines()
    paragraph: list[str] = []
    for line in lines:
        stripped = line.strip()
        if not stripped:
            if paragraph:
                break
            continue
        if stripped.startswith("#") or stripped.startswith("```"):
            continue
        if stripped.startswith("|") or stripped.startswith(">"):
            continue
        if UNORDERED_RE.match(stripped) or ORDERED_RE.match(stripped):
            continue
        paragraph.append(stripped)
        if len(" ".join(paragraph)) >= 220:
            break
    text = " ".join(paragraph).strip()
    return text or fallback


def slugify(text: str) -> str:
    slug = re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")
    return slug or "section"


def page_output_path(output_dir: Path, source_rel: Path) -> Path:
    return output_dir / "pages" / source_rel.with_suffix(".html")


def relative_file_href(from_file: Path, to_file: Path) -> str:
    return Path(os.path.relpath(to_file, start=from_file.parent)).as_posix()


def repo_rel(path: Path) -> str:
    resolved = path.resolve()
    try:
        return resolved.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return resolved.as_posix()


def split_pipe_row(line: str) -> list[str]:
    stripped = line.strip()
    if stripped.startswith("|"):
        stripped = stripped[1:]
    if stripped.endswith("|"):
        stripped = stripped[:-1]
    return [cell.strip() for cell in stripped.split("|")]


def is_table_separator(line: str) -> bool:
    stripped = line.strip()
    if "|" not in stripped and "-" not in stripped:
        return False
    stripped = stripped.replace("|", "").replace(":", "").replace("-", "").strip()
    return stripped == ""


def render_text_markup(text: str, source_rel: Path, page_path: Path, page_map: dict[Path, Path]) -> str:
    parts = re.split(r"(`[^`]*`)", text)
    rendered: list[str] = []
    for part in parts:
        if not part:
            continue
        if part.startswith("`") and part.endswith("`"):
            rendered.append(f"<code>{html.escape(part[1:-1])}</code>")
            continue
        rendered.append(render_links_and_strong(part, source_rel, page_path, page_map))
    return "".join(rendered)


def render_links_and_strong(text: str, source_rel: Path, page_path: Path, page_map: dict[Path, Path]) -> str:
    pieces: list[str] = []
    cursor = 0
    for match in LINK_RE.finditer(text):
        pieces.append(render_strong_only(text[cursor:match.start()]))
        label = match.group(1)
        target = match.group(2)
        href = resolve_markdown_href(target, source_rel, page_path, page_map)
        pieces.append(
            f'<a href="{html.escape(href)}">{render_strong_only(label)}</a>'
        )
        cursor = match.end()
    pieces.append(render_strong_only(text[cursor:]))
    return "".join(pieces)


def render_strong_only(text: str) -> str:
    escaped = html.escape(text)
    return STRONG_RE.sub(lambda match: f"<strong>{match.group(1)}</strong>", escaped)


def resolve_markdown_href(target: str, source_rel: Path, page_path: Path, page_map: dict[Path, Path]) -> str:
    if target.startswith(("http://", "https://", "mailto:")):
        return target
    if target.startswith("#"):
        return target

    if "#" in target:
        target_path_text, anchor = target.split("#", 1)
        anchor_suffix = f"#{anchor}"
    else:
        target_path_text = target
        anchor_suffix = ""

    target_path = Path(target_path_text)
    if target_path.is_absolute():
        return target

    resolved = (REPO_ROOT / source_rel.parent / target_path).resolve()
    try:
        repo_target = resolved.relative_to(REPO_ROOT.resolve())
    except ValueError:
        return target

    if repo_target in page_map:
        return relative_file_href(page_path, page_map[repo_target]) + anchor_suffix

    raw_target = REPO_ROOT / repo_target
    if raw_target.exists():
        return relative_file_href(page_path, raw_target) + anchor_suffix

    return target


def render_markdown(markdown_text: str, source_rel: Path, page_path: Path, page_map: dict[Path, Path]) -> str:
    lines = markdown_text.splitlines()
    chunks: list[str] = []
    index = 0

    while index < len(lines):
        raw_line = lines[index]
        stripped = raw_line.strip()

        if not stripped:
            index += 1
            continue

        fence_match = FENCE_RE.match(raw_line)
        if fence_match:
            language = fence_match.group(1).strip()
            code_lines: list[str] = []
            index += 1
            while index < len(lines) and not FENCE_RE.match(lines[index]):
                code_lines.append(lines[index])
                index += 1
            if index < len(lines):
                index += 1
            lang_attr = f' class="language-{html.escape(language)}"' if language else ""
            chunks.append(
                f"<pre><code{lang_attr}>{html.escape(chr(10).join(code_lines))}</code></pre>"
            )
            continue

        heading_match = HEADING_RE.match(stripped)
        if heading_match:
            level = len(heading_match.group(1))
            title = heading_match.group(2).strip()
            heading_id = slugify(title)
            chunks.append(
                f"<h{level} id=\"{heading_id}\">{render_text_markup(title, source_rel, page_path, page_map)}</h{level}>"
            )
            index += 1
            continue

        if index + 1 < len(lines) and "|" in raw_line and "|" in lines[index + 1] and is_table_separator(lines[index + 1]):
            headers = split_pipe_row(raw_line)
            rows: list[list[str]] = []
            index += 2
            while index < len(lines):
                row_line = lines[index]
                if "|" not in row_line or not row_line.strip():
                    break
                rows.append(split_pipe_row(row_line))
                index += 1
            header_html = "".join(
                f"<th>{render_text_markup(cell, source_rel, page_path, page_map)}</th>"
                for cell in headers
            )
            body_rows = []
            for row in rows:
                cells = "".join(
                    f"<td>{render_text_markup(cell, source_rel, page_path, page_map)}</td>"
                    for cell in row
                )
                body_rows.append(f"<tr>{cells}</tr>")
            chunks.append(
                "<table><thead><tr>"
                + header_html
                + "</tr></thead><tbody>"
                + "".join(body_rows)
                + "</tbody></table>"
            )
            continue

        if stripped.startswith(">"):
            quote_lines: list[str] = []
            while index < len(lines) and lines[index].strip().startswith(">"):
                quote_lines.append(lines[index].strip()[1:].strip())
                index += 1
            quote_html = render_text_markup(" ".join(quote_lines), source_rel, page_path, page_map)
            chunks.append(f"<blockquote><p>{quote_html}</p></blockquote>")
            continue

        unordered_match = UNORDERED_RE.match(stripped)
        if unordered_match:
            items: list[str] = []
            while index < len(lines):
                current = lines[index].strip()
                match = UNORDERED_RE.match(current)
                if not match:
                    break
                item_parts = [match.group(1).strip()]
                index += 1
                while index < len(lines):
                    continuation = lines[index]
                    if not continuation.strip():
                        break
                    if HEADING_RE.match(continuation.strip()) or UNORDERED_RE.match(continuation.strip()) or ORDERED_RE.match(continuation.strip()) or FENCE_RE.match(continuation):
                        break
                    item_parts.append(continuation.strip())
                    index += 1
                items.append(" ".join(item_parts))
                if index < len(lines) and not lines[index].strip():
                    index += 1
                    break
            item_html = "".join(
                f"<li>{render_text_markup(item, source_rel, page_path, page_map)}</li>"
                for item in items
            )
            chunks.append(f"<ul>{item_html}</ul>")
            continue

        ordered_match = ORDERED_RE.match(stripped)
        if ordered_match:
            items = []
            while index < len(lines):
                current = lines[index].strip()
                match = ORDERED_RE.match(current)
                if not match:
                    break
                item_parts = [match.group(1).strip()]
                index += 1
                while index < len(lines):
                    continuation = lines[index]
                    if not continuation.strip():
                        break
                    if HEADING_RE.match(continuation.strip()) or UNORDERED_RE.match(continuation.strip()) or ORDERED_RE.match(continuation.strip()) or FENCE_RE.match(continuation):
                        break
                    item_parts.append(continuation.strip())
                    index += 1
                items.append(" ".join(item_parts))
                if index < len(lines) and not lines[index].strip():
                    index += 1
                    break
            item_html = "".join(
                f"<li>{render_text_markup(item, source_rel, page_path, page_map)}</li>"
                for item in items
            )
            chunks.append(f"<ol>{item_html}</ol>")
            continue

        paragraph_lines = [stripped]
        index += 1
        while index < len(lines):
            lookahead = lines[index]
            if not lookahead.strip():
                break
            if (
                HEADING_RE.match(lookahead.strip())
                or FENCE_RE.match(lookahead)
                or UNORDERED_RE.match(lookahead.strip())
                or ORDERED_RE.match(lookahead.strip())
                or lookahead.strip().startswith(">")
            ):
                break
            if index + 1 < len(lines) and "|" in lookahead and "|" in lines[index + 1] and is_table_separator(lines[index + 1]):
                break
            paragraph_lines.append(lookahead.strip())
            index += 1
        paragraph = " ".join(paragraph_lines)
        chunks.append(f"<p>{render_text_markup(paragraph, source_rel, page_path, page_map)}</p>")

    return "\n".join(chunks)


def render_artifact_gallery(page_path: Path, images: list[ArtifactImage]) -> str:
    if not images:
        return ""

    cards = []
    for artifact in images:
        image_href = relative_file_href(page_path, artifact.preview_path)
        raw_href = relative_file_href(page_path, REPO_ROOT / artifact.source_path)
        note = "Converted from PPM for browser preview." if artifact.converted else "Copied original artifact."
        cards.append(
            "<figure class=\"artifact-card\">"
            f"<a href=\"{html.escape(raw_href)}\">"
            f"<img src=\"{html.escape(image_href)}\" alt=\"{html.escape(artifact.source_path.as_posix())}\" loading=\"lazy\">"
            "</a>"
            "<figcaption>"
            f"<code>{html.escape(artifact.source_path.as_posix())}</code>"
            f"<span>{html.escape(note)}</span>"
            "</figcaption>"
            "</figure>"
        )

    return (
        "<section class=\"artifact-panel\">"
        "<header class=\"artifact-header\">"
        "<h2>Artifact Support</h2>"
        "<p>Resolved image references found in this note.</p>"
        "</header>"
        f"<div class=\"artifact-grid\">{''.join(cards)}</div>"
        "</section>"
    )


def source_last_updated(source_rel: Path) -> str:
    source_abs = REPO_ROOT / source_rel
    timestamp = datetime.fromtimestamp(source_abs.stat().st_mtime)
    return timestamp.strftime("%Y-%m-%d %H:%M")


def source_last_updated_dt(source_rel: Path) -> datetime:
    source_abs = REPO_ROOT / source_rel
    return datetime.fromtimestamp(source_abs.stat().st_mtime)


def build_sidebar(manifest: dict, page_map: dict[Path, Path], current_page: Path) -> str:
    sections_html: list[str] = []
    for section in manifest["sections"]:
        entries_html = []
        for entry in section["entries"]:
            rel = ensure_relative_repo_path(entry["path"])
            href = relative_file_href(current_page, page_map[rel])
            entries_html.append(
                f'<li><a href="{html.escape(href)}">{html.escape(entry.get("label", rel.stem))}</a></li>'
            )
        sections_html.append(
            "<section class=\"sidebar-group\">"
            f"<h3>{html.escape(section['title'])}</h3>"
            f"<ul>{''.join(entries_html)}</ul>"
            "</section>"
        )
    return "".join(sections_html)


def render_doc_page(
    manifest: dict,
    entry: DocEntry,
    source_text: str,
    page_path: Path,
    page_map: dict[Path, Path],
    site_title: str,
    output_dir: Path,
    images: list[ArtifactImage],
) -> str:
    title = first_heading(source_text, entry.label)
    last_updated = source_last_updated(entry.path)
    content_html = render_markdown(source_text, entry.path, page_path, page_map)
    gallery_html = render_artifact_gallery(page_path, images)
    gallery_block = f"{gallery_html}\n" if gallery_html else ""
    sidebar_html = build_sidebar(manifest, page_map, page_path)
    index_href = relative_file_href(page_path, output_dir / "index.html")
    raw_href = relative_file_href(page_path, REPO_ROOT / entry.path)
    section_href = f"{index_href}#{entry.section_id}"
    css_href = relative_file_href(page_path, output_dir / "assets" / "wiki.css")

    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{html.escape(title)} | {html.escape(site_title)}</title>
  <link rel="stylesheet" href="{html.escape(css_href)}">
</head>
<body>
  <header class="mobile-topbar">
    <a class="site-link mobile-site-link" href="{html.escape(index_href)}">{html.escape(site_title)}</a>
    <button class="sidebar-toggle" type="button" data-sidebar-toggle aria-controls="site-sidebar" aria-expanded="false">Browse</button>
  </header>
  <div class="sidebar-backdrop" data-sidebar-backdrop></div>
  <div class="layout">
    <aside class="sidebar" id="site-sidebar">
      <div class="sidebar-mobile-header">
        <span class="sidebar-mobile-title">Wiki Navigation</span>
        <button class="sidebar-close" type="button" data-sidebar-close aria-label="Close navigation">Close</button>
      </div>
      <a class="site-link" href="{html.escape(index_href)}">{html.escape(site_title)}</a>
      <p class="sidebar-note">Simple wiki-style index built from curated markdown sources.</p>
      {sidebar_html}
    </aside>
    <main class="content">
      <nav class="breadcrumbs">
        <a href="{html.escape(index_href)}">Index</a>
        <span>/</span>
        <a href="{html.escape(section_href)}">{html.escape(entry.section_title)}</a>
        <span>/</span>
        <span>{html.escape(entry.label)}</span>
      </nav>
      <header class="doc-header">
        <p class="eyebrow">{html.escape(entry.section_title)}</p>
        <h1>{html.escape(title)}</h1>
        <p class="doc-note">{html.escape(entry.note)}</p>
        <div class="doc-meta">
          <span>Source: <code>{html.escape(entry.path.as_posix())}</code></span>
          <span class="update-pill">Last updated {html.escape(last_updated)}</span>
          <a href="{html.escape(raw_href)}">Open Raw Markdown</a>
        </div>
      </header>
{gallery_block}      <article class="doc-body">
        {content_html}
      </article>
    </main>
  </div>
</body>
</html>
"""


def render_index_page(
    manifest: dict,
    entries: list[DocEntry],
    page_map: dict[Path, Path],
    output_dir: Path,
    source_cache: dict[Path, str],
    artifact_map: dict[Path, list[ArtifactImage]],
    markdown_bundle: dict[str, object] | None,
) -> str:
    entry_lookup = {entry.path: entry for entry in entries}
    sections_html: list[str] = []
    total_docs = len(entries)
    latest_articles: list[dict[str, object]] = []

    for section in manifest["sections"]:
        section_cards: list[dict[str, object]] = []
        for item in section["entries"]:
            rel = ensure_relative_repo_path(item["path"])
            entry = entry_lookup[rel]
            source_text = source_cache[entry.path]
            title = first_heading(source_text, entry.label)
            excerpt = first_excerpt(source_text, entry.note)
            last_updated_dt = source_last_updated_dt(entry.path)
            last_updated = last_updated_dt.strftime("%Y-%m-%d %H:%M")
            href = relative_file_href(output_dir / "index.html", page_map[rel])
            raw_href = relative_file_href(output_dir / "index.html", REPO_ROOT / rel)
            visuals = artifact_map.get(entry.path, [])
            visual_badge = (
                f"<p class=\"artifact-count\">{len(visuals)} visual artifact(s)</p>"
                if visuals
                else ""
            )
            search_blob = " ".join(
                [entry.section_title, entry.label, title, excerpt, entry.note, entry.path.as_posix()]
            ).lower()
            card_html = (
                "<article class=\"doc-card\""
                f" data-search=\"{html.escape(search_blob)}\">"
                f"<p class=\"eyebrow\">{html.escape(entry.section_title)}</p>"
                f"<h3><a href=\"{html.escape(href)}\">{html.escape(entry.label)}</a></h3>"
                f"<p class=\"doc-path\"><code>{html.escape(entry.path.as_posix())}</code></p>"
                f"<p class=\"doc-note\">{html.escape(entry.note)}</p>"
                f"<p class=\"last-updated\">Last updated {html.escape(last_updated)}</p>"
                f"{visual_badge}"
                f"<p class=\"doc-excerpt\">{html.escape(excerpt)}</p>"
                "<div class=\"doc-links\">"
                f"<a href=\"{html.escape(href)}\">Rendered Page</a>"
                f"<a href=\"{html.escape(raw_href)}\">Raw Markdown</a>"
                "</div>"
                "</article>"
            )

            section_cards.append(
                {
                    "entry": entry,
                    "label": entry.label,
                    "href": href,
                    "raw_href": raw_href,
                    "section_title": entry.section_title,
                    "last_updated": last_updated,
                    "last_updated_dt": last_updated_dt,
                    "card_html": card_html,
                }
            )
            latest_articles.append(section_cards[-1])

        if section["id"] == "attract-intro":
            section_cards.sort(
                key=lambda row: (-float(row["last_updated_dt"].timestamp()), str(row["label"]).lower()),
            )
            latest_items = "".join(
                "<li>"
                f"<a href=\"{html.escape(str(row['href']))}\">{html.escape(str(row['label']))}</a>"
                f"<span>Last updated {html.escape(str(row['last_updated']))}</span>"
                "<span class=\"latest-links\">"
                f"<a href=\"{html.escape(str(row['href']))}\">Rendered</a>"
                f"<a href=\"{html.escape(str(row['raw_href']))}\">Raw</a>"
                "</span>"
                "</li>"
                for row in section_cards
            )
            latest_html = (
                "<div class=\"latest-panel\">"
                "<p class=\"latest-label\">Latest</p>"
                "<ol class=\"latest-list\">"
                f"{latest_items}"
                "</ol>"
                "</div>"
            )
        else:
            latest_html = ""

        sections_html.append(
            f'<section id="{html.escape(section["id"])}" class="section-block">'
            f"<header class=\"section-header\">"
            f"<h2>{html.escape(section['title'])}</h2>"
            f"<p>{html.escape(section.get('description', ''))}</p>"
            f"</header>"
            f"{latest_html}"
            f"<div class=\"card-grid\">{''.join(str(row['card_html']) for row in section_cards)}</div>"
            "</section>"
        )

    nav_links = "".join(
        f'<li><a href="#{html.escape(section["id"])}">{html.escape(section["title"])}</a></li>'
        for section in manifest["sections"]
    )

    latest_articles.sort(
        key=lambda row: (-float(row["last_updated_dt"].timestamp()), str(row["label"]).lower()),
    )
    latest_articles_html = "".join(
        "<li>"
        f"<a href=\"{html.escape(str(row['href']))}\">{html.escape(str(row['label']))}</a>"
        f"<span>{html.escape(str(row['section_title']))}</span>"
        f"<span>Last updated {html.escape(str(row['last_updated']))}</span>"
        "<span class=\"latest-links\">"
        f"<a href=\"{html.escape(str(row['href']))}\">Rendered</a>"
        f"<a href=\"{html.escape(str(row['raw_href']))}\">Raw</a>"
        "</span>"
        "</li>"
        for row in latest_articles[:10]
    )

    markdown_bundle_html = ""
    if markdown_bundle is not None:
        bundle_readme_href = relative_file_href(
            output_dir / "index.html",
            Path(str(markdown_bundle["readme_md"])),
        )
        bundle_index_href = relative_file_href(
            output_dir / "index.html",
            Path(str(markdown_bundle["index_md"])),
        )
        bundle_combined_href = relative_file_href(
            output_dir / "index.html",
            Path(str(markdown_bundle["combined_md"])),
        )
        markdown_bundle_html = (
            "<section class=\"bundle-panel\">"
            "<p class=\"latest-label\">NotebookLM Bundle</p>"
            "<p class=\"bundle-copy\">"
            "Curated markdown export kept in sync with the wiki manifest for offline review and NotebookLM ingestion."
            "</p>"
            f"<p class=\"bundle-meta\">{int(markdown_bundle['doc_count'])} markdown files mirrored from the current wiki manifest.</p>"
            "<div class=\"bundle-links\">"
            f"<a href=\"{html.escape(bundle_readme_href)}\">Bundle README</a>"
            f"<a href=\"{html.escape(bundle_index_href)}\">Bundle Index</a>"
            f"<a href=\"{html.escape(bundle_combined_href)}\">Combined Markdown</a>"
            "</div>"
            "</section>"
        )

    generated_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{html.escape(manifest['site_title'])}</title>
  <link rel="stylesheet" href="assets/wiki.css">
  <script defer src="assets/wiki.js"></script>
</head>
<body>
  <header class="mobile-topbar">
    <a class="site-link mobile-site-link" href="index.html">{html.escape(manifest['site_title'])}</a>
    <button class="sidebar-toggle" type="button" data-sidebar-toggle aria-controls="site-sidebar" aria-expanded="false">Browse</button>
  </header>
  <div class="sidebar-backdrop" data-sidebar-backdrop></div>
  <div class="layout">
    <aside class="sidebar" id="site-sidebar">
      <div class="sidebar-mobile-header">
        <span class="sidebar-mobile-title">Wiki Navigation</span>
        <button class="sidebar-close" type="button" data-sidebar-close aria-label="Close navigation">Close</button>
      </div>
      <a class="site-link" href="index.html">{html.escape(manifest['site_title'])}</a>
      <p class="sidebar-note">{html.escape(manifest.get('tagline', ''))}</p>
      <section class="sidebar-group">
        <h3>Sections</h3>
        <ul>{nav_links}</ul>
      </section>
      <section class="sidebar-group">
        <h3>Surface Rules</h3>
        <ul>
          <li>Front-end and menu notes are isolated from gameplay.</li>
          <li>Attract and intro notes stay separate from both.</li>
          <li>Use Source Of Truth docs before trusting downstream summaries.</li>
        </ul>
      </section>
    </aside>
    <main class="content">
      <header class="hero">
        <p class="eyebrow">Curated Repo View</p>
        <h1>{html.escape(manifest['site_title'])}</h1>
        <p class="hero-copy">{html.escape(manifest.get('tagline', ''))}</p>
        <div class="hero-meta">
          <span>{total_docs} indexed docs</span>
          <span>Generated {html.escape(generated_at)}</span>
        </div>
        <label class="search-box">
          <span>Filter docs</span>
          <input id="doc-filter" type="search" placeholder="Search by lane, surface, file, or topic">
        </label>
        {markdown_bundle_html}
      </header>
      <section class="section-block latest-articles-block">
        <header class="section-header">
          <h2>Latest Articles</h2>
          <p>Most recently updated docs across the whole wiki, shown first for quick orientation.</p>
        </header>
        <div class="latest-panel">
          <ol class="latest-list latest-list-wide">
            {latest_articles_html}
          </ol>
        </div>
      </section>
      {''.join(sections_html)}
    </main>
  </div>
</body>
</html>
"""


CSS_TEXT = """
:root {
  color-scheme: light;
  --bg: #ffffff;
  --panel: #ffffff;
  --panel-border: #d7e0ea;
  --ink: #15202b;
  --muted: #526171;
  --accent: #0b5cad;
  --accent-soft: #eaf3ff;
  --code-bg: #f4f8fb;
  --code-ink: #10212f;
  --shadow: 0 10px 30px rgba(15, 23, 42, 0.06);
  --font-sans: "Georgia", "Times New Roman", serif;
  --font-mono: "SFMono-Regular", "Consolas", monospace;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  background: var(--bg);
  color: var(--ink);
  font-family: var(--font-sans);
  line-height: 1.55;
  overflow-wrap: anywhere;
}

a {
  color: var(--accent);
  text-decoration-thickness: 1px;
  text-underline-offset: 0.12em;
}

a:hover {
  color: #084784;
}

code,
pre {
  font-family: var(--font-mono);
}

code {
  background: var(--code-bg);
  border-radius: 4px;
  border: 1px solid #dbe6ef;
  color: var(--code-ink);
  padding: 0.1rem 0.35rem;
}

pre {
  overflow-x: auto;
  background: #ffffff;
  color: var(--code-ink);
  border: 1px solid #dbe6ef;
  padding: 1rem;
  border-radius: 10px;
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.7);
}

pre code {
  background: transparent;
  border: 0;
  color: inherit;
  padding: 0;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin: 1.25rem 0;
  font-size: 0.96rem;
}

th,
td {
  border: 1px solid var(--panel-border);
  padding: 0.55rem 0.7rem;
  text-align: left;
  vertical-align: top;
}

th {
  background: var(--accent-soft);
  color: var(--ink);
}

blockquote {
  margin: 1.25rem 0;
  padding: 0.2rem 1rem;
  border-left: 4px solid var(--accent);
  background: #f5f9ff;
}

.layout {
  display: grid;
  grid-template-columns: 300px minmax(0, 1fr);
  min-height: 100vh;
}

.mobile-topbar,
.sidebar-mobile-header,
.sidebar-toggle,
.sidebar-close,
.sidebar-backdrop {
  display: none;
}

.sidebar {
  position: sticky;
  top: 0;
  align-self: start;
  height: 100vh;
  overflow-y: auto;
  padding: 1.5rem 1.25rem;
  border-right: 1px solid var(--panel-border);
  background: rgba(255, 255, 255, 0.96);
  backdrop-filter: blur(10px);
}

.site-link {
  display: inline-block;
  margin-bottom: 0.6rem;
  color: var(--ink);
  font-size: 1.35rem;
  font-weight: 700;
  text-decoration: none;
}

.sidebar-note {
  margin: 0 0 1.2rem;
  color: var(--muted);
  font-size: 0.98rem;
}

.sidebar-group + .sidebar-group {
  margin-top: 1.25rem;
}

.sidebar-group h3 {
  margin: 0 0 0.55rem;
  font-size: 0.92rem;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  color: var(--muted);
}

.sidebar-group ul {
  margin: 0;
  padding-left: 1rem;
}

.sidebar-group li + li {
  margin-top: 0.35rem;
}

.content {
  min-width: 0;
  padding: 2rem;
}

.hero,
.section-block,
.artifact-panel,
.doc-header,
.doc-body {
  background: var(--panel);
  border: 1px solid var(--panel-border);
  border-radius: 18px;
  box-shadow: var(--shadow);
}

.hero,
.doc-header {
  padding: 1.5rem 1.6rem;
}

.section-block,
.doc-body {
  padding: 1.3rem 1.4rem;
}

.section-block + .section-block,
.artifact-panel + .doc-body,
.doc-header + .doc-body {
  margin-top: 1.2rem;
}

.eyebrow {
  margin: 0 0 0.4rem;
  color: var(--muted);
  letter-spacing: 0.06em;
  text-transform: uppercase;
  font-size: 0.82rem;
}

.hero h1,
.doc-header h1,
.section-header h2 {
  margin: 0;
}

.hero-copy,
.doc-note,
.section-header p {
  color: var(--muted);
}

.hero-meta,
.doc-meta,
.doc-links,
.breadcrumbs {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  align-items: center;
}

.hero-meta,
.doc-meta {
  margin-top: 0.9rem;
  color: var(--muted);
  font-size: 0.92rem;
}

.search-box {
  display: block;
  margin-top: 1.1rem;
}

.search-box span {
  display: block;
  margin-bottom: 0.35rem;
  color: var(--muted);
  font-size: 0.92rem;
}

.search-box input {
  width: 100%;
  border: 1px solid var(--panel-border);
  border-radius: 12px;
  padding: 0.85rem 1rem;
  font: inherit;
  background: #fff;
}

.bundle-panel {
  margin-top: 1rem;
  padding: 1rem 1.05rem;
  border: 1px solid var(--panel-border);
  border-radius: 14px;
  background: #fbfdff;
}

.bundle-copy,
.bundle-meta {
  margin: 0.45rem 0 0;
  color: var(--muted);
}

.bundle-links {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  margin-top: 0.85rem;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 1rem;
}

.latest-panel {
  margin: 1rem 0 1.2rem;
  padding: 1rem 1.1rem;
  border: 1px solid var(--panel-border);
  border-radius: 14px;
  background: #fbfdff;
}

.latest-label {
  margin: 0 0 0.65rem;
  color: var(--accent);
  letter-spacing: 0.06em;
  text-transform: uppercase;
  font-size: 0.8rem;
  font-weight: 700;
}

.latest-list {
  margin: 0;
  padding-left: 1.2rem;
}

.latest-list li + li {
  margin-top: 0.45rem;
}

.latest-list li span {
  display: inline-block;
  margin-left: 0.55rem;
  color: var(--muted);
  font-size: 0.88rem;
}

.latest-links {
  display: inline-flex;
  gap: 0.5rem;
  margin-left: 0.75rem;
}

.latest-links a {
  font-size: 0.88rem;
}

.latest-list-wide li {
  display: flex;
  flex-wrap: wrap;
  align-items: baseline;
  gap: 0.4rem;
}

.doc-card {
  padding: 1rem;
  border: 1px solid var(--panel-border);
  border-radius: 14px;
  background: #ffffff;
}

.doc-card h3 {
  margin: 0;
  font-size: 1.12rem;
}

.doc-card .doc-path,
.doc-card .doc-note,
.doc-card .artifact-count,
.doc-card .doc-excerpt {
  margin: 0.55rem 0 0;
}

.artifact-count {
  color: var(--accent);
  font-size: 0.88rem;
}

.last-updated {
  margin: 0.55rem 0 0;
  color: var(--muted);
  font-size: 0.86rem;
}

.update-pill {
  display: inline-flex;
  align-items: center;
  gap: 0.3rem;
  padding: 0.25rem 0.55rem;
  border-radius: 999px;
  background: var(--accent-soft);
  border: 1px solid #cfe0f5;
  color: var(--accent);
  font-size: 0.84rem;
  white-space: nowrap;
}

.doc-card .doc-links {
  margin-top: 0.85rem;
}

.breadcrumbs {
  margin-bottom: 1rem;
  color: var(--muted);
  font-size: 0.92rem;
}

.doc-body h2,
.doc-body h3,
.doc-body h4 {
  margin-top: 1.5rem;
}

.artifact-panel {
  padding: 1.2rem 1.4rem;
  margin-top: 1.2rem;
}

.artifact-header h2 {
  margin: 0;
}

.artifact-header p {
  margin: 0.35rem 0 0;
  color: var(--muted);
}

.artifact-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1rem;
  margin-top: 1rem;
}

.artifact-card {
  margin: 0;
  border: 1px solid var(--panel-border);
  border-radius: 12px;
  overflow: hidden;
  background: #ffffff;
}

.artifact-card a {
  display: block;
  background: #f7fbff;
}

.artifact-card img {
  display: block;
  width: 100%;
  height: auto;
}

.artifact-card figcaption {
  display: grid;
  gap: 0.45rem;
  padding: 0.75rem 0.8rem 0.9rem;
  color: var(--muted);
  font-size: 0.85rem;
}

.doc-body ul,
.doc-body ol {
  padding-left: 1.3rem;
}

.doc-body img,
.content img {
  max-width: 100%;
  height: auto;
}

.doc-body,
.doc-card,
.artifact-card,
.hero,
.section-block,
.doc-header {
  min-width: 0;
}

.doc-body p,
.doc-body li,
.doc-body td,
.doc-body th,
.doc-note,
.doc-excerpt,
.doc-path code,
.doc-meta code {
  overflow-wrap: anywhere;
}

@media (max-width: 980px) {
  .mobile-topbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 0.8rem;
    position: sticky;
    top: 0;
    z-index: 60;
    padding: 0.9rem 1rem;
    border-bottom: 1px solid var(--panel-border);
    background: rgba(255, 255, 255, 0.98);
    backdrop-filter: blur(10px);
  }

  .mobile-site-link {
    margin-bottom: 0;
    font-size: 1.1rem;
  }

  .sidebar-toggle,
  .sidebar-close {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    border: 1px solid var(--panel-border);
    border-radius: 999px;
    padding: 0.55rem 0.9rem;
    background: #fff;
    color: var(--ink);
    font: inherit;
    cursor: pointer;
  }

  .sidebar-backdrop {
    display: block;
    position: fixed;
    inset: 0;
    z-index: 45;
    background: rgba(15, 23, 42, 0.28);
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.2s ease;
  }

  body.sidebar-open .sidebar-backdrop {
    opacity: 1;
    pointer-events: auto;
  }

  body.sidebar-open {
    overflow: hidden;
  }

  .layout {
    grid-template-columns: 1fr;
    min-height: auto;
  }

  .sidebar {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    z-index: 50;
    width: min(88vw, 360px);
    height: auto;
    border-right: 0;
    border-left: 1px solid var(--panel-border);
    transform: translateX(100%);
    transition: transform 0.2s ease;
    box-shadow: 0 14px 40px rgba(15, 23, 42, 0.18);
    padding: 1rem;
  }

  body.sidebar-open .sidebar {
    transform: translateX(0);
  }

  .sidebar-mobile-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 0.75rem;
    margin-bottom: 0.8rem;
  }

  .sidebar-mobile-title {
    font-size: 0.95rem;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    color: var(--muted);
  }

  .content {
    padding: 0.85rem;
  }

  .hero,
  .doc-header {
    padding: 1.15rem 1rem;
  }

  .section-block,
  .artifact-panel,
  .doc-body {
    padding: 1rem 0.95rem;
  }

  .hero-meta,
  .doc-meta,
  .doc-links,
  .breadcrumbs,
  .bundle-links {
    gap: 0.5rem;
  }

  .breadcrumbs,
  .doc-meta {
    font-size: 0.88rem;
  }

  .card-grid,
  .artifact-grid {
    grid-template-columns: 1fr;
  }

  .latest-list {
    padding-left: 1rem;
  }

  .latest-list li span {
    display: block;
    margin-left: 0;
    margin-top: 0.15rem;
  }

  .latest-links {
    margin-left: 0;
    display: flex;
    flex-wrap: wrap;
  }

  pre {
    padding: 0.85rem;
    font-size: 0.82rem;
  }

  .doc-body table {
    display: block;
    overflow-x: auto;
    white-space: nowrap;
    -webkit-overflow-scrolling: touch;
  }

  th,
  td {
    min-width: 140px;
  }
}
"""


JS_TEXT = """
document.addEventListener("DOMContentLoaded", () => {
  const body = document.body;
  const toggleButtons = Array.from(document.querySelectorAll("[data-sidebar-toggle]"));
  const closeButtons = Array.from(document.querySelectorAll("[data-sidebar-close]"));
  const backdrop = document.querySelector("[data-sidebar-backdrop]");
  const setSidebarOpen = (open) => {
    body.classList.toggle("sidebar-open", open);
    for (const button of toggleButtons) {
      button.setAttribute("aria-expanded", open ? "true" : "false");
    }
  };
  for (const button of toggleButtons) {
    button.addEventListener("click", () => {
      setSidebarOpen(!body.classList.contains("sidebar-open"));
    });
  }
  for (const button of closeButtons) {
    button.addEventListener("click", () => setSidebarOpen(false));
  }
  if (backdrop) {
    backdrop.addEventListener("click", () => setSidebarOpen(false));
  }
  window.addEventListener("resize", () => {
    if (window.innerWidth > 980 && body.classList.contains("sidebar-open")) {
      setSidebarOpen(false);
    }
  });
  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && body.classList.contains("sidebar-open")) {
      setSidebarOpen(false);
    }
  });
  const input = document.getElementById("doc-filter");
  if (!input) {
    return;
  }
  const cards = Array.from(document.querySelectorAll(".doc-card"));
  input.addEventListener("input", () => {
    const needle = input.value.trim().toLowerCase();
    for (const card of cards) {
      const haystack = card.getAttribute("data-search") || "";
      const show = !needle || haystack.includes(needle);
      card.style.display = show ? "" : "none";
    }
  });
});
"""


def write_assets(output_dir: Path) -> None:
    assets_dir = output_dir / "assets"
    assets_dir.mkdir(parents=True, exist_ok=True)
    (assets_dir / "wiki.css").write_text(CSS_TEXT.strip() + "\n", encoding="utf-8")
    (assets_dir / "wiki.js").write_text(JS_TEXT.strip() + "\n", encoding="utf-8")


def join_markdown_lines(lines: list[str]) -> str:
    trimmed = list(lines)
    while trimmed and trimmed[-1] == "":
        trimmed.pop()
    return "\n".join(trimmed) + "\n"


def build_markdown_bundle(
    manifest: dict,
    entries: list[DocEntry],
    bundle_dir: Path,
    source_cache: dict[Path, str],
    manifest_path: Path,
) -> dict[str, object]:
    if bundle_dir.exists():
        for child in bundle_dir.iterdir():
            if child.is_dir():
                shutil.rmtree(child)
            else:
                child.unlink()
    bundle_dir.mkdir(parents=True, exist_ok=True)
    sources_dir = bundle_dir / "sources"
    sources_dir.mkdir(parents=True, exist_ok=True)

    generated_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    manifest_snapshot_path = bundle_dir / "wiki_manifest_snapshot.json"
    manifest_snapshot_path.write_text(
        json.dumps(manifest, indent=2, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )

    section_rows: dict[str, list[dict[str, str]]] = {}
    index_rows: list[dict[str, str]] = []
    combined_parts = [
        "# TD2 Wiki Markdown Bundle",
        "",
        f"- Generated: `{generated_at}`",
        f"- Manifest: `{manifest_path.relative_to(REPO_ROOT).as_posix()}`",
        f"- Total docs: `{len(entries)}`",
        "",
        "Use `wiki_bundle_index.md` for the curated file list or `wiki_combined.md` for a single-file ingest path.",
        "",
    ]

    for entry in entries:
        source_text = source_cache[entry.path]
        dest_rel = Path("sources") / entry.path
        dest_path = bundle_dir / dest_rel
        dest_path.parent.mkdir(parents=True, exist_ok=True)
        dest_path.write_text(source_text, encoding="utf-8")
        last_updated = source_last_updated(entry.path)
        row = {
            "section_id": entry.section_id,
            "section_title": entry.section_title,
            "label": entry.label,
            "note": entry.note,
            "source": entry.path.as_posix(),
            "bundle_copy": dest_rel.as_posix(),
            "last_updated": last_updated,
        }
        index_rows.append(row)
        section_rows.setdefault(entry.section_id, []).append(row)
        combined_parts.extend(
            [
                f"## {entry.section_title} :: {entry.label}",
                "",
                f"- Source: `{entry.path.as_posix()}`",
                f"- Bundle copy: `{dest_rel.as_posix()}`",
                f"- Last updated: `{last_updated}`",
                f"- Note: {entry.note}",
                "",
                "---",
                "",
                source_text.rstrip(),
                "",
                "",
            ]
        )

    index_lines = [
        "# TD2 Wiki Markdown Bundle",
        "",
        f"Generated: `{generated_at}`",
        "",
        "This folder mirrors the markdown files curated by the HTML wiki so they can be reviewed or ingested outside the browser surface.",
        "",
        "## Included Sections",
        "",
    ]
    for section in manifest["sections"]:
        index_lines.append(f"### {section['title']}")
        index_lines.append("")
        for row in section_rows.get(section["id"], []):
            index_lines.append(
                f"- `{row['bundle_copy']}` | source `{row['source']}` | updated `{row['last_updated']}`"
            )
            if row["note"]:
                index_lines.append(f"  note: {row['note']}")
        index_lines.append("")

    readme_lines = [
        "# NotebookLM Bundle",
        "",
        "Use this folder when you want the same curated markdown corpus from the wiki without the HTML wrapper.",
        "",
        "Recommended entry points:",
        "",
        "- `wiki_bundle_index.md`: sectioned file inventory with source paths and timestamps.",
        "- `wiki_combined.md`: one-file combined export of the current curated corpus.",
        "- `sources/`: original markdown files copied with repo-relative paths preserved.",
        "",
    ]

    bundle_index_json = {
        "generated_at": generated_at,
        "doc_count": len(entries),
        "manifest": manifest_path.relative_to(REPO_ROOT).as_posix(),
        "docs": index_rows,
    }

    (bundle_dir / "README.md").write_text(join_markdown_lines(readme_lines), encoding="utf-8")
    (bundle_dir / "wiki_bundle_index.md").write_text(
        join_markdown_lines(index_lines), encoding="utf-8"
    )
    (bundle_dir / "wiki_combined.md").write_text(
        join_markdown_lines(combined_parts), encoding="utf-8"
    )
    (bundle_dir / "wiki_bundle_index.json").write_text(
        json.dumps(bundle_index_json, indent=2, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )

    return {
        "root": bundle_dir,
        "readme_md": bundle_dir / "README.md",
        "index_md": bundle_dir / "wiki_bundle_index.md",
        "combined_md": bundle_dir / "wiki_combined.md",
        "index_json": bundle_dir / "wiki_bundle_index.json",
        "manifest_snapshot": manifest_snapshot_path,
        "doc_count": len(entries),
    }


def build_site(
    manifest: dict,
    entries: list[DocEntry],
    output_dir: Path,
    markdown_bundle_dir: Path,
    manifest_path: Path,
) -> None:
    page_map = {entry.path: page_output_path(output_dir, entry.path) for entry in entries}
    source_cache: dict[Path, str] = {}
    artifact_map: dict[Path, list[ArtifactImage]] = {}
    artifact_cache: dict[Path, ArtifactImage] = {}
    write_assets(output_dir)

    for entry in entries:
        source_text = (REPO_ROOT / entry.path).read_text(encoding="utf-8")
        source_cache[entry.path] = source_text
        image_refs = collect_image_artifacts(source_text, entry.path)
        artifact_map[entry.path] = [
            prepare_artifact_image(image_ref, output_dir, artifact_cache)
            for image_ref in image_refs
        ]
        page_path = page_map[entry.path]
        page_path.parent.mkdir(parents=True, exist_ok=True)
        page_html = render_doc_page(
            manifest=manifest,
            entry=entry,
            source_text=source_text,
            page_path=page_path,
            page_map=page_map,
            site_title=manifest["site_title"],
            output_dir=output_dir,
            images=artifact_map[entry.path],
        )
        page_path.write_text(page_html, encoding="utf-8")

    markdown_bundle = build_markdown_bundle(
        manifest,
        entries,
        markdown_bundle_dir,
        source_cache,
        manifest_path,
    )
    index_html = render_index_page(
        manifest,
        entries,
        page_map,
        output_dir,
        source_cache,
        artifact_map,
        markdown_bundle,
    )
    (output_dir / "index.html").write_text(index_html, encoding="utf-8")

    site_index = {
        "site_title": manifest["site_title"],
        "generated_pages": [
            {
                "source": entry.path.as_posix(),
                "label": entry.label,
                "section": entry.section_title,
                "last_updated": source_last_updated(entry.path),
                "page": relative_file_href(output_dir / "index.html", page_map[entry.path]),
            }
            for entry in entries
        ],
        "markdown_bundle": {
            "directory": repo_rel(markdown_bundle_dir),
            "readme": relative_file_href(output_dir / "index.html", Path(str(markdown_bundle["readme_md"]))),
            "index_markdown": relative_file_href(output_dir / "index.html", Path(str(markdown_bundle["index_md"]))),
            "combined_markdown": relative_file_href(output_dir / "index.html", Path(str(markdown_bundle["combined_md"]))),
            "index_json": relative_file_href(output_dir / "index.html", Path(str(markdown_bundle["index_json"]))),
            "doc_count": int(markdown_bundle["doc_count"]),
        },
    }
    (output_dir / "site_index.json").write_text(
        json.dumps(site_index, indent=2, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )


def main() -> None:
    args = parse_args()
    manifest_path = args.manifest.resolve()
    output_dir = args.output_dir.resolve()
    markdown_bundle_dir = args.markdown_bundle_dir.resolve()

    manifest, entries = read_manifest(manifest_path)
    build_site(manifest, entries, output_dir, markdown_bundle_dir, manifest_path)
    print(
        f"Generated wiki with {len(entries)} pages at {output_dir} "
        f"and markdown bundle at {markdown_bundle_dir}"
    )


if __name__ == "__main__":
    main()
