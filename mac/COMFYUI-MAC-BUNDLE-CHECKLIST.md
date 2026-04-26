# ComfyUI Mac Bundle Checklist

Use this checklist when turning the `image-backend-bin-mac/` scaffold into a real shippable Mac image backend bundle.

## Goal

After extraction and install, the workstation should be able to:

1. copy the backend bundle into `~/.offline-ai-workstation/image-backend`
2. launch the backend from a shell script
3. detect a running ComfyUI API on port `7860`
4. find at least one checkpoint in a supported checkpoints folder
5. generate images from Image Studio using the bundled workflow JSON files

## Required top-level files

Inside `mac/image-backend-bin-mac/`, make sure you end up with:

- `start-image-backend.sh`
- `README.md`
- either `ComfyUI-mac/` or `ComfyUI/`

## Required launcher behavior

One of these launch targets must exist and successfully start the backend:

- `start-image-backend.sh`
- `run.sh`
- `ComfyUI/run.sh`
- `ComfyUI-mac/run.sh`
- `start-image-backend.command`

The launcher should:

- run on macOS without a Windows shell
- start ComfyUI in API mode
- bind to `127.0.0.1:7860` unless you intentionally change the app-side expectation
- keep the process alive long enough for the workstation to connect

## Recommended launcher command shape

If your bundle contains a Python-based ComfyUI install, the final launch command will usually look roughly like:

```bash
python main.py --listen 127.0.0.1 --port 7860
```

If your backend requires a virtual environment, the launcher should activate it before running ComfyUI.

## Required folders

At least one of these checkpoint locations must exist after install:

- `image-backend-bin-mac/models/checkpoints/`
- `image-backend-bin-mac/ComfyUI/models/checkpoints/`
- `image-backend-bin-mac/ComfyUI-mac/models/checkpoints/`

At least one of these workflow locations should exist:

- `image-backend-bin-mac/workflows/`
- `image-backend-bin-mac/ComfyUI/workflows/`
- `image-backend-bin-mac/ComfyUI-mac/workflows/`

## Required model assets

Put at least one usable image checkpoint in a supported checkpoints folder, for example:

- `*.safetensors`
- `*.ckpt`
- `*.pth`

The workstation currently chooses the first matching file it finds, so keep only the intended primary checkpoint there if you want predictable behavior.

## Recommended supporting assets

Depending on your chosen backend and workflow, you may also need:

- VAE files
- text encoders
- CLIP assets
- custom nodes
- Python dependencies

If those are required, bundle them inside the backend folder so the install remains offline.

## Workflow files

Make sure these remain present or provide equivalent replacements:

- `workflows/text-to-image.json`
- `workflows/premium-poster.json`

These workflows should:

- use `CheckpointLoaderSimple`
- save an image output
- accept the placeholders already used by the workstation app

## File permissions

Before shipping, make sure all shell launchers are executable:

- `chmod +x start-image-backend.sh`
- `chmod +x ComfyUI-mac/run.sh`

## Pre-release verification

Before packaging release assets, verify all of the following on a Mac:

1. Delete or move aside any old `~/.offline-ai-workstation/image-backend` folder.
2. Extract the candidate image-pack bundle.
3. Run `INSTALL-IMAGE-PACK-MAC.sh`.
4. Confirm files land in `~/.offline-ai-workstation/image-backend`.
5. Run the launcher manually once and confirm the API starts on port `7860`.
6. Open the workstation.
7. Open Image Studio.
8. Confirm backend detection succeeds.
9. Generate a test image.
10. Confirm the output file is saved successfully.

## Release asset recommendation

For the Mac image-pack release, prefer a small number of clearly named assets:

- `image-backend-bin-mac.zip`
- `INSTALL-IMAGE-PACK-MAC.sh`
- `README-IMAGE-PACK-MAC.md`

If the model payload is too large for one asset, split it clearly and document the reassembly/install flow in the README.

## Not done yet

This checklist does not provide the real ComfyUI Mac binaries or the actual model files.
It defines the exact target layout and behavior that the final bundle should satisfy.
