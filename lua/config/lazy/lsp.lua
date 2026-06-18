return {
  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'nvimtools/none-ls.nvim',
    },
    config = function()
      require('config.plugin.lsp')
    end,
  },

  -- LSP server installer
  {
    'williamboman/mason.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.mason')
    end,
  },

  -- Bridge between mason and lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    event = 'BufReadPost',
  },

  -- None-ls for formatters and linters
  {
    'nvimtools/none-ls.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.null_ls')
    end,
  },
}
