return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.gitsigns')
    end,
  },
}
