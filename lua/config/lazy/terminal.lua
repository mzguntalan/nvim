return {
  {
    'akinsho/toggleterm.nvim',
    event = "VeryLazy",
    -- cmd = 'ToggleTerm',
    config = function()
      require('config.plugin.toggleterm')
    end,
  },
}
