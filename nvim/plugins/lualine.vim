lua <<EOF
local custom_ayu = require'lualine.themes.ayu_dark'
custom_ayu.normal.c.bg = 'none'

require('lualine').setup{
    options = {
        theme = custom_ayu,
        section_separators = {'', ''},
        component_separators = {'|', '|'},
        icons_enabled = true,
    },
    sections = {
      lualine_a = { {'mode', {lower = true} } },
      lualine_b = { {'branch', {icon = '' } }  },
      lualine_c = { {'filename', {file_status = true } }  },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {  },
    },
    extensions = { },
}
EOF

