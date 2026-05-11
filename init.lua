local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then 
    vim.fn.system({"git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("config.lazy"))

require("zolo")
require("config")

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
   pattern = "*.fut",
   command = "setfiletype futhark"
})

vim.cmd [[filetype plugin on]]
