-- Language Servers
local lspconfig = require("lspconfig")

-- Attach keymaps and configuration when LSP client attaches
local custom_attach = function(client, bufnr)
    -- Buffer-local keymaps (only active when LSP is attached to this buffer)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<leader>re', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set("n", '<leader>i', 
        function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0}) 
        end, opts)
    vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float() <CR>", opts)

    -- Haskell-specific keymaps
    if vim.bo[bufnr].filetype == 'haskell' then
        local ht = require('haskell-tools')
        vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
        vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
        vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
        vim.keymap.set('n', '<leader>hr', ht.repl.toggle, opts)
        vim.keymap.set('n', '<leader>hf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, opts)
        vim.keymap.set('n', '<leader>hq', ht.repl.quit, opts)
    end
end

-- LSP server configurations
lspconfig.pyright.setup({ on_attach = custom_attach })
lspconfig.lua_ls.setup({ on_attach = custom_attach })
lspconfig.marksman.setup({ on_attach = custom_attach })
lspconfig.taplo.setup({ on_attach = custom_attach })
lspconfig.svelte.setup({ on_attach = custom_attach })
lspconfig.ts_ls.setup({ on_attach = custom_attach })
lspconfig.sqlls.setup({ on_attach = custom_attach })
lspconfig.docker_compose_language_service.setup({ on_attach = custom_attach })
lspconfig.dockerls.setup({ on_attach = custom_attach })
lspconfig.tailwindcss.setup({ on_attach = custom_attach })
lspconfig.eslint.setup({ on_attach = custom_attach })
lspconfig.futhark_lsp.setup({
    cmd = { 'futhark', 'lsp' },
    filetypes = { 'futhark', 'fut' },
    single_file_support = true,
    on_attach = custom_attach
})
lspconfig.gopls.setup({ on_attach = custom_attach })
lspconfig.ocamllsp.setup({ on_attach = custom_attach })
lspconfig.zls.setup({ on_attach = custom_attach })
lspconfig.hls.setup({
    on_attach = custom_attach,
    settings = {
        haskell = {
            plugin = {
                rename = { config = { crossModule = true } }
            }
        }
    }
})
lspconfig.gleam.setup({})

-- elixir 
-- require("elixir").setup({
--    nextls = {enable = true},
--    elixirls = {enable = false},
--    projectionist = {enable = true},
-- })
