return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'nvimtools/none-ls.nvim',
      -- cmp_nvim_lsp must be available before lsp.lua runs
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- mason must be set up before mason-lspconfig
      require('mason').setup()
      require('config.plugin.lsp')
    end,
  },

  { 'williamboman/mason.nvim',           lazy = true },
  { 'williamboman/mason-lspconfig.nvim', lazy = true },

  {
    'nvimtools/none-ls.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.null_ls')
    end,
  },
}
