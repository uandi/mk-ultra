# ComfyUI Installation Guide on Mac with ARM Chip (Apple Silicon)

This README provides a comprehensive, step-by-step guide to installing **ComfyUI** on a Mac with an ARM chip (Apple Silicon). It incorporates all necessary fixes and adjustments to ensure a smooth installation, including the specific command to create a virtual environment with Python 3.10.

# Hugginface Token:
````
export HF_TOKEN="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"
./setup_comfyui_models.sh
````

# ComfyUI Manager

Installation
Installation[method1] (General installation method: ComfyUI-Manager only)
To install ComfyUI-Manager in addition to an existing installation of ComfyUI, you can follow the following steps:

goto ComfyUI/custom_nodes dir in terminal(cmd)
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
Restart ComfyUI

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Step 1: Install Homebrew](#step-1-install-homebrew)
3. [Step 2: Install Git](#step-2-install-git)
4. [Step 3: Install Python 3.10](#step-3-install-python-310)
5. [Step 4: Install Rust](#step-4-install-rust)
6. [Step 5: Install Xcode Command Line Tools](#step-5-install-xcode-command-line-tools)
7. [Step 6: Clone the ComfyUI Repository](#step-6-clone-the-comfyui-repository)
8. [Step 7: Set Up a Python Virtual Environment](#step-7-set-up-a-python-virtual-environment)
9. [Step 8: Upgrade pip](#step-8-upgrade-pip)
10. [Step 9: Install Required Python Packages](#step-9-install-required-python-packages)
11. [Step 10: Install PyTorch with MPS Support](#step-10-install-pytorch-with-mps-support)
12. [Step 11: Download Stable Diffusion Model Files](#step-11-download-stable-diffusion-model-files)
13. [Step 12: Run ComfyUI](#step-12-run-comfyui)
14. [Troubleshooting](#troubleshooting)
15. [Additional Tips](#additional-tips)
16. [Conclusion](#conclusion)

---

## Prerequisites

Ensure you have the following before starting:

- **Administrator access** to install software.
- **Internet connection**.
- **macOS Monterey 12.3 or later** for full Apple Silicon support.

---

## Step 1: Install Homebrew

Homebrew is a package manager that simplifies software installation on macOS.

1. **Open Terminal**:

   - Find it in **Applications > Utilities > Terminal** or use Spotlight Search (`Cmd + Space`) and type **Terminal**.

2. **Install Homebrew**:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

   	3.	Add Homebrew to Your PATH:
   After installation, execute the commands displayed at the end. Example:
   ```

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

Step 2: Install Git

Git is necessary to clone the ComfyUI repository.

    1.	Install Git via Homebrew:

brew install git

    2.	Verify Git Installation:

git --version

    •	Expected Output: git version 2.x.x

Step 3: Install Python 3.10

ComfyUI requires Python 3.10.

    1.	Install Python 3.10 via Homebrew:

brew install python@3.10

    2.	Locate the Python 3.10 Executable:

Homebrew installs Python 3.10 at /opt/homebrew/bin/python3.10. Verify this:

/opt/homebrew/bin/python3.10 --version

    •	Expected Output: Python 3.10.x

    3.	(Optional) Add Unversioned Symlinks to PATH:

Homebrew installs unversioned symlinks in /opt/homebrew/opt/python@3.10/libexec/bin. To use python3 and pip3 commands easily, add this directory to your PATH.

echo 'export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"' >> ~/.zprofile
source ~/.zprofile

    4.	Verify the python3 Command:

which python3

    •	Expected Output: /opt/homebrew/opt/python@3.10/libexec/bin/python3

python3 --version

    •	Expected Output: Python 3.10.x

Step 4: Install Rust

Rust is required for compiling some dependencies.

    1.	Install Rust:

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    2.	Follow Installation Prompts:
    •	Type 1 for the default installation.
    3.	Update Environment Variables:

source $HOME/.cargo/env

    4.	Verify Rust Installation:

rustc --version

    •	Expected Output: rustc x.x.x

Step 5: Install Xcode Command Line Tools

These tools are necessary for building packages.

    1.	Install Command Line Tools:

xcode-select --install

    2.	Follow On-Screen Prompts:
    •	Click Install when prompted.

Step 6: Clone the ComfyUI Repository

    1.	Navigate to Desired Installation Directory:

cd ~

    2.	Clone the Repository:

git clone https://github.com/comfyanonymous/ComfyUI.git

Step 7: Set Up a Python Virtual Environment

A virtual environment isolates project dependencies.

    1.	Navigate to the ComfyUI Directory:

cd ComfyUI

    2.	Create the Virtual Environment with Python 3.10:

Use the specific command to create the virtual environment:

/opt/homebrew/bin/python3.10 -m venv venv

    3.	Activate the Virtual Environment:

source venv/bin/activate

    •	Your terminal prompt should now start with (venv).

    4.	Confirm the Python Version in the Virtual Environment:

python --version

    •	Expected Output: Python 3.10.x

Step 8: Upgrade pip

Ensure you have the latest version of pip.

pip install --upgrade pip

Step 9: Install Required Python Packages

    1.	Install Dependencies from requirements.txt:

pip install -r requirements.txt

    •	If you encounter any errors during this step, see the Troubleshooting section below.

Step 10: Install PyTorch with MPS Support

For GPU acceleration on Apple Silicon, install PyTorch with Metal Performance Shaders (MPS) support.

    1.	Install PyTorch Nightly Build:

The nightly build includes the latest MPS optimizations.

pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cpu

    2.	Verify MPS Availability:

python -c "import torch; print(torch.backends.mps.is_available())"

    •	Expected Output: True

    3.	Verify MPS is Built:

python -c "import torch; print(torch.backends.mps.is_built())"

    •	Expected Output: True

Step 11: Download Stable Diffusion Model Files

Due to licensing, you must manually download these files.

    1.	Create Models Directory:

mkdir -p models/checkpoints

    2.	Register on Hugging Face:
    •	Go to Hugging Face.
    •	Create an account or log in.
    3.	Agree to Model License:
    •	Visit the Stable Diffusion v1-4 model page.
    •	Read and accept the license terms.
    4.	Download the Model File:
    •	Download sd-v1-4.ckpt or a compatible .ckpt or .safetensors file.
    5.	Place the Model in the Correct Directory:

mv /path/to/downloaded/model.ckpt models/checkpoints/

    •	Replace /path/to/downloaded/model.ckpt with the actual path to your downloaded model file.

Step 12: Run ComfyUI

    1.	Start ComfyUI:

python main.py

    2.	Access the Web Interface:
    •	Open your web browser and navigate to http://localhost:8188.
    3.	Verify Operation:
    •	You should see the ComfyUI interface.
    •	Test generating an image to ensure everything works.

Troubleshooting

Package Installation Errors During pip install -r requirements.txt

    •	Ensure Xcode Command Line Tools are installed (see Step 5).
    •	Install problematic packages individually. For example, if you get an error with psutil:

pip install psutil

    •	Install additional build tools if necessary:

brew install cmake

PyTorch Does Not Recognize MPS

    •	Ensure you’re running macOS Monterey 12.3 or later.
    •	Reinstall PyTorch nightly build with MPS support (see Step 10).
    •	Verify Python is using the virtual environment:

which python

    •	Expected Output: Path within your virtual environment, e.g., /Users/yourusername/ComfyUI/venv/bin/python

Rust Compiler Errors

    •	Update Rust to the latest version:

rustup update

Python Version Issues

    •	Ensure you’re using Python 3.10 in your virtual environment.
    •	If not, recreate the virtual environment using the specific command:

/opt/homebrew/bin/python3.10 -m venv venv

python or python3 Commands Point to the Wrong Version

    •	Ensure you have added the unversioned symlinks to your PATH (see Step 3).
    •	Reload your shell configuration:

source ~/.zprofile

    •	Verify the python3 command:

which python3

    •	Expected Output: /opt/homebrew/opt/python@3.10/libexec/bin/python3

Additional Tips

    •	Stay Updated:
    •	Regularly check the ComfyUI GitHub repository for updates and new releases.
    •	Use Native ARM Versions When Possible:
    •	Prefer installing ARM-compatible versions of software to optimize performance.
    •	Manage Environment Variables Carefully:
    •	Be cautious when modifying global PATH variables to prevent conflicts with the system Python or other tools.
    •	Explore Community Resources:
    •	Visit forums like Reddit or GitHub Issues for solutions to common problems.

## Shortcuts

| Keybind                            | Explanation                                                                                                        |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Ctrl + Enter                       | Queue up current graph for generation                                                                              |
| Ctrl + Shift + Enter               | Queue up current graph as first for generation                                                                     |
| Ctrl + Alt + Enter                 | Cancel current generation                                                                                          |
| Ctrl + Z/Ctrl + Y                  | Undo/Redo                                                                                                          |
| Ctrl + S                           | Save workflow                                                                                                      |
| Ctrl + O                           | Load workflow                                                                                                      |
| Ctrl + A                           | Select all nodes                                                                                                   |
| Alt + C                            | Collapse/uncollapse selected nodes                                                                                 |
| Ctrl + M                           | Mute/unmute selected nodes                                                                                         |
| Ctrl + B                           | Bypass selected nodes (acts like the node was removed from the graph and the wires reconnected through)            |
| Delete/Backspace                   | Delete selected nodes                                                                                              |
| Ctrl + Backspace                   | Delete the current graph                                                                                           |
| Space                              | Move the canvas around when held and moving the cursor                                                             |
| Ctrl/Shift + Click                 | Add clicked node to selection                                                                                      |
| Ctrl + C/Ctrl + V                  | Copy and paste selected nodes (without maintaining connections to outputs of unselected nodes)                     |
| Ctrl + C/Ctrl + Shift + V          | Copy and paste selected nodes (maintaining connections from outputs of unselected nodes to inputs of pasted nodes) |
| Shift + Drag                       | Move multiple selected nodes at the same time                                                                      |
| Ctrl + D                           | Load default graph                                                                                                 |
| Alt + `+`                          | Canvas Zoom in                                                                                                     |
| Alt + `-`                          | Canvas Zoom out                                                                                                    |
| Ctrl + Shift + LMB + Vertical drag | Canvas Zoom in/out                                                                                                 |
| P                                  | Pin/Unpin selected nodes                                                                                           |
| Ctrl + G                           | Group selected nodes                                                                                               |
| Q                                  | Toggle visibility of the queue                                                                                     |
| H                                  | Toggle visibility of history                                                                                       |
| R                                  | Refresh graph                                                                                                      |
| Double-Click LMB                   | Open node quick search palette                                                                                     |
| Shift + Drag                       | Move multiple wires at once                                                                                        |
| Ctrl + Alt + LMB                   | Disconnect all wires from clicked slot                                                                             |

Ctrl can also be replaced with Cmd instead for macOS users

## Frontend Development

As of August 15, 2024, we have transitioned to a new frontend, which is now hosted in a separate repository: [ComfyUI Frontend](https://github.com/Comfy-Org/ComfyUI_frontend). This repository now hosts the compiled JS (from TS/Vue) under the `web/` directory.

### Reporting Issues and Requesting Features

For any bugs, issues, or feature requests related to the frontend, please use the [ComfyUI Frontend repository](https://github.com/Comfy-Org/ComfyUI_frontend). This will help us manage and address frontend-specific concerns more efficiently.

### Using the Latest Frontend

The new frontend is now the default for ComfyUI. However, please note:

1. The frontend in the main ComfyUI repository is updated weekly.
2. Daily releases are available in the separate frontend repository.
