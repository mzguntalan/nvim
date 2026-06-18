local null_ls = require("null-ls")
local h = require("null-ls.helpers")

-- reorder-python-imports is not a none-ls builtin.
-- We define it as a custom formatting generator.
local reorder_imports = h.make_builtin({
    name = "reorder-python-imports",
    meta = { url = "https://github.com/asottile/reorder-python-imports" },
    method = null_ls.methods.FORMATTING,
    filetypes = { "python" },
    generator_opts = {
        command = "reorder-python-imports",
        args = { "-" },
        to_stdin = true,
    },
    factory = h.formatter_factory,
})

null_ls.setup({
    sources = {
        -- Python: run import reorder first, then black
        reorder_imports,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--ignore-missing-imports" },
        }),

        -- Web / JSON / Markdown via prettier
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

        -- Per-buffer augroup avoids clobbering other buffers' format-on-save
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
