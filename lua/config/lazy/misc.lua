return {
  -- Scratchpad notes
  {
    'mzguntalan/scratchpad.nvim',
    cmd = { 'ScratchpadCreate', 'ScratchpadRead' },
    config = function()
      require('config.plugin.scratchpad')
    end,
  },
}
