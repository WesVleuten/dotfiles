" colorscheme ayu
let ayucolor="dark"
colorscheme ayu
set background=dark

" IndentLine {{
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" Airline settings
let g:airline#extensions#tabline#enabled = 1

" LSP SETUP
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = [ 'exact', 'substring', 'fuzzy' ]

lua <<EOF

local on_attach = function(client)
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)
end

require'nvim_lsp'.pyls.setup({ on_attach=on_attach })
require'nvim_lsp'.tsserver.setup({ on_attach=on_attach })
require'nvim_lsp'.clangd.setup({ on_attach=on_attach })
require'nvim_lsp'.rust_analyzer.setup({ on_attach=on_attach })

EOF

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
 \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

lua <<EOF
require('telescope').setup{
	defaults = {
		sorting_strategy = "ascending",
		prompt_position = "top",
		show_pluto = true,
		shorten_path = true,
		layout_strategy = 'horizontal',
		preview_cutoff = 79,
		winblend = 0,
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
	}
}
EOF

