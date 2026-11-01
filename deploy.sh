#!/usr/bin/env bash
# usage: ./deploy.sh https://github.com/<user>/<repo>.git
set -e
REMOTE="${1:-https://github.com/devpb412022/m10-legislation.git}"
[ -d .git ] || git init
git add .
git commit -m "Update M10 study site" || true
git branch -M main
git remote get-url origin >/dev/null 2>&1 || git remote add origin "$REMOTE"
git push -u origin main
echo "Now enable Settings > Pages > main / (root)"
