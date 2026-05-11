return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPost',
    build = ':TSUpdate',
    config = function()
      require('config.plugin.treesitter')
    end,
  },
}
