#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "${ROOT_DIR}"

echo "[INFO] Running repository health check..."
echo

if [[ ! -f ".gitmodules" ]]; then
    echo "[WARN] .gitmodules not found."
else
    echo "[OK] .gitmodules found."
fi

if [[ ! -d "third_party" ]]; then
    echo "[WARN] third_party directory not found."
else
    echo "[OK] third_party directory found."
fi

echo
echo "[INFO] Git status:"
git status --short

echo
echo "[INFO] Submodule status:"
git submodule status --recursive || true

echo
echo "[INFO] Health check completed."