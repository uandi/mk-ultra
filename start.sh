#!/bin/bash
# Enhanced script to activate virtual environment, check required models, and start ComfyUI with MPS support

# Navigate to the script's directory (ComfyUI root directory)
cd "$(dirname "$0")"

# Activate the virtual environment
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "Virtual environment not found. Please run setup_comfyui_models.sh first."
    exit 1
fi

# Check for required models
declare -A required_models
required_models=(
    ["models/checkpoints"]="Base Model (.ckpt or .safetensors)"
    ["models/vae"]="VAE Model (.ckpt or .safetensors)"
    ["models/configs"]="Model Config Files (.yaml)"
)

missing_models=false

echo "Checking for required models..."
for dir in "${!required_models[@]}"; do
    if [ -d "$dir" ]; then
        files_count=$(ls -1q "$dir"/* 2>/dev/null | wc -l)
        if [ "$files_count" -eq 0 ]; then
            echo "Missing ${required_models[$dir]} in $dir"
            missing_models=true
        fi
    else
        echo "Directory $dir does not exist. Please run setup_comfyui_models.sh."
        exit 1
    fi
done

if [ "$missing_models" = true ]; then
    echo "Some required models are missing. Please run setup_comfyui_models.sh."
    exit 1
else
    echo "All required models are present."
fi

# Start ComfyUI
echo "Starting ComfyUI..."
python main.py