#!/usr/bin/env bash
# SMARTY — GitHub Pages Publish Script
# Pushes all assets to main branch for GitHub Pages serving.

set -euo pipefail

REPO_URL="git@github.com:REMgm/SMARTY.git"
BRANCH="main"

echo "=== SMARTY GitHub Pages Publisher ==="

# Check if git is initialized
if [[ ! -d ".git" ]]; then
  echo "Initializing git repo..."
  git init
  git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"
fi

# Ensure we're on main
git checkout -B "$BRANCH"

# Stage all assets (excluding secrets and scripts with tokens)
git add \
  architecture.md \
  architecture.html \
  index.html \
  vercel.json \
  README.md \
  AR0A_OnePager.txt \
  AR0A_Intake_Form.txt \
  AR0A_GoogleDocs_Outline.txt \
  memory/pins.md \
  memory/strategy/monks4.0_v1.md \
  logo.jpg 2>/dev/null || true

# Optional: add diagram files if they exist
git add MonksArch.dot MonksArch.svg 2>/dev/null || true

# Commit
git commit -m "Publish SMARTY architecture bundle $(date +%Y-%m-%d)" || echo "Nothing to commit"

# Push
git push -u origin "$BRANCH"

echo ""
echo "Published to GitHub."
echo "Enable Pages: Settings > Pages > Source: main, root"
echo "URL: https://REMgm.github.io/SMARTY/"
echo "Pin: DEPLOY-GHPAGES-v1 | Status: Active"
