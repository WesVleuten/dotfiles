lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        sorting_strategy = "ascending",
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = "top",
        },
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        mappings = {
            n = {
                ["<esc>"] = actions.close
            }
        }
    }
}
EOF

