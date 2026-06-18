return {
  -- Scratchpad notes
  {
    'mzguntalan/scratchpad.nvim',
    cmd = { 'ScratchpadCreate', 'ScratchpadRead' },
    config = function()
      require('config.plugin.scratchpad')
    end,
  },

  -- Symbol outline: functions and classes in current buffer
  {
    'stevearc/aerial.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('config.plugin.aerial')
    end,
  },

  -- Diagnostics panel: errors, warnings, hints
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    config = function()
      require('config.plugin.trouble')
    end,
  },
}
