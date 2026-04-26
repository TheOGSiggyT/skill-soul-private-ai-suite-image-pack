#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${IMAGE_BACKEND_PORT:-7860}"

echo "ComfyUI-mac launcher placeholder"
echo "Replace this script with the real Mac backend launcher."
echo "Working directory: $SCRIPT_DIR"
echo "Expected port: $PORT"
echo ""
echo "Typical final behavior:"
echo "1. activate the local Python environment if needed"
echo "2. launch ComfyUI with API mode enabled"
echo "3. bind to port $PORT"
echo ""
echo "Example target command shape:"
echo "python main.py --listen 127.0.0.1 --port $PORT"
exit 1
