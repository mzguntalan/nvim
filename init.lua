local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Ensure filetype detection runs before plugins load
vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

require("lazy").setup(require("config.lazy"))

require("zolo")

if vim.g.neovide then
    require("config.neovide")
end
