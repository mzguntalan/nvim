-- Registry of all plugins for lazy.nvim
-- Each require() loads a plugin group file

local plugins = {}

-- Core LSP stack
table.insert(plugins, require('config.lazy.lsp'))

-- Completion
table.insert(plugins, require('config.lazy.completion'))

-- UI and visual
table.insert(plugins, require('config.lazy.ui'))

-- Syntax highlighting
table.insert(plugins, require('config.lazy.treesitter'))

-- Fuzzy finder
table.insert(plugins, require('config.lazy.telescope'))

-- Git integration
table.insert(plugins, require('config.lazy.git'))

-- Editing enhancements
table.insert(plugins, require('config.lazy.editing'))

-- Code formatting
table.insert(plugins, require('config.lazy.formatting'))

-- Terminal
table.insert(plugins, require('config.lazy.terminal'))

-- Jupyter integration
table.insert(plugins, require('config.lazy.jupyter'))

-- Language-specific tools
table.insert(plugins, require('config.lazy.languages'))

-- Miscellaneous
table.insert(plugins, require('config.lazy.misc'))

-- Flatten all nested tables into one list for lazy.nvim
local flattened = {}
for _, group in ipairs(plugins) do
  if type(group) == 'table' then
    for _, plugin in ipairs(group) do
      table.insert(flattened, plugin)
    end
  end
end

return flattened
