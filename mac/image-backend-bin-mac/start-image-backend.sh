#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -x "$SCRIPT_DIR/ComfyUI-mac/run.sh" ]]; then
    exec /bin/bash "$SCRIPT_DIR/ComfyUI-mac/run.sh"
fi

if [[ -x "$SCRIPT_DIR/ComfyUI/run.sh" ]]; then
    exec /bin/bash "$SCRIPT_DIR/ComfyUI/run.sh"
fi

echo "No Mac image backend launcher was found."
echo "Expected one of:"
echo "  $SCRIPT_DIR/ComfyUI-mac/run.sh"
echo "  $SCRIPT_DIR/ComfyUI/run.sh"
exit 1
