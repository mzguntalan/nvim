-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation (4 spaces, expand tabs)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- override ignorecase when query has uppercase

-- Scrolling: keep cursor away from edges
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- No line wrap
vim.opt.wrap = false

-- Splits open below and to the right (more natural)
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Persistent undo across sessions (pairs with undotree)
vim.opt.undofile = true

-- Faster completion responsiveness
vim.opt.updatetime = 250

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Keep signcolumn always visible (prevents layout shift on LSP attach)
vim.opt.signcolumn = "yes"
