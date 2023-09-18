
lua <<EOF

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<F9>', require 'dap'.toggle_breakpoint)

vim.keymap.set('n', '<leader>dc', require 'dap'.continue)
vim.keymap.set('n', '<leader>db', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>dh', require 'dap.ui.widgets'.hover)
vim.keymap.set('n', '<leader>dr', require 'dap'.repl.toggle)

vim.api.nvim_set_hl(0, "red", { fg = "#FF0000" }) 
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" }) 

vim.fn.sign_define('DapBreakpoint', {text='•', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='green', linehl='', numhl=''})

require('dap-go').setup {
    dap_configurations = {
        {
            type = "go",
            name = "Debug current file",
            request = "launch",
            program = "${file}",
        }
    }
}

require('dap.ext.vscode').load_launchjs(nil, {})

EOF

