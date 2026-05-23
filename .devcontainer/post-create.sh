#!/usr/bin/env bash
set -euo pipefail

if command -v dotnet >/dev/null 2>&1; then
  dotnet tool restore
fi

if command -v npm >/dev/null 2>&1; then
  npm install --global pnpm
fi

if [ -f "package.json" ]; then
  pnpm install
fi
