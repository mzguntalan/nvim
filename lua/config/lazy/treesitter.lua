return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',   -- frozen branch; downloads pre-compiled parsers, no tree-sitter-cli needed
    event = 'BufReadPost',
    build = ':TSUpdate',
    config = function()
      require('config.plugin.treesitter')
    end,
  },
}
