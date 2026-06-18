local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Keymaps and config applied when any LSP client attaches
local custom_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>af', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>i', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, opts)
    vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, opts)

    -- Signature help on cursor hold (replaces lsp_signature plugin)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
end

local function setup(server, opts)
    opts = opts or {}
    opts.on_attach = custom_attach
    opts.capabilities = capabilities
    lspconfig[server].setup(opts)
end

-- Python
setup('pyright')

-- Lua
setup('lua_ls')

-- Markdown
setup('marksman')

-- Web: JS, TS, React
setup('ts_ls')
setup('eslint')
setup('tailwindcss')

-- HTML / CSS (handled well by ts_ls + tailwind, but add if mason installs them)
-- setup('html')
-- setup('cssls')
