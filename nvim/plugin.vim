call plug#begin('~/.config/nvim/autoload/plugged')

" Trying out zone
Plug 'kosayoda/nvim-lightbulb'
Plug 'ThePrimeagen/harpoon'

" Airline replacement
Plug 'hoob3rt/lualine.nvim'

" Easy navigation across splits and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" LSP setup
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Telescope and it's requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" AYU, greatest theme of all time
Plug 'ayu-theme/ayu-vim'

" Easy commenting out code
Plug 'tpope/vim-commentary'

" Indentation visualizer
Plug 'Yggdroot/indentLine'

" Awesome git wrapper
Plug 'tpope/vim-fugitive'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Better JSON highlighting and visualizing
Plug 'elzr/vim-json'

call plug#end()

