-- Fix pyright rename: it sends annotated text edits without change_annotations.
-- Patch the handler to strip annotations before vim applies them.
local orig_rename_handler = vim.lsp.handlers['textDocument/rename']
vim.lsp.handlers['textDocument/rename'] = function(err, result, ctx, config)
    if result and result.documentChanges then
        for _, change in ipairs(result.documentChanges) do
            if change.edits then
                for _, edit in ipairs(change.edits) do
                    if edit.annotationId then
                        edit.annotationId = nil
                    end
                end
            end
        end
        result.changeAnnotations = nil
    end
    orig_rename_handler(err, result, ctx, config)
end

-- Auto-trigger signature help when cursor moves inside a function call
local sig_group = vim.api.nvim_create_augroup('user_sig_help', { clear = true })
vim.api.nvim_create_autocmd('CursorMovedI', {
    group = sig_group,
    callback = function()
        local line = vim.api.nvim_get_current_line()
        local col  = vim.api.nvim_win_get_cursor(0)[2]
        -- Only trigger if there's an open paren before the cursor on this line
        local before = line:sub(1, col)
        if before:match('%(') and not before:match('%)%s*$') then
            vim.lsp.buf.signature_help()
        end
    end,
})

-- Keymaps set when any LSP client attaches
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts   = { noremap = true, silent = true, buffer = event.buf }
        local bufnr  = event.buf

        vim.keymap.set('n', 'gD',          vim.lsp.buf.declaration,    opts)
        vim.keymap.set('n', 'gd',          vim.lsp.buf.definition,     opts)
        vim.keymap.set('n', 'gs',          vim.lsp.buf.hover,          opts)
        vim.keymap.set('n', '<leader>rf',  vim.lsp.buf.references,     opts)
        vim.keymap.set('n', '<leader>re',  vim.lsp.buf.rename,         opts)
        vim.keymap.set('n', '<leader>af',  vim.lsp.buf.code_action,    opts)
        vim.keymap.set('n', '<leader>dd',  vim.diagnostic.open_float,  opts)
        -- <C-k>: manual toggle for signature help in insert mode
        vim.keymap.set('i', '<C-k>',       vim.lsp.buf.signature_help, opts)
        -- <leader>i: toggle inlay hints for this buffer
        vim.keymap.set('n', '<leader>i', function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                { bufnr = bufnr }
            )
        end, opts)

        -- Enable inlay hints by default on attach
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
})

-- Capabilities: guard against cmp not loaded yet (it lazy-loads on InsertEnter)
local function get_capabilities()
    local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok then return cmp_lsp.default_capabilities() end
    return vim.lsp.protocol.make_client_capabilities()
end

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'lua_ls',
        'marksman',
        'ts_ls',
        'eslint',
        'tailwindcss',
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = get_capabilities(),
            })
        end,

        ['lua_ls'] = function()
            lspconfig.lua_ls.setup({
                capabilities = get_capabilities(),
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
        end,
    },
})
