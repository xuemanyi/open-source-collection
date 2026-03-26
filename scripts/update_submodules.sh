#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[INFO] Repository root: ${ROOT_DIR}"
cd "${ROOT_DIR}"

echo "[INFO] Syncing submodule configuration..."
git submodule sync --recursive

echo "[INFO] Initializing submodules if needed..."
git submodule update --init --recursive

echo "[INFO] Updating submodules from remote tracking branches..."
git submodule update --remote --recursive

echo "[INFO] Current submodule status:"
git submodule status --recursive

echo
echo "[INFO] Review submodule changes with:"
echo "       git status"
echo "       git diff --submodule"
echo
echo "[INFO] If everything looks good, commit the updated submodule pointers."