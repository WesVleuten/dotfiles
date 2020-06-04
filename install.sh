
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
if [ ! -d /usr/share/fonts/truetype/meslolgs ]; then
	sudo bash -c "mkdir -p /usr/share/fonts/truetype/meslolgs && ln -s $HOME/.dotfiles/zsh/powerlevel10k-media/MesloLGS*.ttf /usr/share/fonts/truetype/meslolgs"
fi

# install tmux config
if [ -f $HOME/.tmux.conf ] && [ ! -L $HOME/.tmux.conf ]; then
	mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
