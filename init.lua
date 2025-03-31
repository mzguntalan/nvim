require("zolo")
require("config")

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
   pattern = "*.fut",
   command = "setfiletype futhark"
})

vim.cmd [[filetype plugin on]]
