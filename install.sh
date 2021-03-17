#!/bin/bash
echo "Eyo wassup, itsjaboi"

echo "Updating git"
git config --global user.email "16665772+WesVleuten@users.noreply.github.com";
git config --global user.name "Wes van der Vleuten";

if [ ! -f /etc/apt/sources.list.d/yubico-ubuntu-stable-focal.list ]; then
	sudo apt-add-repository ppa:yubico/stable
fi

if [ ! -f /etc/apt/sources.list.d/brave-browser-release.list ]; then
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
fi

sudo apt update
sudo apt install -y zsh apt-transport-https curl neofetch git wget build-essential yubikey-manager-qt brave-browser fd-find ripgrep

sudo chown westar:westar /opt
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O /opt/nvim.appimage
chmod +x /opt/nvim.appimage

# install zshrc
if [ -f $HOME/.zshrc ] && [ ! -L $HOME/.zshrc ]; then
	mv $HOME/.zshrc $HOME/.zshrc.bak
fi
ln -sf $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc

# install oh my zsh
ln -sf $HOME/.dotfiles/zsh/ohmyzsh $HOME/.oh-my-zsh
mkdir -p $HOME/.oh-my-zsh/custom/plugins
mkdir -p $HOME/.oh-my-zsh/custom/themes

# install powerlevel10k
ln -sf $HOME/.dotfiles/zsh/powerlevel10k $HOME/.oh-my-zsh/custom/themes/powerlevel10k
if [ -f $HOME/.p10k.zsh ] && [ ! -L $HOME/.p10k.zsh ]; then
	mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bak
fi
ln -sf $HOME/.dotfiles/zsh/p10k.zsh $HOME/.p10k.zsh

# install fonts
if [[ "$OSTYPE" != "darwin"* ]]; then
	if [ ! -d /usr/share/fonts/truetype/meslolgs ]; then
		sudo bash -c "mkdir -p /usr/share/fonts/truetype/meslolgs && ln -s $HOME/.dotfiles/zsh/powerlevel10k-media/MesloLGS*.ttf /usr/share/fonts/truetype/meslolgs"
	fi
fi

# install tmux config
if [ -f $HOME/.tmux.conf ] && [ ! -L $HOME/.tmux.conf ]; then
	mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# install nvim config and plugins
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim
source $HOME/.zshrc
PLUGINSTALL=1 nvim -c "PlugUpgrade" -c "PlugUpdate" -c "qa"

# Python LSP
sudo apt install -y python3-pip
pip install -U jedi-language-server

# Typescript LSP
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs build-essential
sudo npm install -g typescript-language-server

# Clang LSP
sudo apt install -y clangd-9

# Rust LSP
if ! command -v rustc &> /dev/null
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup component add rust-src
	curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
	chmod +x ~/.local/bin/rust-analyzer
	grep "source $HOME/.cargo/asdfenv" ~/.zshrc.ext || echo "source $HOME/.cargo/env" >> ~/.zshrc.ext
fi


