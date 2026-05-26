#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <repo-url>"
  echo "Example: $0 git@github.com:dagadada/homepage.git"
  exit 1
fi

REPO_URL="$1"

if [ ! -d .git ]; then
  git init -b main
fi

if ! git rev-parse --verify main >/dev/null 2>&1; then
  git checkout -b main
fi

git add .

if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "chore: prepare homepage for GitHub Pages"
fi

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

git push -u origin main

echo "Push complete. Next: enable Pages in GitHub settings and configure DNS."
