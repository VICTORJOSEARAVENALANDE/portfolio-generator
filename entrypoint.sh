#!/usr/bin/env bash
set -e
echo "==================="
git config --global user.name  "${INPUT_NAME}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

if ! git diff --quiet -- portfolio.xml; then
  git add portfolio.xml
  git commit -m "chore: update portfolio feed"
  git push "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" HEAD:main
fi
echo "==================="
