#!/usr/bin/env bash
set -e
echo "==================="
# Git setup
git config --global user.name  "${INPUT_NAME}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run generator
python3 /github/workspace/feed.py

# Commit & push only if portfolio.xml changed
if ! git diff --quiet -- portfolio.xml; then
  git add portfolio.xml
  git commit -m "chore: update portfolio feed"
  git push "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" HEAD:main
fi
echo "==================="
