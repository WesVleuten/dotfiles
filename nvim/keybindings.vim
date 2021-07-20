
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gtd <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
" Goto previous/next diagnostic warning/error
nnoremap <leader>gp <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <leader>gn <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

" Go string
nnoremap <leader>gs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" Go word
nnoremap <leader>gw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>

" Hover and Help
nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR>

" v for version control
nmap <leader>vs :Git<CR>
nnoremap <leader>vc :Git commit<CR>
nnoremap <leader>vf :Git fetch --all<CR>
nnoremap <leader>vp :Git push<CR>
nnoremap <leader>vP :Git pull<CR>
nnoremap <leader>vb :GitBlameToggle<CR>

" git_files can't show untracked files, find_files can, will ignore gitignores
" with fd (installable with 'apt install fd-find')
nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <leader>ft <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <leader>fb <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <leader>fa <cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>

" Reload vimrc
nnoremap <leader>R :source $MYVIMRC<CR>

" Tmux compatible split navigation
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-/> :TmuxNavigatePrevious<CR>

" Move block up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep visual selection when indenting
xnoremap > >gv
xnoremap < <gv

" Clear seach highlighting on <Esc>
nnoremap <Esc> <Cmd>nohlsearch<CR>

" Sort lines alphabetically
vnoremap <leader>s :sort<CR>

" Harpoon
nnoremap <leader>ha :lua require("harpoon.mark").toggle_file()<CR>
nnoremap <leader>hl :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hc :lua require("harpoon.mark").clear_all()<CR>

