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

