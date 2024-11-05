local tokyonight = require("tokyonight")

vim.opt.background = "light"

tokyonight.setup({
    style = 'day',
    day_brightness = 0.4,
    transparent = false,
    on_colors = function(colors) 
        colors.bg = '#ffffff'
        colors.bg_float = '#ffffff'
        colors.bg_visual = '#edf8ff'
        colors.bg_dark = '#edf8ff'
    end,
    on_highlights = function(highlights, colors)

    end,
})

vim.cmd("colorscheme tokyonight")

