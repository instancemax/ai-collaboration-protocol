#!/usr/bin/env bash
#
# collect-status.sh — 匯整各專案 repo 的當前狀態，產生 command-center/STATUS_BRIEF.md。
#
# 用途：指揮中心無法「伸手進」各 repo，這支腳本反過來把各 repo 的
#       open PRs / open issues / 最新 commit 拉進來，集中成一份摘要。
#
# 在 GitHub Actions 裡跑：
#   由 .github/workflows/collect-status.yml 排程觸發，需要 STATUS_TOKEN secret。
#
# 在本機跑：
#   1. 安裝 gh CLI 並登入（gh auth login），或設定 GH_TOKEN 環境變數。
#   2. 在 repo 根目錄執行：bash command-center/scripts/collect-status.sh
#
# Token 權限需求：能 read 清單中所有 repo 的 contents / PRs / issues。
#   私人 repo（如 hq）需要 classic PAT 的 `repo` scope，
#   或 fine-grained PAT 對應 repo 的 Contents/Pull requests/Issues 唯讀權限。

set -euo pipefail

REPOS_FILE="command-center/repos.txt"
OUT="command-center/STATUS_BRIEF.md"

if [[ ! -f "$REPOS_FILE" ]]; then
  echo "找不到 $REPOS_FILE" >&2
  exit 1
fi

{
  echo "# Status Brief（自動產生）"
  echo
  echo "> 這份檔案由 \`command-center/scripts/collect-status.sh\` 自動產生，**請勿手動編輯**。"
  echo "> 要改格式請改腳本；要改掃描範圍請改 \`command-center/repos.txt\`。"
  echo "> 最後更新：$(date -u '+%Y-%m-%d %H:%M UTC')"
  echo
  echo "---"
  echo
} > "$OUT"

while IFS= read -r line || [[ -n "$line" ]]; do
  repo="${line%%#*}"                       # 去掉行內註解
  repo="$(echo "$repo" | tr -d '[:space:]')"
  [[ -z "$repo" ]] && continue

  echo "## $repo" >> "$OUT"
  echo >> "$OUT"

  if ! gh repo view "$repo" >/dev/null 2>&1; then
    echo "_無法存取（repo 不存在，或 token 無權限）_" >> "$OUT"
    echo >> "$OUT"
    continue
  fi

  prs="$(gh pr list --repo "$repo" --state open \
          --json number,title,author \
          --jq '.[] | "- #\(.number) \(.title) (@\(.author.login))"' 2>/dev/null || true)"
  echo "**Open PRs:**" >> "$OUT"
  [[ -n "$prs" ]] && echo "$prs" >> "$OUT" || echo "- 無" >> "$OUT"
  echo >> "$OUT"

  issues="$(gh issue list --repo "$repo" --state open \
            --json number,title \
            --jq '.[] | "- #\(.number) \(.title)"' 2>/dev/null || true)"
  echo "**Open Issues:**" >> "$OUT"
  [[ -n "$issues" ]] && echo "$issues" >> "$OUT" || echo "- 無" >> "$OUT"
  echo >> "$OUT"

  commit="$(gh api "repos/$repo/commits?per_page=1" \
            --jq '.[0] | "\(.sha[0:7]) \(.commit.message | split("\n")[0]) — \(.commit.author.date[0:10])"' 2>/dev/null || true)"
  echo "**Latest commit:** ${commit:-無}" >> "$OUT"
  echo >> "$OUT"
done < "$REPOS_FILE"

echo "已寫入 $OUT"
