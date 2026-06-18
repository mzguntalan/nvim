-- nvim 0.11+ native LSP config API (lspconfig v3 compatible)
-- vim.lsp.config sets defaults; vim.lsp.enable activates the server.
-- capabilities are merged automatically from cmp_nvim_lsp via LspAttach below.

-- Keymaps applied when any LSP client attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { noremap = true, silent = true, buffer = event.buf }

        vim.keymap.set('n', 'gD',          vim.lsp.buf.declaration,   opts)
        vim.keymap.set('n', 'gd',          vim.lsp.buf.definition,    opts)
        vim.keymap.set('n', 'gs',          vim.lsp.buf.hover,         opts)
        vim.keymap.set('n', '<leader>rf',  vim.lsp.buf.references,    opts)
        vim.keymap.set('n', '<leader>re',  vim.lsp.buf.rename,        opts)
        vim.keymap.set('n', '<leader>af',  vim.lsp.buf.code_action,   opts)
        vim.keymap.set('n', '<leader>dd',  vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>i', function()
            local bufnr = event.buf
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                { bufnr = bufnr }
            )
        end, opts)
        -- Native signature help (replaces lsp_signature plugin)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- Extend capabilities with cmp on every attach
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client then
            local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
            if ok then
                client.server_capabilities = vim.tbl_deep_extend(
                    'force',
                    client.server_capabilities or {},
                    cmp_lsp.default_capabilities()
                )
            end
        end
    end,
})

-- Global capability defaults (applied to all servers)
vim.lsp.config('*', {
    capabilities = (function()
        local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
        if ok then return cmp_lsp.default_capabilities() end
        return vim.lsp.protocol.make_client_capabilities()
    end)(),
})

-- Server configurations
vim.lsp.config('pyright', {})
vim.lsp.config('lua_ls', {})
vim.lsp.config('marksman', {})
vim.lsp.config('ts_ls', {})
vim.lsp.config('eslint', {})
vim.lsp.config('tailwindcss', {})
-- vim.lsp.config('html', {})
-- vim.lsp.config('cssls', {})

vim.lsp.enable({
    'pyright',
    'lua_ls',
    'marksman',
    'ts_ls',
    'eslint',
    'tailwindcss',
})
