#!/bin/bash

echo "================== Starting Podcast Feed Generation =================="

# Configure git
git config --global user.name "${INPUT_NAME}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Ensure we are in the GitHub workspace
cd /github/workspace

# Run the feed generation script
python3 feed.py || { echo "Feed generation failed"; exit 1; }

# Commit and push changes
git add -A
if git diff --cached --quiet; then
  echo "No changes to commit"
else
  git commit -m "Update Feed"
  git push --set-upstream origin main || { echo "Git push failed"; exit 1; }
fi

echo "================== Podcast Feed Generation Complete =================="
