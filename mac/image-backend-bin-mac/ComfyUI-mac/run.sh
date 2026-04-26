#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${IMAGE_BACKEND_PORT:-7860}"
HOST="${IMAGE_BACKEND_HOST:-127.0.0.1}"
PYTHON_BIN="${PYTHON_BIN:-}"

if [[ -z "$PYTHON_BIN" ]]; then
    if [[ -x "$SCRIPT_DIR/.venv/bin/python" ]]; then
        PYTHON_BIN="$SCRIPT_DIR/.venv/bin/python"
    elif [[ -x "$SCRIPT_DIR/venv/bin/python" ]]; then
        PYTHON_BIN="$SCRIPT_DIR/venv/bin/python"
    elif command -v python3 >/dev/null 2>&1; then
        PYTHON_BIN="$(command -v python3)"
    else
        echo "No usable Python 3 interpreter was found."
        echo "Expected one of:"
        echo "  $SCRIPT_DIR/.venv/bin/python"
        echo "  $SCRIPT_DIR/venv/bin/python"
        echo "  python3 on PATH"
        exit 1
    fi
fi

if [[ ! -f "$SCRIPT_DIR/main.py" ]]; then
    echo "Missing ComfyUI entrypoint:"
    echo "  $SCRIPT_DIR/main.py"
    echo "Copy a real manual ComfyUI install into this folder before shipping."
    exit 1
fi

if [[ ! -d "$SCRIPT_DIR/models/checkpoints" ]]; then
    echo "Warning: models/checkpoints folder is missing."
    echo "Create it and place at least one checkpoint there before release."
fi

if ! find "$SCRIPT_DIR/models/checkpoints" -maxdepth 1 -type f \( -name "*.safetensors" -o -name "*.ckpt" -o -name "*.pth" \) | grep -q . 2>/dev/null; then
    echo "Warning: no checkpoint file was found in $SCRIPT_DIR/models/checkpoints"
    echo "The workstation app can launch the backend, but image generation will fail until a model is added."
fi

export PYTORCH_ENABLE_MPS_FALLBACK="${PYTORCH_ENABLE_MPS_FALLBACK:-1}"

cd "$SCRIPT_DIR"
exec "$PYTHON_BIN" main.py --listen "$HOST" --port "$PORT"
