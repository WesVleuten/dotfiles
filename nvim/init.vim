syntax on
filetype plugin indent on
set filetype=on

set number relativenumber
set nowrap
set showmatch
set visualbell
set termguicolors
set noshowmode
set scrolloff=8
set nohlsearch
set hidden
set noerrorbells

set incsearch
set ignorecase
set smartcase

set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set autoindent
set shiftwidth=4
set smartindent
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set termguicolors

set ruler

set undolevels=1000
set backspace=indent,eol,start

set updatetime=50

set colorcolumn=80

set signcolumn=yes

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
