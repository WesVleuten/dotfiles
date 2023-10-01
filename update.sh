#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O /opt/nvim
chmod +x /opt/nvim


PLUGINSTALL=1 /opt/nvim -c "PlugUpgrade" -c "PlugUpdate" -c "qa"

