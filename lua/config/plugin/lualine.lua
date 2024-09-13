

local mode_icons = {
   n =          " (=^-ω-^=) ",
   nt =         " (=^-ω-^=) ",
   i =          "d(=^･ω･^=)b",
   R =          "=＾● ⋏ ●＾=",
   v =          " ミ๏ｖ๏彡  ",
   V =          " ミ๏ｖ๏彡  ",
   no =         " (^-人-^)  ",
   ["\22"] =    " (^-人-^)  ",
   t =          "  (*^ω^*)  ",
   ['!'] =      "  (^._.^)ﾉ ",
   c =          " ｡＾･ｪ･＾｡ ",
   s =          "  (=;ω;=)  "
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
        
    },
    sections = {
        lualine_a = {{
            'mode',
            fmt = function(str)
                return "𝐙| " .. (mode_icons[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode) 
            end,
            color = { fg="#ffffff" },

        }},
        lualine_b = {
            {'branch', color={fg="#ffffff"}}, 
            {'diff', color={fg="#ff0000"}}, 
            {'diagnostics', color={fg="#ffffff"}}
        },
        lualine_c = {{'filename', color={fg="#ffffff"}}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
