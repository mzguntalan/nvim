-- Keymaps set when any LSP client attaches
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts  = { noremap = true, silent = true, buffer = event.buf }
        local bufnr = event.buf

        vim.keymap.set('n', 'gD',          vim.lsp.buf.declaration,    opts)
        vim.keymap.set('n', 'gd',          vim.lsp.buf.definition,     opts)
        vim.keymap.set('n', 'gs',          vim.lsp.buf.hover,          opts)
        vim.keymap.set('n', '<leader>rf',  vim.lsp.buf.references,     opts)
        vim.keymap.set('n', '<leader>re',  vim.lsp.buf.rename,         opts)
        vim.keymap.set('n', '<leader>af',  vim.lsp.buf.code_action,    opts)
        vim.keymap.set('n', '<leader>dd',  vim.diagnostic.open_float,  opts)
        vim.keymap.set('i', '<C-k>',       vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>i', function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                { bufnr = bufnr }
            )
        end, opts)

        -- Inlay hints on by default
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
})

-- Auto signature help when cursor is inside a function call
local sig_group = vim.api.nvim_create_augroup('user_sig_help', { clear = true })
vim.api.nvim_create_autocmd('CursorMovedI', {
    group = sig_group,
    callback = function()
        local line   = vim.api.nvim_get_current_line()
        local col    = vim.api.nvim_win_get_cursor(0)[2]
        local before = line:sub(1, col)
        if before:match('%(') and not before:match('%)%s*$') then
            vim.lsp.buf.signature_help()
        end
    end,
})

-- Fix pyright rename: strips annotationId to avoid change_annotations assert
local orig_rename_handler = vim.lsp.handlers['textDocument/rename']
vim.lsp.handlers['textDocument/rename'] = function(err, result, ctx, config)
    if result and result.documentChanges then
        for _, change in ipairs(result.documentChanges) do
            if change.edits then
                for _, edit in ipairs(change.edits) do
                    edit.annotationId = nil
                end
            end
        end
        result.changeAnnotations = nil
    end
    orig_rename_handler(err, result, ctx, config)
end

-- Capabilities: merged with cmp if available
local capabilities = (function()
    local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok then return cmp_lsp.default_capabilities() end
    return vim.lsp.protocol.make_client_capabilities()
end)()

-- Set global defaults for all servers (new lspconfig API)
vim.lsp.config('*', { capabilities = capabilities })

-- lua_ls needs to know about the nvim runtime
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
            },
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    },
})

-- mason-lspconfig: ensure servers are installed.
-- automatic_enable = true tells it to call vim.lsp.enable() for each
-- installed server automatically (new API, works with lspconfig v3+).
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'lua_ls',
        'marksman',
        'ts_ls',
        'eslint',
        'tailwindcss',
    },
    automatic_enable = true,
})
