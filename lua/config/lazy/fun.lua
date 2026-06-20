return {
  -- Cats that wander the buffer, cooked into Chinese food emoji
  {
    'tamton-aquib/duck.nvim',
    keys = { '<leader>zcc', '<leader>zxc', '<leader>zxx' },
    config = function()
      require('config.plugin.duck')
    end,
  },

  -- Dim everything outside the function/block you're working in
  {
    'folke/twilight.nvim',
    cmd = 'Twilight',
    keys = { '<leader>tw' },
    config = function()
      require('config.plugin.twilight')
    end,
  },
}
