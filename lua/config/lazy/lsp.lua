return {
  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'ray-x/lsp_signature.nvim',
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

  -- LSP signature help
  {
    'ray-x/lsp_signature.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.lsp_signature')
    end,
  },

  -- Null-ls for formatters and linters
  {
    'nvimtools/none-ls.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.null_ls')
    end,
  },
}
