return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.plugin.telescope')
    end,
  },

  -- Plenary utility library (dependency)
  'nvim-lua/plenary.nvim',
}
