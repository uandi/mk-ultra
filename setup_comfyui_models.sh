#!/bin/bash
# Script to download required models and place them into the correct folders for ComfyUI on macOS

# Navigate to the script's directory (ComfyUI root directory)
cd "$(dirname "$0")"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for required commands
if ! command_exists wget; then
    echo "Error: wget is not installed. Install it using 'brew install wget'."
    exit 1
fi

if ! command_exists git; then
    echo "Error: git is not installed. Install it using 'brew install git'."
    exit 1
fi

# Activate the virtual environment or create one if it doesn't exist
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "Virtual environment not found. Creating one..."
    python3 -m venv venv
    source venv/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
fi

# Ensure PyTorch is up to date and supports MPS
echo "Ensuring PyTorch is up to date..."
pip install --upgrade torch torchvision torchaudio

# Create necessary directories if they don't exist
declare -A model_dirs=(
    ["models/checkpoints"]="Base Models"
    ["models/vae"]="VAE Models"
    ["models/clip"]="CLIP Models"
    ["embeddings"]="Textual Inversion Embeddings"
    ["models/lora"]="LoRA Models"
    ["models/hypernetworks"]="Hypernetworks"
    ["models/controlnet"]="ControlNet Models"
    ["models/configs"]="Model Configuration Files"
    ["custom_nodes"]="Custom Nodes and Extensions"
)
echo "Creating necessary directories..."
for dir in "${!model_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "Created directory: $dir (${model_dirs[$dir]})"
    fi
done

# Prompt the user for their Hugging Face access token
read -s -p "Enter your Hugging Face access token: " HF_TOKEN
echo
if [ -z "$HF_TOKEN" ]; then
    echo "No token entered. Please obtain an access token from https://huggingface.co/settings/tokens and enter it when prompted."
    exit 1
fi

# Function to download files with wget and Hugging Face token
hf_wget() {
    local url=$1
    local output_dir=$2
    local filename=$(basename "$url")
    wget --header="Authorization: Bearer $HF_TOKEN" "$url" -O "$output_dir/$filename"
}

# Download Base Model (Stable Diffusion v1.5)
echo "Downloading Stable Diffusion v1.5 Base Model..."
hf_wget "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors" "models/checkpoints"

# Download VAE Model (SD V1.5 Official VAE)
echo "Downloading SD V1.5 Official VAE..."
hf_wget "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/sd-vae-ft-mse-original.safetensors" "models/vae"

# Download Model Configuration Files
echo "Downloading Model Configuration Files..."
wget "https://raw.githubusercontent.com/CompVis/stable-diffusion/main/configs/stable-diffusion/v1-inference.yaml" -O "models/configs/v1-inference.yaml"

# Download Textual Inversion Embeddings
echo "Downloading Textual Inversion Embeddings..."
EMBEDDINGS=(
    "https://huggingface.co/sd-concepts-library/arcane-style/resolve/main/arcane_style.pt"
    # Add more embedding URLs here
)
for url in "${EMBEDDINGS[@]}"; do
    hf_wget "$url" "embeddings"
done

# Download LoRA Models
echo "Downloading LoRA Models..."
LORA_MODELS=(
    "https://huggingface.co/kerasstability/lora-dreambooth/resolve/main/lora-dreambooth.safetensors"
    # Add more LoRA model URLs here
)
for url in "${LORA_MODELS[@]}"; do
    hf_wget "$url" "models/lora"
done

# Download Hypernetworks
echo "Downloading Hypernetworks..."
HYPERNETWORKS=(
    "https://huggingface.co/akasha/hypernetwork/resolve/main/hypernetwork.pt"
    # Add more hypernetwork URLs here
)
for url in "${HYPERNETWORKS[@]}"; do
    hf_wget "$url" "models/hypernetworks"
done

# Download ControlNet Models
echo "Downloading ControlNet Models..."
CONTROLNET_MODELS=(
    "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth"
    "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_openpose.pth"
)
for url in "${CONTROLNET_MODELS[@]}"; do
    hf_wget "$url" "models/controlnet"
done

# Download Custom Nodes and Extensions
echo "Downloading ComfyUI-Manager..."
cd custom_nodes
if [ -d "ComfyUI-Manager" ]; then
    echo "ComfyUI-Manager already exists. Pulling latest changes..."
    cd ComfyUI-Manager
    git pull
    cd ..
else
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git
fi
cd ..

# Confirm completion
echo "All required models and files have been downloaded and placed into the correct directories."

# Optionally, you can start ComfyUI after setup
# echo "Starting ComfyUI..."
# python main.py