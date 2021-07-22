#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O /opt/nvim.appimage
chmod +x /opt/nvim.appimage

PLUGINSTALL=1 /opt/nvim.appimage -c "PlugUpgrade" -c "PlugUpdate" -c "qa"

