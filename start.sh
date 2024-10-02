#!/bin/bash
# Script to activate virtual environment and start ComfyUI

# Navigate to the script's directory
cd "$(dirname "$0")"

# Activate the virtual environment
source venv/bin/activate

# Run ComfyUI
python main.py