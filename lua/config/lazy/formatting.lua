return {
  -- Prettier integration
  {
    'MunifTanjim/prettier.nvim',
    event = 'BufReadPost',
    config = function()
      require('config.plugin.prettier')
    end,
  },

  -- Markdown support
  {
    'preservim/vim-markdown',
    ft = 'markdown',
    config = function()
      require('config.plugin.markdown')
    end,
  },
}
