return {
  -- Lean theorem prover
  {
    'Julian/lean.nvim',
    ft = 'lean',
    config = function()
      require('config.plugin.lean')
    end,
  },

  -- Haskell development tools
  {
    'mrcjkb/haskell-tools.nvim',
    ft = 'haskell',
  },

  -- Rust development tools
  {
    'mrcjkb/rustaceanvim',
    ft = 'rust',
  },

  -- Elixir development tools
  {
    'elixir-tools/elixir-tools.nvim',
    ft = 'elixir',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Postgres LSP
  {
    'supabase-community/postgres_lsp',
    ft = 'sql',
  },
}
