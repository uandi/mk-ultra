#!/bin/bash
# Script to activate virtual environment and start ComfyUI

# Navigate to the script's directory
cd "$(dirname "$0")"

# Optionally disable MPS if you'd like to force everything on CPU
# Uncomment the following line if you want to disable MPS
# export PYTORCH_DISABLE_MPS=1

# Activate the virtual environment
source venv/bin/activate

# Check if torch is using MPS
if python -c "import torch; assert torch.has_mps, 'MPS not available'; print('MPS is available.')" 2>/dev/null; then
    echo "Using MPS backend for most tasks"
else
    echo "MPS not available, forcing CPU mode"
    export PYTORCH_DISABLE_MPS=1
fi

# Patch the VAEEncodeForInpaint to use CPU for the specific convolution operations
PATCH_FILE="comfy/ldm/models/autoencoder.py"
PATCH_PATTERN="samples\[x:x\+batch_number\] = self.first_stage_model.encode(pixels_in).to(self.output_device).float()"
PATCH_REPLACEMENT="samples[x:x+batch_number] = self.first_stage_model.encode(pixels_in).to('cpu').float()"

if grep -q "$PATCH_PATTERN" "$PATCH_FILE"; then
    echo "Patching $PATCH_FILE to use CPU for VAE encoding..."
    sed -i.bak "s|$PATCH_PATTERN|$PATCH_REPLACEMENT|" "$PATCH_FILE"
    echo "Patch applied."
else
    echo "Patch already applied or not needed."
fi

# Run ComfyUI
python main.py