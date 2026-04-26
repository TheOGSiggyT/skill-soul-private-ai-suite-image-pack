# Skill & Soul Private AI Suite
Optional Image Generation Pack for macOS

This folder contains the lightweight files for the future Mac image-pack release track.

## Expected release name

- `v1.0.0-image-pack-mac`

## What the Mac image pack should contain

- `README-IMAGE-PACK-MAC.md`
- `INSTALL-IMAGE-PACK-MAC.sh`
- a Mac-ready image backend bundle folder such as `image-backend-bin-mac/`
- one or more Mac-ready checkpoint/model files
- optional workflow JSON files for ComfyUI text-to-image

## Expected backend layout inside the extracted pack

The Mac workstation app now looks for launch scripts such as:

- `image-backend-bin-mac/start-image-backend.sh`
- `image-backend-bin-mac/run.sh`
- `image-backend-bin-mac/ComfyUI/run.sh`
- `image-backend-bin-mac/ComfyUI-mac/run.sh`

It also looks for checkpoints in locations such as:

- `image-backend-bin-mac/models/checkpoints/`
- `image-backend-bin-mac/ComfyUI/models/checkpoints/`
- `image-backend-bin-mac/ComfyUI-mac/models/checkpoints/`

This repo now includes a starter `image-backend-bin-mac/` folder with placeholder launch scripts and workflow files so the final backend bundle has a known structure.

## Current status

The install flow is scaffolded, but this is not a complete shipping pack yet.
You still need real Mac backend binaries and the actual image model assets.

## Recommended customer flow

1. Download every file from the Mac Image Pack release.
2. Extract the release package.
3. Run `INSTALL-IMAGE-PACK-MAC.sh`.
4. Let the script copy the backend files into `~/.offline-ai-workstation/image-backend`.
5. Open the workstation and use Image Studio.
