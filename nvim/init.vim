syntax on
filetype plugin indent on
set filetype=on

set number relativenumber
set nowrap
set showmatch
set termguicolors
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

" showmode is handled by lualine
set noshowmode

set undolevels=1000
set backspace=indent,eol,start

set updatetime=50

set colorcolumn=80

set signcolumn=yes

let mapleader = " "

let $VIMDIR = "$HOME/.config/nvim"
source $VIMDIR/plugin.vim

" This allows for automatic plugin install
" It will prevent from loading plugin specific settings causing errors if the
" plugin has not been installed yet.
if $PLUGINSTALL != 1
	source $VIMDIR/plugin_settings.vim
	source $VIMDIR/typings.vim
	source $VIMDIR/keybindings.vim
	source $VIMDIR/mouse.vim
	source $VIMDIR/clipboard.vim
endif

