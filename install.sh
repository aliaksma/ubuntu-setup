#!/bin/bash

# Author: Aliaksandr Matskevich <aliaksmats@gmail.com>
# License: GNU GPL v3+
# URL: https://github.com/aliaksma/ubuntu-setup

# Shell exits immediatley if any command
# returns a non-zero status (an error)
set -e

# Give people a chance to retry running the installation
trap 'echo "Ubuntu setup failed! You can retry by running: source ~/.local/share/ubuntu-setup/install.sh"' ERR

# If user is running Gnome this ensures computer
# doesn't go to sleep or lock while installing
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    # Change Gnome idle and lock settings
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0

    echo "Installing terminal and desktop tools..."

    # Install terminal tools
#    source ~/.local/share/omakub/install/terminal.sh

    # Install desktop tools and tweaks
#    source ~/.local/share/omakub/install/desktop.sh

    # Revert to normal idle and lock settings
    gsettings set org.gnome.desktop.screensaver lock-enabled true
    gsettings set org.gnome.desktop.session idle-delay 300
else
    echo "Only installing terminal tools..."
#    source ~/.local/share/omakub/install/terminal.sh
fi
