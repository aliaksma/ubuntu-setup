#!/bin/bash

# Author: Aliaksandr Matskevich <aliaksmats@gmail.com>
# License: GNU GPL v3+
# URL: https://github.com/aliaksma/ubuntu-setup

set -e

splash='=========================
===== UBUNTU SETUP ======
========================='

echo -e "$splash"
echo "=> Ubuntu Setup is for fresh Ubuntu 24.04 installation only!"
echo -e "\nBegin installation (or abort with Ctrl+c)...\n"

# Remove any old copies of setup
if [ -d "$HOME/.local/share/ubuntu-setup" ]; then
    rm -rf "$HOME/.local/share/ubuntu-setup"
fi

echo "Cloning Ubuntu Setup files..."
git clone --quiet https://github.com/aliaksma/ubuntu-setup.git ~/.local/share/ubuntu-setup

echo "Starting installer..."
source "$HOME/.local/share/ubuntu-setup/install.sh"
