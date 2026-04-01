#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REMOTE="${1:-origin}"
BRANCH="${2:-master}"
BASE_SHA="$(git -C "$REPO_DIR" rev-parse HEAD)"
BASE_SHORT="$(git -C "$REPO_DIR" rev-parse --short "$BASE_SHA")"

echo "[push-checkpoint] pushing $BASE_SHA to $REMOTE/$BRANCH"
git -C "$REPO_DIR" push "$REMOTE" "$BRANCH"

echo "[push-checkpoint] refreshing curated docs wiki"
python3 "$REPO_DIR/tools/build_docs_wiki_report.py" \
    --manifest "$REPO_DIR/rom_analysis/docs/wiki_doc_index.json" \
    --output-dir "$REPO_DIR/tools/out/docs_wiki" \
    --markdown-bundle-dir "$REPO_DIR/tools/out/docs_wiki_markdown_bundle"

if git -C "$REPO_DIR" diff --quiet -- tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle; then
    echo "[push-checkpoint] wiki already up to date after $BASE_SHORT"
    exit 0
fi

NON_WIKI_DIRTY="$(
    git -C "$REPO_DIR" status --porcelain=v1 --untracked-files=all | \
    awk '
        {
            path = substr($0, 4)
            if (path !~ /^tools\/out\/docs_wiki(\/|$)/ &&
                path !~ /^tools\/out\/docs_wiki_markdown_bundle(\/|$)/) {
                print $0
            }
        }
    '
)"

if [ -n "$NON_WIKI_DIRTY" ]; then
    echo "[push-checkpoint] wiki changed, but other worktree files are dirty; skipping auto-commit"
    printf '%s\n' "$NON_WIKI_DIRTY"
    exit 0
fi

echo "[push-checkpoint] wiki changed; creating follow-up refresh commit"
git -C "$REPO_DIR" add -A -f -- tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle

if git -C "$REPO_DIR" diff --cached --quiet -- tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle; then
    echo "[push-checkpoint] wiki refresh produced no staged changes"
    exit 0
fi

git -C "$REPO_DIR" commit -m "docs: refresh wiki after $BASE_SHORT"
echo "[push-checkpoint] pushing wiki refresh commit"
git -C "$REPO_DIR" push "$REMOTE" "$BRANCH"
