require('trouble').setup({
    -- Minimal: no icons that require a patched font assumption
    icons = true,
    -- Start with document diagnostics (current file), not workspace
    mode = 'document_diagnostics',
})

-- <leader>t  — toggle trouble diagnostics panel
vim.keymap.set('n', '<leader>t', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
    { desc = 'Trouble: buffer diagnostics' })

-- <leader>tr — toggle workspace-wide diagnostics
vim.keymap.set('n', '<leader>tr', '<cmd>Trouble diagnostics toggle<CR>',
    { desc = 'Trouble: workspace diagnostics' })
