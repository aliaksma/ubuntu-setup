#!/bin/bash

# Author: Aliaksandr Matskevich <aliaksmats@gmail.com>
# License: GNU GPL v3+
# URL: https://github.com/aliaksma/ubuntu-setup

set -e

splash='=========================
===== UBUNTU SETUP ======
========================='

echo -e "$splash"
echo "=> Ubuntu setup is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)...\n"

# Remove any old copies of setup
if [ -d "$HOME/.local/share/ubuntu-setup" ]; then
    rm -rf "$HOME/.local/share/ubuntu-setup"
fi

echo "Cloning Ubuntu Setup files..."
git clone --quiet https://github.com/aliaksma/ubuntu-setup.git ~/.local/share/ubuntu-setup

echo "Starting installer..."
source ~/.local/share/omakub/install.sh
