return {
  -- Jupyter notebook integration
  {
    'kiyoon/jupynium.nvim',
    ft = { '*.ju.*', 'markdown' },
    dependencies = { 'nvim-notify', 'dressing.nvim' },
    config = function()
      require('config.plugin.jupynium')
    end,
  },

  -- Notifications (for Jupynium)
  {
    'rcarriga/nvim-notify',
    lazy = true,
  },

  -- UI components (for Jupynium kernel select)
  {
    'stevearc/dressing.nvim',
    lazy = true,
  },

  -- AI vibes with ollama
  {
    'mzguntalan/vibe-level.nvim',
    cmd = 'VibeLevelToggle',
  },
}
