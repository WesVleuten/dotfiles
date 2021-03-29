
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references{}<CR>

nnoremap <leader>R :source $MYVIMRC<CR>
nnoremap <leader>bd :bd<CR>

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-/> :TmuxNavigatePrevious<CR>

nmap <leader>gs :G<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>vim.lsp.diagnostic.goto_next()<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>

" git_files can't show untracked files, find_files can, will ignore gitignores
" with fd (installable with 'apt install fd-find')
nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <leader>fb <cmd>lua require'telescope.builtin'.buffers{}<CR>

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
nnoremap <C-m> :lua require("harpoon.mark").toggle_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hc :lua require("harpoon.mark").clear_all()<CR>

