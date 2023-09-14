
lua <<EOF

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<F9>', require 'dap'.toggle_breakpoint)

vim.api.nvim_set_hl(0, "red", { fg = "#FF0000" }) 
vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" }) 
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" }) 
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" }) 
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" }) 

vim.fn.sign_define('DapBreakpoint', {text='•', texthl='red', linehl='', numhl=''})



require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
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

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"]=function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
    dapui.close()
end


EOF

" vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
" vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})_

