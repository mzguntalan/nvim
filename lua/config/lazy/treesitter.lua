return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = 'v0.9.3',  -- last version with pre-compiled parser downloads; no tree-sitter-cli needed
    event = 'BufReadPost',
    build = ':TSUpdate',
    config = function()
      require('config.plugin.treesitter')
    end,
  },
}
