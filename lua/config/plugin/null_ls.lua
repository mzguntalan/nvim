local null_ls = require("null-ls")

-- reorder-python-imports was dropped from none-ls builtins.
-- We call it as a custom formatting source instead.
local reorder_imports = null_ls.builtins.formatting.reorder_python_imports.with({
    command = "reorder-python-imports",
    args = { "-" },
    to_stdin = true,
})

-- Run reorder-python-imports before black so black sees the final import order.
-- none-ls runs sources in declaration order within the same method.
null_ls.setup({
    sources = {
        -- Python
        reorder_imports,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy.with({
            -- mypy must be installed in the same env as your project.
            -- If using virtualenvs, set VIRTUAL_ENV or use mason to install mypy.
            extra_args = { "--ignore-missing-imports" },
        }),

        -- JSON / Markdown (prettier handles both)
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "json", "markdown", "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        }),
    },

    on_attach = function(client, bufnr)
        if client.name ~= "null-ls" then return end

        local opts = { buffer = bufnr, desc = "[lsp] format" }

        -- <Leader>f to format in normal mode
        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end, opts)

        -- <Leader>f to format selection in visual mode
        vim.keymap.set("x", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end, opts)

        -- Format on save
        local group = vim.api.nvim_create_augroup("lsp_format_on_save_" .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            group = group,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
            desc = "[lsp] format on save",
        })
    end,
})
