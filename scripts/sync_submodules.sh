#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[INFO] Repository root: ${ROOT_DIR}"
cd "${ROOT_DIR}"

echo "[INFO] Syncing submodule URLs from .gitmodules..."
git submodule sync --recursive

echo "[INFO] Submodule URL sync completed."