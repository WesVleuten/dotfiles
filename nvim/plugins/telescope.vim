lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        sorting_strategy = "ascending",
        prompt_position = "top",
        layout_strategy = 'horizontal',
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        mappings = {
            n = {
                ["<esc>"] = actions.close
            }
        }
    }
}
EOF

