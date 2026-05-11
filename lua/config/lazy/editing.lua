return {
  -- Surround text objects
  {
    'kylechui/nvim-surround',
    event = 'BufReadPost',
    config = function()
      require('nvim-surround').setup({})
    end,
  },

  -- Auto-closing pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- Motion with leap
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('config.plugin.leap')
    end,
  },

  -- Repeat support for vim-repeat
  'tpope/vim-repeat',

  -- Quick commenting
  {
    'terrortylor/nvim-comment',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.nvim_comment')
    end,
  },

  -- Stay centered while scrolling
  {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
      require('config.plugin.stay_centered')
    end,
  },

  -- Undo tree
  {
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
      require('config.plugin.undotree')
    end,
  },

  -- Highlight word under cursor
  {
    'RRethy/vim-illuminate',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.illuminate')
    end,
  },
}
