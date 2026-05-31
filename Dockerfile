# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.4-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-rmbg@3.0.0 --mode remote || (echo "WARN: comfyui-rmbg@3.0.0 unavailable in registry, falling back to latest" >&2 && comfy node install --exit-on-fail comfyui-rmbg --mode remote)

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/

# user-provided inputs override the auto-generated placeholders above.
RUN wget --progress=dot:giga -O '/comfyui/input/00975649250-000-e1.jpg' "https://cool-anteater-319.convex.cloud/api/storage/d952d0a1-35c8-4376-9c39-bc7ab7663308"
