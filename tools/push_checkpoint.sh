#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REMOTE="${1:-origin}"
BRANCH="${2:-master}"
BASE_SHA="$(git -C "$REPO_DIR" rev-parse HEAD)"
BASE_SHORT="$(git -C "$REPO_DIR" rev-parse --short "$BASE_SHA")"
CURRENT_BRANCH="$(git -C "$REPO_DIR" branch --show-current || true)"
TMP_WORKTREE=""

cleanup() {
    if [ -n "$TMP_WORKTREE" ] && [ -d "$TMP_WORKTREE" ]; then
        git -C "$REPO_DIR" worktree remove --force "$TMP_WORKTREE" >/dev/null 2>&1 || rm -rf "$TMP_WORKTREE"
    fi
}

refresh_local_wiki() {
    local wiki_sha="$1"

    git -C "$REPO_DIR" update-ref "refs/heads/$BRANCH" "$wiki_sha" "$BASE_SHA"
    git -C "$REPO_DIR" restore --source="$wiki_sha" --staged --worktree -- \
        tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle >/dev/null 2>&1 || true
    git -C "$REPO_DIR" clean -fd -- \
        tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle >/dev/null 2>&1 || true
}

trap cleanup EXIT

echo "[push-checkpoint] pushing $BASE_SHA to $REMOTE/$BRANCH"
git -C "$REPO_DIR" push "$REMOTE" "$BRANCH"

TMP_WORKTREE="$(mktemp -d "${TMPDIR:-/tmp}/td2-wiki-refresh.XXXXXX")"
rm -rf "$TMP_WORKTREE"
git -C "$REPO_DIR" worktree add --detach "$TMP_WORKTREE" "$BASE_SHA" >/dev/null

echo "[push-checkpoint] refreshing curated docs wiki in isolated worktree"
python3 "$TMP_WORKTREE/tools/build_docs_wiki_report.py" \
    --manifest "$TMP_WORKTREE/rom_analysis/docs/wiki_doc_index.json" \
    --output-dir "$TMP_WORKTREE/tools/out/docs_wiki" \
    --markdown-bundle-dir "$TMP_WORKTREE/tools/out/docs_wiki_markdown_bundle"

if git -C "$TMP_WORKTREE" diff --quiet -- tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle; then
    echo "[push-checkpoint] wiki already up to date after $BASE_SHORT"
    exit 0
fi

echo "[push-checkpoint] wiki changed; creating follow-up refresh commit"
git -C "$TMP_WORKTREE" add -A -f -- tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle

if git -C "$TMP_WORKTREE" diff --cached --quiet -- tools/out/docs_wiki tools/out/docs_wiki_markdown_bundle; then
    echo "[push-checkpoint] wiki refresh produced no staged changes"
    exit 0
fi

git -C "$TMP_WORKTREE" commit -m "docs: refresh wiki after $BASE_SHORT"
echo "[push-checkpoint] pushing wiki refresh commit"
git -C "$TMP_WORKTREE" push "$REMOTE" "HEAD:$BRANCH"

WIKI_SHA="$(git -C "$TMP_WORKTREE" rev-parse HEAD)"
if [ "$CURRENT_BRANCH" = "$BRANCH" ] && [ "$(git -C "$REPO_DIR" rev-parse HEAD)" = "$BASE_SHA" ]; then
    refresh_local_wiki "$WIKI_SHA"
    echo "[push-checkpoint] advanced local $BRANCH to $WIKI_SHA and cleaned local wiki outputs"
else
    echo "[push-checkpoint] pushed wiki refresh as $WIKI_SHA; local branch not auto-advanced"
fi
