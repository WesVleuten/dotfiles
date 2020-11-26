syntax on
filetype plugin indent on
set filetype=on

set number relativenumber
set linebreak
set showbreak=$+
set textwidth=80
set showmatch
set visualbell
set noswapfile
set termguicolors
set noshowmode
set scrolloff=8
set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set termguicolors

set ruler

set undolevels=1000
set backspace=indent,eol,start

set updatetime=50

set colorcolumn=80

let mapleader = " "

source $HOME/.config/nvim/plugin.vim

" This allows for automatic plugin install
" It will prevent from loading plugin specific settings causing errors if the
" plugin has not been installed yet.
if $PLUGINSTALL != 1
	source $HOME/.config/nvim/plugin_settings.vim
	source $HOME/.config/nvim/typings.vim
	source $HOME/.config/nvim/keybindings.vim
endif
