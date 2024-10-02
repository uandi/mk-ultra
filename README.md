<div align="center">

Getting Started with ComfyUI: An Idiot-Proof Guide

Welcome! This guide will help you start using ComfyUI after installing it on your Mac with an ARM chip (Apple Silicon). We’ll walk you through every step in detail to ensure you have a smooth and enjoyable experience.

Table of Contents

	1.	Prerequisites
	2.	Step 1: Open Terminal
	3.	Step 2: Navigate to the ComfyUI Directory
	4.	Step 3: Activate the Virtual Environment
	5.	Step 4: Run ComfyUI
	6.	Step 5: Access the Web Interface
	7.	Understanding the Interface
	8.	Creating Your First Image
	9.	Saving and Loading Workflows
	10.	Common Issues and Solutions
	11.	Additional Resources
	12.	Conclusion

Prerequisites

Before you begin, make sure you have:

	•	ComfyUI installed on your Mac, following the installation guide.
	•	An internet connection.
	•	A web browser (Safari, Chrome, Firefox, etc.).

Step 1: Open Terminal

The Terminal application allows you to interact with your computer using text commands.

How to Open Terminal

	•	Method 1: Using Finder
	1.	Click on the Finder icon (smiley face) in your Dock.
	2.	Go to Applications in the sidebar.
	3.	Open the Utilities folder.
	4.	Double-click on Terminal.
	•	Method 2: Using Spotlight Search
	1.	Press Command (⌘) + Spacebar to open Spotlight.
	2.	Type Terminal and press Enter.

Step 2: Navigate to the ComfyUI Directory

You need to navigate to the folder where you installed ComfyUI.

Finding Your ComfyUI Directory

	•	Common Locations:
	•	Home Directory:

cd ~/ComfyUI


	•	Desktop:

cd ~/Desktop/ComfyUI


	•	Documents:

cd ~/Documents/ComfyUI


	•	Projects Folder:

cd ~/Projects/ComfyUI



How to Navigate

	1.	In Terminal, type cd followed by the path to your ComfyUI folder.
	2.	Press Enter.

Example:

cd ~/Desktop/ComfyUI

Tips:

	•	If you’re unsure where ComfyUI is, you can search for it:

find ~ -name "ComfyUI" -type d


	•	Replace ~/Desktop/ComfyUI with the correct path if it’s in a different location.

Step 3: Activate the Virtual Environment

Activating the virtual environment ensures you’re using the correct Python packages for ComfyUI.

How to Activate

	1.	In Terminal (and after navigating to the ComfyUI directory), type:

source venv/bin/activate


	2.	Press Enter.

Expected Result:

	•	Your Terminal prompt should now start with (venv), indicating the virtual environment is active.

Troubleshooting:

	•	Error: No such file or directory
	•	Make sure you’re in the correct directory where venv exists.
	•	Use ls to list files and confirm venv is present.

ls


	•	If venv is missing, you may need to recreate it following the installation guide.

Step 4: Run ComfyUI

Now that you’re in the correct directory and the virtual environment is active, you can start ComfyUI.

How to Run

	1.	In Terminal, type:

python main.py


	2.	Press Enter.

Expected Output:

	•	Terminal will display messages indicating that ComfyUI is running.
	•	You should see something like:

Running on http://127.0.0.1:8188



Important:

	•	Keep the Terminal window open while using ComfyUI.
	•	Do not close or exit the Terminal, or ComfyUI will stop running.

Step 5: Access the Web Interface

ComfyUI uses a web-based interface that you can access through your web browser.

How to Access

	1.	Open your preferred web browser.
	2.	In the address bar, type:

http://localhost:8188


	3.	Press Enter.

Expected Result:

	•	The ComfyUI interface should load, showing a blank canvas where you can create workflows.

Troubleshooting:

	•	If the page doesn’t load, check that ComfyUI is running in Terminal.
	•	Ensure you typed the address correctly.

Understanding the Interface

Before creating your first image, it’s helpful to understand the main components of the ComfyUI interface.

Main Components

	•	Canvas Area: The large central area where you add and connect nodes.
	•	Toolbar: Located at the top, includes buttons for actions like saving and loading workflows.
	•	Right-Click Menu: Accessed by right-clicking on the canvas to add new nodes.

Basic Navigation

	•	Panning: Click and drag on the canvas background to move around.
	•	Zooming: Use your mouse scroll wheel or trackpad gestures to zoom in and out.
	•	Adding Nodes: Right-click on the canvas to open the node menu.

Creating Your First Image

Let’s create a simple workflow to generate an image based on a text prompt.

Step 1: Add a Text Input Node

	1.	Right-click on the canvas to open the menu.
	2.	Navigate to “Add Node” > “Text” > “Text Input”.
	3.	Click on “Text Input”.

Step 2: Add a Checkpoint Loader Node

	1.	Right-click on the canvas.
	2.	Navigate to “Add Node” > “Load” > “Checkpoint Loader”.
	3.	Click on “Checkpoint Loader”.

Step 3: Add a KSampler Node

	1.	Right-click on the canvas.
	2.	Navigate to “Add Node” > “Sampling” > “KSampler”.
	3.	Click on “KSampler”.

Step 4: Add a Save Image Node

	1.	Right-click on the canvas.
	2.	Navigate to “Add Node” > “Output” > “Save Image”.
	3.	Click on “Save Image”.

Step 5: Connect the Nodes

	1.	Connect Text Input to KSampler:
	•	Click on the circle on the right side of the Text Input node.
	•	Drag the line to the “Positive Conditioning” input on the left side of the KSampler node.
	2.	Connect Checkpoint Loader to KSampler:
	•	Click on the circle on the right side of the Checkpoint Loader node.
	•	Drag the line to the “Model” input on the left side of the KSampler node.
	3.	Connect KSampler to Save Image:
	•	Click on the circle on the right side of the KSampler node.
	•	Drag the line to the “Image” input on the left side of the Save Image node.

Step 6: Configure the Nodes

	1.	Set the Text Prompt:
	•	Double-click on the Text Input node.
	•	In the dialog that appears, enter your prompt, e.g.:

A serene landscape with mountains and a lake at sunrise.


	•	Click OK or Apply.

	2.	Load the Model Checkpoint:
	•	Double-click on the Checkpoint Loader node.
	•	Ensure the Model Path is set to your model file, e.g.:

models/checkpoints/sd-v1-4.ckpt


	•	If not, click on the field and select or enter the correct path.

	3.	Adjust KSampler Settings (Optional):
	•	Double-click on the KSampler node.
	•	You can adjust parameters like:
	•	Sampling Steps: Start with 20.
	•	CFG Scale: Start with 7.5.
	•	Seed: Leave blank for a random seed or enter a number for reproducibility.
	•	Click OK or Apply.
	4.	Set Save Location:
	•	Double-click on the Save Image node.
	•	Choose an Output Directory where you want the image to be saved.
	•	Optionally, set a filename pattern.
	•	Click OK or Apply.

Step 7: Run the Workflow

	1.	Execute the Workflow:
	•	Click on the Play button (▶️) in the toolbar.
	•	Alternatively, press Command (⌘) + Enter.
	2.	Monitor Progress:
	•	A progress bar or messages will appear, indicating the workflow is running.
	•	Wait until it’s complete.
	3.	View the Generated Image:
	•	Open Finder.
	•	Navigate to the Output Directory you specified.
	•	Open the image file to see the result.

Saving and Loading Workflows

You can save your workflows to reuse or modify them later.

Saving a Workflow

	1.	Click on the Save icon (💾) in the toolbar.
	2.	Choose a location and filename for your workflow file.
	3.	Click Save.

Loading a Workflow

	1.	Click on the Open icon (📂) in the toolbar.
	2.	Navigate to the workflow file you saved earlier.
	3.	Select the file and click Open.

Common Issues and Solutions

Issue: The Web Interface Doesn’t Load

	•	Possible Causes:
	•	ComfyUI isn’t running.
	•	Incorrect URL.
	•	Solutions:
	•	Ensure ComfyUI is running in Terminal.
	•	Verify you’re accessing http://localhost:8188.

Issue: Terminal Shows Errors When Running python main.py

	•	Possible Causes:
	•	Virtual environment not activated.
	•	Not in the correct directory.
	•	Solutions:
	•	Make sure you’ve navigated to the ComfyUI directory.
	•	Activate the virtual environment with source venv/bin/activate.
	•	Check for typos in commands.

Issue: Images Aren’t Saving

	•	Possible Causes:
	•	Incorrect output directory.
	•	Permission issues.
	•	Solutions:
	•	Double-check the Save Image node settings.
	•	Ensure the output directory exists.
	•	Check that you have write permissions for the directory.

Issue: Model Not Found or Failed to Load

	•	Possible Causes:
	•	Incorrect model path.
	•	Model file missing.
	•	Solutions:
	•	Verify the model file is in models/checkpoints/.
	•	Ensure the Checkpoint Loader node points to the correct model file.

Issue: Command Not Found Errors

	•	Possible Causes:
	•	Typo in the command.
	•	Missing software.
	•	Solutions:
	•	Double-check your typing.
	•	Ensure all prerequisites are installed.

Additional Resources

	•	Official Documentation:
	•	ComfyUI GitHub Repository
	•	Community Forums:
	•	Look for forums or groups where you can ask questions and share experiences.
	•	Tutorial Videos:
	•	Search for ComfyUI tutorials on platforms like YouTube.

Conclusion

Congratulations! You’ve successfully started using ComfyUI on your Mac with an ARM chip. Remember:

	•	Always navigate to the ComfyUI directory before activating the virtual environment.
	•	Activate the virtual environment with source venv/bin/activate.
	•	Keep the Terminal window open while ComfyUI is running.
	•	Don’t hesitate to experiment and explore different nodes and settings.

Enjoy your creative journey with ComfyUI!

If you have any questions or need further assistance, feel free to reach out through community forums or consult the official documentation.

# ComfyUI Installation Guide on Mac with ARM Chip (Apple Silicon)

This README provides a comprehensive, step-by-step guide to installing **ComfyUI** on a Mac with an ARM chip (Apple Silicon). It incorporates all necessary fixes and adjustments to ensure a smooth installation, including the specific command to create a virtual environment with Python 3.10.

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

Conclusion

By following this comprehensive guide, you should be able to successfully install ComfyUI on your Mac with an ARM chip. The guide incorporates all necessary fixes, including using the specific command to create the virtual environment with Python 3.10:


# ComfyUI
**The most powerful and modular diffusion model GUI and backend.**


[![Website][website-shield]][website-url]
[![Dynamic JSON Badge][discord-shield]][discord-url]
[![Matrix][matrix-shield]][matrix-url]
<br>
[![][github-release-shield]][github-release-link]
[![][github-release-date-shield]][github-release-link]
[![][github-downloads-shield]][github-downloads-link]
[![][github-downloads-latest-shield]][github-downloads-link]

[matrix-shield]: https://img.shields.io/badge/Matrix-000000?style=flat&logo=matrix&logoColor=white
[matrix-url]: https://app.element.io/#/room/%23comfyui_space%3Amatrix.org
[website-shield]: https://img.shields.io/badge/ComfyOrg-4285F4?style=flat
[website-url]: https://www.comfy.org/
<!-- Workaround to display total user from https://github.com/badges/shields/issues/4500#issuecomment-2060079995 -->
[discord-shield]: https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscord.com%2Fapi%2Finvites%2Fcomfyorg%3Fwith_counts%3Dtrue&query=%24.approximate_member_count&logo=discord&logoColor=white&label=Discord&color=green&suffix=%20total
[discord-url]: https://www.comfy.org/discord

[github-release-shield]: https://img.shields.io/github/v/release/comfyanonymous/ComfyUI?style=flat&sort=semver
[github-release-link]: https://github.com/comfyanonymous/ComfyUI/releases
[github-release-date-shield]: https://img.shields.io/github/release-date/comfyanonymous/ComfyUI?style=flat
[github-downloads-shield]: https://img.shields.io/github/downloads/comfyanonymous/ComfyUI/total?style=flat
[github-downloads-latest-shield]: https://img.shields.io/github/downloads/comfyanonymous/ComfyUI/latest/total?style=flat&label=downloads%40latest
[github-downloads-link]: https://github.com/comfyanonymous/ComfyUI/releases

![ComfyUI Screenshot](comfyui_screenshot.png)
</div>

This ui will let you design and execute advanced stable diffusion pipelines using a graph/nodes/flowchart based interface. For some workflow examples and see what ComfyUI can do you can check out:
### [ComfyUI Examples](https://comfyanonymous.github.io/ComfyUI_examples/)

### [Installing ComfyUI](#installing)

## Features
- Nodes/graph/flowchart interface to experiment and create complex Stable Diffusion workflows without needing to code anything.
- Fully supports SD1.x, SD2.x, [SDXL](https://comfyanonymous.github.io/ComfyUI_examples/sdxl/), [Stable Video Diffusion](https://comfyanonymous.github.io/ComfyUI_examples/video/), [Stable Cascade](https://comfyanonymous.github.io/ComfyUI_examples/stable_cascade/), [SD3](https://comfyanonymous.github.io/ComfyUI_examples/sd3/) and [Stable Audio](https://comfyanonymous.github.io/ComfyUI_examples/audio/)
- [Flux](https://comfyanonymous.github.io/ComfyUI_examples/flux/)
- Asynchronous Queue system
- Many optimizations: Only re-executes the parts of the workflow that changes between executions.
- Smart memory management: can automatically run models on GPUs with as low as 1GB vram.
- Works even if you don't have a GPU with: ```--cpu``` (slow)
- Can load ckpt, safetensors and diffusers models/checkpoints. Standalone VAEs and CLIP models.
- Embeddings/Textual inversion
- [Loras (regular, locon and loha)](https://comfyanonymous.github.io/ComfyUI_examples/lora/)
- [Hypernetworks](https://comfyanonymous.github.io/ComfyUI_examples/hypernetworks/)
- Loading full workflows (with seeds) from generated PNG, WebP and FLAC files.
- Saving/Loading workflows as Json files.
- Nodes interface can be used to create complex workflows like one for [Hires fix](https://comfyanonymous.github.io/ComfyUI_examples/2_pass_txt2img/) or much more advanced ones.
- [Area Composition](https://comfyanonymous.github.io/ComfyUI_examples/area_composition/)
- [Inpainting](https://comfyanonymous.github.io/ComfyUI_examples/inpaint/) with both regular and inpainting models.
- [ControlNet and T2I-Adapter](https://comfyanonymous.github.io/ComfyUI_examples/controlnet/)
- [Upscale Models (ESRGAN, ESRGAN variants, SwinIR, Swin2SR, etc...)](https://comfyanonymous.github.io/ComfyUI_examples/upscale_models/)
- [unCLIP Models](https://comfyanonymous.github.io/ComfyUI_examples/unclip/)
- [GLIGEN](https://comfyanonymous.github.io/ComfyUI_examples/gligen/)
- [Model Merging](https://comfyanonymous.github.io/ComfyUI_examples/model_merging/)
- [LCM models and Loras](https://comfyanonymous.github.io/ComfyUI_examples/lcm/)
- [SDXL Turbo](https://comfyanonymous.github.io/ComfyUI_examples/sdturbo/)
- [AuraFlow](https://comfyanonymous.github.io/ComfyUI_examples/aura_flow/)
- [HunyuanDiT](https://comfyanonymous.github.io/ComfyUI_examples/hunyuan_dit/)
- Latent previews with [TAESD](#how-to-show-high-quality-previews)
- Starts up very fast.
- Works fully offline: will never download anything.
- [Config file](extra_model_paths.yaml.example) to set the search paths for models.

Workflow examples can be found on the [Examples page](https://comfyanonymous.github.io/ComfyUI_examples/)

## Shortcuts

| Keybind                            | Explanation                                                                                                        |
|------------------------------------|--------------------------------------------------------------------------------------------------------------------|
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

# Installing

## Windows

There is a portable standalone build for Windows that should work for running on Nvidia GPUs or for running on your CPU only on the [releases page](https://github.com/comfyanonymous/ComfyUI/releases).

### [Direct link to download](https://github.com/comfyanonymous/ComfyUI/releases/latest/download/ComfyUI_windows_portable_nvidia.7z)

Simply download, extract with [7-Zip](https://7-zip.org) and run. Make sure you put your Stable Diffusion checkpoints/models (the huge ckpt/safetensors files) in: ComfyUI\models\checkpoints

If you have trouble extracting it, right click the file -> properties -> unblock

#### How do I share models between another UI and ComfyUI?

See the [Config file](extra_model_paths.yaml.example) to set the search paths for models. In the standalone windows build you can find this file in the ComfyUI directory. Rename this file to extra_model_paths.yaml and edit it with your favorite text editor.

## Jupyter Notebook

To run it on services like paperspace, kaggle or colab you can use my [Jupyter Notebook](notebooks/comfyui_colab.ipynb)

## Manual Install (Windows, Linux)

Git clone this repo.

Put your SD checkpoints (the huge ckpt/safetensors files) in: models/checkpoints

Put your VAE in: models/vae


### AMD GPUs (Linux only)
AMD users can install rocm and pytorch with pip if you don't have it already installed, this is the command to install the stable version:

```pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.1```

This is the command to install the nightly with ROCm 6.2 which might have some performance improvements:

```pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.2```

### NVIDIA

Nvidia users should install stable pytorch using this command:

```pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124```

This is the command to install pytorch nightly instead which might have performance improvements:

```pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu124```

#### Troubleshooting

If you get the "Torch not compiled with CUDA enabled" error, uninstall torch with:

```pip uninstall torch```

And install it again with the command above.

### Dependencies

Install the dependencies by opening your terminal inside the ComfyUI folder and:

```pip install -r requirements.txt```

After this you should have everything installed and can proceed to running ComfyUI.

### Others:

#### Intel GPUs

Intel GPU support is available for all Intel GPUs supported by Intel's Extension for Pytorch (IPEX) with the support requirements listed in the [Installation](https://intel.github.io/intel-extension-for-pytorch/index.html#installation?platform=gpu) page. Choose your platform and method of install and follow the instructions. The steps are as follows:

1. Start by installing the drivers or kernel listed or newer in the Installation page of IPEX linked above for Windows and Linux if needed.
1. Follow the instructions to install [Intel's oneAPI Basekit](https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html) for your platform.
1. Install the packages for IPEX using the instructions provided in the Installation page for your platform.
1. Follow the [ComfyUI manual installation](#manual-install-windows-linux) instructions for Windows and Linux and run ComfyUI normally as described above after everything is installed.

Additional discussion and help can be found [here](https://github.com/comfyanonymous/ComfyUI/discussions/476).

#### Apple Mac silicon

You can install ComfyUI in Apple Mac silicon (M1 or M2) with any recent macOS version.

1. Install pytorch nightly. For instructions, read the [Accelerated PyTorch training on Mac](https://developer.apple.com/metal/pytorch/) Apple Developer guide (make sure to install the latest pytorch nightly).
1. Follow the [ComfyUI manual installation](#manual-install-windows-linux) instructions for Windows and Linux.
1. Install the ComfyUI [dependencies](#dependencies). If you have another Stable Diffusion UI [you might be able to reuse the dependencies](#i-already-have-another-ui-for-stable-diffusion-installed-do-i-really-have-to-install-all-of-these-dependencies).
1. Launch ComfyUI by running `python main.py`

> **Note**: Remember to add your models, VAE, LoRAs etc. to the corresponding Comfy folders, as discussed in [ComfyUI manual installation](#manual-install-windows-linux).

#### DirectML (AMD Cards on Windows)

```pip install torch-directml``` Then you can launch ComfyUI with: ```python main.py --directml```

# Running

```python main.py```

### For AMD cards not officially supported by ROCm

Try running it with this command if you have issues:

For 6700, 6600 and maybe other RDNA2 or older: ```HSA_OVERRIDE_GFX_VERSION=10.3.0 python main.py```

For AMD 7600 and maybe other RDNA3 cards: ```HSA_OVERRIDE_GFX_VERSION=11.0.0 python main.py```

# Notes

Only parts of the graph that have an output with all the correct inputs will be executed.

Only parts of the graph that change from each execution to the next will be executed, if you submit the same graph twice only the first will be executed. If you change the last part of the graph only the part you changed and the part that depends on it will be executed.

Dragging a generated png on the webpage or loading one will give you the full workflow including seeds that were used to create it.

You can use () to change emphasis of a word or phrase like: (good code:1.2) or (bad code:0.8). The default emphasis for () is 1.1. To use () characters in your actual prompt escape them like \\( or \\).

You can use {day|night}, for wildcard/dynamic prompts. With this syntax "{wild|card|test}" will be randomly replaced by either "wild", "card" or "test" by the frontend every time you queue the prompt. To use {} characters in your actual prompt escape them like: \\{ or \\}.

Dynamic prompts also support C-style comments, like `// comment` or `/* comment */`.

To use a textual inversion concepts/embeddings in a text prompt put them in the models/embeddings directory and use them in the CLIPTextEncode node like this (you can omit the .pt extension):

```embedding:embedding_filename.pt```


## How to show high-quality previews?

Use ```--preview-method auto``` to enable previews.

The default installation includes a fast latent preview method that's low-resolution. To enable higher-quality previews with [TAESD](https://github.com/madebyollin/taesd), download the [taesd_decoder.pth, taesdxl_decoder.pth, taesd3_decoder.pth and taef1_decoder.pth](https://github.com/madebyollin/taesd/) and place them in the `models/vae_approx` folder. Once they're installed, restart ComfyUI and launch it with `--preview-method taesd` to enable high-quality previews.

## How to use TLS/SSL?
Generate a self-signed certificate (not appropriate for shared/production use) and key by running the command: `openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"`

Use `--tls-keyfile key.pem --tls-certfile cert.pem` to enable TLS/SSL, the app will now be accessible with `https://...` instead of `http://...`.

> Note: Windows users can use [alexisrolland/docker-openssl](https://github.com/alexisrolland/docker-openssl) or one of the [3rd party binary distributions](https://wiki.openssl.org/index.php/Binaries) to run the command example above. 
<br/><br/>If you use a container, note that the volume mount `-v` can be a relative path so `... -v ".\:/openssl-certs" ...` would create the key & cert files in the current directory of your command prompt or powershell terminal.

## Support and dev channel

[Matrix space: #comfyui_space:matrix.org](https://app.element.io/#/room/%23comfyui_space%3Amatrix.org) (it's like discord but open source).

See also: [https://www.comfy.org/](https://www.comfy.org/)

## Frontend Development

As of August 15, 2024, we have transitioned to a new frontend, which is now hosted in a separate repository: [ComfyUI Frontend](https://github.com/Comfy-Org/ComfyUI_frontend). This repository now hosts the compiled JS (from TS/Vue) under the `web/` directory.

### Reporting Issues and Requesting Features

For any bugs, issues, or feature requests related to the frontend, please use the [ComfyUI Frontend repository](https://github.com/Comfy-Org/ComfyUI_frontend). This will help us manage and address frontend-specific concerns more efficiently.

### Using the Latest Frontend

The new frontend is now the default for ComfyUI. However, please note:

1. The frontend in the main ComfyUI repository is updated weekly.
2. Daily releases are available in the separate frontend repository.

To use the most up-to-date frontend version:

1. For the latest daily release, launch ComfyUI with this command line argument:

   ```
   --front-end-version Comfy-Org/ComfyUI_frontend@latest
   ```

2. For a specific version, replace `latest` with the desired version number:

   ```
   --front-end-version Comfy-Org/ComfyUI_frontend@1.2.2
   ```

This approach allows you to easily switch between the stable weekly release and the cutting-edge daily updates, or even specific versions for testing purposes.

### Accessing the Legacy Frontend

If you need to use the legacy frontend for any reason, you can access it using the following command line argument:

```
--front-end-version Comfy-Org/ComfyUI_legacy_frontend@latest
```

This will use a snapshot of the legacy frontend preserved in the [ComfyUI Legacy Frontend repository](https://github.com/Comfy-Org/ComfyUI_legacy_frontend).

# QA

### Which GPU should I buy for this?

[See this page for some recommendations](https://github.com/comfyanonymous/ComfyUI/wiki/Which-GPU-should-I-buy-for-ComfyUI)

