require('aerial').setup({
    -- LaTeX: texlab reports sections/subsections as symbols; show everything
    backends = { tex = { 'lsp' }, _ = { 'lsp', 'treesitter', 'markdown', 'man' } },
    filter_kind = { _ = { 'Function', 'Method', 'Class' }, tex = false },
    -- Open aerial in a floating window rather than a split (feels minimal)
    layout = {
        default_direction = 'float',
        float = {
            border = 'rounded',
            relative = 'win',
            max_height = 0.9,
            width = 0.4,
            min_width = 30,
        },
    },
    -- Close aerial when you jump to a symbol
    close_on_select = true,
})

-- <leader>o  — toggle aerial outline for current buffer
vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle<CR>', { desc = 'Symbol outline' })

-- <leader>fa — already used for telescope find_files
-- Use telescope aerial picker for fuzzy symbol search in buffer
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope aerial<CR>', { desc = 'Fuzzy symbols' })
