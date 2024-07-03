-- Language Servers
local lspconfig = require("lspconfig")

local custom_attach = function(client)
    print("LSP Started")
    -- require('completion').on_attach(client)
    -- require('diagnostic').on_attach(client)

    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n','gs','<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>')
    vim.keymap.set('n', '<leader>re', '<cmd>lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
end

lspconfig.jedi_language_server.setup({ on_attach=custom_attach })
lspconfig.lua_ls.setup{ on_attach=custom_attach }
lspconfig.marksman.setup{ on_attach=custom_attach }
lspconfig.taplo.setup{ on_attach=custom_attach }
