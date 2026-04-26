# image-backend-bin-mac

This folder is the drop-in payload for the Mac image pack.

When a customer runs `INSTALL-IMAGE-PACK-MAC.sh`, the contents of `image-backend-bin-mac/` should be copied into:

- `~/.offline-ai-workstation/image-backend`

## Minimum expected contents

- a launch script such as `start-image-backend.sh` or `run.sh`
- a backend app folder such as `ComfyUI/` or `ComfyUI-mac/`
- one or more checkpoint/model files in a `models/checkpoints/` folder

## Supported launch locations

The Mac workstation app currently looks for launchers in places like:

- `start-image-backend.sh`
- `run.sh`
- `ComfyUI/run.sh`
- `ComfyUI-mac/run.sh`
- `start-image-backend.command`

## Supported checkpoint locations

The app currently looks for checkpoints in places like:

- `models/checkpoints/`
- `ComfyUI/models/checkpoints/`
- `ComfyUI-mac/models/checkpoints/`

## Suggested bundle layout

```text
image-backend-bin-mac/
  start-image-backend.sh
  ComfyUI-mac/
    run.sh
    workflows/
      text-to-image.json
      premium-poster.json
    models/
      checkpoints/
        PLACE-MODEL-FILES-HERE.txt
```

## Important

Do not commit large model binaries into git history.
Ship the finished backend bundle as a GitHub Release asset instead.
