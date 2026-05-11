return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.plugin.telescope')
    end,
  },

  -- Plenary utility library (dependency)
  'nvim-lua/plenary.nvim',
}
