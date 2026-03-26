#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[INFO] Repository root: ${ROOT_DIR}"
cd "${ROOT_DIR}"

echo "[INFO] Syncing submodule configuration..."
git submodule sync --recursive

echo "[INFO] Initializing and updating submodules..."
git submodule update --init --recursive

echo "[INFO] Bootstrap completed successfully."