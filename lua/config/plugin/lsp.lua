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

    local ht = require('haskell-tools')
    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { noremap = true, silent = true, buffer = bufnr, }
    print("haskell tools keymaps setup")
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
    -- Hoogle search for the type signature of the definition under the cursor
    vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
    -- Evaluate all code snippets
    vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', '<leader>hr', ht.repl.toggle, opts)
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', '<leader>hf', function()
        ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, opts)
    vim.keymap.set('n', '<leader>hq', ht.repl.quit, opts)
end

-- lspconfig.jedi_language_server.setup({ on_attach=custom_attach })
lspconfig.pyright.setup({ on_attach=custom_attach })
lspconfig.lua_ls.setup{ on_attach=custom_attach }
lspconfig.elixir_ls.setup{ on_attach=custom_attach }
lspconfig.marksman.setup{ on_attach=custom_attach }
lspconfig.taplo.setup{ on_attach=custom_attach }
lspconfig.svelte.setup({ on_attach=custom_attach})
-- lspconfig.typescript.setup({ on_attach=custom_attach })
lspconfig.ts_ls.setup({ on_attach=custom_attach })
lspconfig.sqlls.setup({ on_attach=custom_attach })
lspconfig.docker_compose_language_service.setup({ on_attach=custom_attach })
lspconfig.dockerls.setup({ on_attach=custom_attach })
lspconfig.tailwindcss.setup{ on_attach=custom_attach }
lspconfig.eslint.setup{ on_attach=custom_attach }
lspconfig.futhark_lsp.setup{
    cmd = { 'futhark', 'lsp' },
    filetypes = { 'futhark', 'fut' },
    single_file_support = true,
    on_attach=custom_attach
}
lspconfig.gopls.setup{ on_attach=custom_attach }
lspconfig.sqlls.setup{ on_attach=custom_attach }
lspconfig.ocamllsp.setup{ on_attach=custom_attach }
lspconfig.zls.setup{ on_attach=custom_attach }
lspconfig.zls.setup{ on_attach=custom_attach }
lspconfig.rust_analyzer.setup{ on_attach=custom_attach }
lspconfig.hls.setup{
    on_attach=custom_attach,
    settings = {
        haskell = {
            plugin = {
                rename = {config = {crossModule = true}}
            }
        }
    }
}
