#!/bin/bash
sudo apt install -y git curl

# Python LSP
sudo apt install -y python3-pip
pip3 install 'python-language-server[all]'

# Typescript LSP
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs build-essential
sudo npm install -g typescript-language-server

# Clang LSP
sudo apt install -y clangd-9
