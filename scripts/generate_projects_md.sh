#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_FILE="${ROOT_DIR}/docs/PROJECTS.md"

cd "${ROOT_DIR}"

mkdir -p docs

{
    echo "# Project Inventory"
    echo
    echo "This file is auto-generated from current Git submodules."
    echo
    echo "| Name | Path | Remote URL |"
    echo "|------|------|------------|"

    git config --file .gitmodules --get-regexp '^submodule\..*\.path$' | while read -r key path; do
        name="${key#submodule.}"
        name="${name%.path}"
        url="$(git config --file .gitmodules --get "submodule.${name}.url" || true)"
        echo "| ${name} | ${path} | ${url} |"
    done

    echo
    echo "## Notes"
    echo
    echo "- All third-party projects should live under \`third_party/\`"
    echo "- Update this file by running \`bash scripts/generate_projects_md.sh\`"
} > "${OUTPUT_FILE}"

echo "[INFO] Generated ${OUTPUT_FILE}"