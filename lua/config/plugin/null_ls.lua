local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Python: isort (PEP 8 import order, deduplication) then black
        null_ls.builtins.formatting.isort.with({
            extra_args = { "--profile", "black" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--ignore-missing-imports" },
        }),

        -- Web / JSON / Markdown
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "json", "markdown",
                "html", "css",
                "javascript", "typescript",
                "javascriptreact", "typescriptreact",
            },
        }),
    },

    on_attach = function(client, bufnr)
        if client.name ~= "null-ls" then return end

        local opts = { buffer = bufnr, desc = "[lsp] format" }

        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end, opts)

        vim.keymap.set("x", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end, opts)

        local group = vim.api.nvim_create_augroup("null_ls_fmt_" .. bufnr, { clear = true })
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
