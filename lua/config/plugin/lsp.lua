-- Language Servers
local lspconfig = require("lspconfig")

local custom_attach = function(client)
    print("LSP Started")
    -- require('completion').on_attach(client)
    -- require('diagnostic').on_attach(client)

    print("attched")
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
lspconfig.svelte.setup({ on_attach=custom_attach})
-- lspconfig.typescript.setup({ on_attach=custom_attach })
lspconfig.ts_ls.setup({ on_attach=custom_attach })
lspconfig.sqlls.setup({ on_attach=custom_attach })
lspconfig.docker_compose_language_service.setup({ on_attach=custom_attach })
lspconfig.dockerls.setup({ on_attach=custom_attach })
lspconfig.tailwindcss.setup{ }
lspconfig.eslint.setup{ }
lspconfig.futhark_lsp.setup{
    cmd = { 'futhark', 'lsp' },
    filetypes = { 'futhark', 'fut' },
    single_file_support = true,
    on_attach=custom_attach
}
