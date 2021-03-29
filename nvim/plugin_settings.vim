" colorscheme ayu
let ayucolor="dark"
colorscheme ayu
set background=dark

" Startup harpoon
lua require('harpoon').setup()

" Allow tmux navigator remappings
let g:tmux_navigator_no_mappings = 1

" Lualine
let g:lualine = {
    \'options' : {
    \  'theme' : 'ayu_dark',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['|', '|'],
    \  'icons_enabled' : v:true,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'lower': v:true,},], ],
    \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
    \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
    \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
    \  'lualine_y' : [ 'progress' ],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [  ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ ],
    \}
lua require('lualine').setup()

" LSP SETUP
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = [ 'exact', 'substring', 'fuzzy' ]

lua <<EOF

local on_attach = function(client)
	require'completion'.on_attach(client)
end

require'lspconfig'.jedi_language_server.setup({ on_attach=on_attach })
require'lspconfig'.tsserver.setup({ on_attach=on_attach })
require'lspconfig'.clangd.setup({ on_attach=on_attach })
require'lspconfig'.rust_analyzer.setup({ on_attach=on_attach })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    }
)
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
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

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

" Disable ugly vim's ugly json formatting
autocmd Filetype json
            \ let g:indentLine_setConceal = 0 |
            \ let g:vim_json_syntax_conceal = 0
