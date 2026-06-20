return {
  -- Cats that wander the buffer, cooked into Chinese food emoji
  {
    'tamton-aquib/duck.nvim',
    keys = {
      { '<leader>zcc', function() require('config.plugin.duck').spawn() end, desc = 'Duck: spawn cat' },
      { '<leader>zxc', function() require('config.plugin.duck').cook() end, desc = 'Duck: cook nearest cat' },
      { '<leader>zxx', function() require('config.plugin.duck').cook_all() end, desc = 'Duck: cook all cats' },
    },
  },

  -- Dim everything outside the function/block you're working in
  {
    'folke/twilight.nvim',
    cmd = 'Twilight',
    keys = {
      { '<leader>tw', '<cmd>Twilight<CR>', desc = 'Twilight: toggle focus dimming' },
    },
    config = function()
      require('config.plugin.twilight')
    end,
  },
}
