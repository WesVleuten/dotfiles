call plug#begin('~/.config/nvim/autoload/plugged')

" Trying out zone
Plug 'kosayoda/nvim-lightbulb'
Plug 'ThePrimeagen/harpoon'
Plug 'f-person/git-blame.nvim'
Plug 'tomlion/vim-solidity'
Plug 'rust-lang/rust.vim'

" Airline replacement
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Easy navigation across splits and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'leoluz/nvim-dap-go'

" LSP setup
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

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
Plug 'nvim-treesitter/nvim-treesitter'

" Better JSON highlighting and visualizing
Plug 'elzr/vim-json'

" Tree
Plug 'preservim/nerdtree'

call plug#end()

