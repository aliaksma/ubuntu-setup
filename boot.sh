#!/bin/bash

# Author: Aliaksandr Matskevich <aliaksmats@gmail.com>
# License: GNU GPL v3+
# URL: https://github.com/aliaksma/ubuntu-setup

# This is the starting point of the setup script.
# It installs git, clones the repo to the users home file system
# and starts the installer/setup

# Shell exits immediatley if any command
# returns a non-zero status (an error)
set -e

splash='=========================
===== UBUNTU SETUP ======
========================='

echo -e "$splash"
echo "=> Ubuntu Setup is for fresh Ubuntu 24.04 installation only!"
echo -e "\nBegin installation (or abort with Ctrl+c)...\n"

# Update Ubuntu's local package index
echo "Updating local package index..."
sudo apt-get update >/dev/null
echo "Done updating..."

# Install git
echo "Installing git..."
sudo apt-get install -y git >/dev/null

# Remove any old copies of ubuntu-setup dir if they exist
if [ -d "$HOME/.local/share/ubuntu-setup" ]; then
    rm -rf "$HOME/.local/share/ubuntu-setup"
fi

# Clone repo from github to ~/.local/share/ubuntu-setup
echo "Cloning Ubuntu Setup files..."
git clone --quiet https://github.com/aliaksma/ubuntu-setup.git "$HOME/.local/share/ubuntu-setup"

echo "Starting installer..."
source "$HOME/.local/share/ubuntu-setup/install.sh"
