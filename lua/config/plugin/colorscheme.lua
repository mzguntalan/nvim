-- vim.o.background = 'light'
--
-- -- Default options
-- require("modus-themes").setup({
-- 	-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
-- 	-- `auto` will automatically set style based on background set with vim.o.background
-- 	style = "auto",
-- 	variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
-- 	transparent = false, -- Transparent background (as supported by the terminal)
-- 	dim_inactive = false, -- "non-current" windows are dimmed
-- 	hide_inactive_statusline = false, -- Hide statuslines on inactive windows. Works with the standard **StatusLine**, **LuaLine** and **mini.statusline**
-- 	styles = {
-- 		-- Style to be applied to different syntax groups
-- 		-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 		comments = { italic = true },
-- 		keywords = { italic = true },
-- 		functions = {},
-- 		variables = {},
-- 	},
--
-- 	--- You can override specific color groups to use other groups or a hex color
-- 	--- Function will be called with a ColorScheme table
-- 	--- Refer to `extras/lua/modus_operandi.lua` or `extras/lua/modus_vivendi.lua` for the ColorScheme table
-- 	---@param colors ColorScheme
-- 	on_colors = function(colors) end,
--
-- 	--- You can override specific highlights to use other groups or a hex color
-- 	--- Function will be called with a Highlights and ColorScheme table
-- 	--- Refer to `extras/lua/modus_operandi.lua` or `extras/lua/modus_vivendi.lua` for the Highlights and ColorScheme table
-- 	---@param highlights Highlights
-- 	---@param colors ColorScheme
-- 	on_highlights = function(highlights, colors) end,
-- })
--
-- vim.cmd.colorscheme 'modus'
--
-- vim.o.background = 'light'
-- vim.cmd.colorscheme 'edge'
--
--
-- vim.o.background = 'dark'

-- local palettes = {
--     all = {
--         bg1 = '#ffffff', 
--         bg0 = '#ffffff', 
--         sel0 = '#dfdfff',
--         comment = '#bbbbbb',
--         white = '#696969',
--         fg0 = '#696969',
--         -- white = '#696969',
--     }
-- }
--
-- local specs = {
--     all = {
--         syntax = {
--             value = 'white'
--         }
--     }
--
-- }
--
-- -- Default options
-- require('nightfox').setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--     compile_file_suffix = "_compiled", -- Compiled file suffix
--     transparent = false,     -- Disable setting background
--     terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false,    -- Non focused panes set to alternative background
--     module_default = true,   -- Default enable value for modules
--     colorblind = {
--       enable = false,        -- Enable colorblind support
--       simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
--       severity = {
--         protan = 0,          -- Severity [0,1] for protan (red)
--         deutan = 0,          -- Severity [0,1] for deutan (green)
--         tritan = 0,          -- Severity [0,1] for tritan (blue)
--       },
--     },
--     styles = {               -- Style to be applied to different syntax groups
--       comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
--       conditionals = "NONE",
--       constants = "NONE",
--       functions = "NONE",
--       keywords = "NONE",
--       numbers = "NONE",
--       operators = "NONE",
--       strings = "NONE",
--       types = "NONE",
--       variables = "NONE",
--     },
--     inverse = {             -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--     modules = {             -- List of various plugins and additional options
--       -- ...
--     },
--   },
--   palettes = palettes,
--   specs = specs,
--   groups = {},
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme carbonfox")

vim.opt.background = "light" -- set this to dark or light

local tokyonight = require("tokyonight")


tokyonight.setup({
    style = 'day',
    day_brightness = 0.4,
    on_colors = function(colors) 
        colors.bg = '#000000'
    end,
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

