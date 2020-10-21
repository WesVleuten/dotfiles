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

# Rust LSP
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-src
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
echo "source $HOME/.cargo/env" >> ~/.zshrc.ext

