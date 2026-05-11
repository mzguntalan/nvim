return {
  -- Completion engine
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'petertriho/cmp-git',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('config.plugin.cmp')
    end,
  },

  -- Snippet source for cmp
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',

  -- Snippet engine
  {
    'hrsh7th/vim-vsnip',
    event = 'InsertEnter',
  },

  -- Snippet completion source
  {
    'hrsh7th/cmp-vsnip',
    event = 'InsertEnter',
  },

  -- Git completion
  {
    'petertriho/cmp-git',
    event = 'InsertEnter',
  },

  -- Icons for completion
  {
    'onsails/lspkind.nvim',
    event = 'InsertEnter',
  },
}
