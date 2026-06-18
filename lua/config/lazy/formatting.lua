return {
  -- Markdown support (folding, syntax, etc.)
  {
    'preservim/vim-markdown',
    ft = 'markdown',
    config = function()
      require('config.plugin.markdown')
    end,
  },
}
