return {
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('config.plugin.colorscheme')
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.plugin.lualine')
    end,
  },

  -- Transparent background
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('config.plugin.transparent')
    end,
  },

  -- File icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
}
