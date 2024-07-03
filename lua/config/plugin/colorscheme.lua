local tokyonight = require("tokyonight")


tokyonight.setup({
    style = 'day',
    day_brightness = 0.4,
    transparent = vim.g.neovide == true,
    -- on_colors = function(colors) 
    --     colors.bg = '#000000'
    -- end,
    on_highlights = function(hl, c)
    local prompt = "#2d3149"
    -- hl.TelescopeNormal = {
    --   bg = c.bg_light,
    --   fg = c.bg_light,
    -- }
    -- hl.TelescopeBorder = {
    --   bg = c.bg_dark,
    --   fg = c.bg_dark,
    -- }
    -- hl.TelescopePromptNormal = {
    --   bg = prompt,
    -- }
    -- hl.TelescopePromptBorder = {
    --   bg = prompt,
    --   fg = prompt,
    -- }
    -- hl.TelescopePromptTitle = {
    --   bg = prompt,
    --   fg = prompt,
    -- }
    -- hl.TelescopePreviewTitle = {
    --   bg = c.bg_dark,
    --   fg = c.bg_dark,
    -- }
    -- hl.TelescopeResultsTitle = {
    --   bg = c.bg_dark,
    --   fg = c.bg_dark,
    -- }
  end,
})

vim.cmd("colorscheme tokyonight")

