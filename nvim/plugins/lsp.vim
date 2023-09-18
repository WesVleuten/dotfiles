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
require'lspconfig'.gopls.setup({ on_attach=on_attach })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    }
)

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

require'lsp_signature'.setup {
  bind = true,
  doc_lines = 5,
  floating_window = true,
  hint_enable = false,
  handler_opts = {border = "none"},
  extra_trigger_chars = {"(", ","},
}

EOF

