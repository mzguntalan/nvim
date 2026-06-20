require('twilight').setup({
    dimming = {
        alpha = 0.25,        -- default grey/dark dimming, no custom hl group
        inactive = false,
    },
    context = 10,            -- lines of treesitter context kept bright (current function/block)
    treesitter = true,       -- use treesitter to find the enclosing scope, not just nearby lines
    expand = {                -- treesitter node types that count as "the scope to keep bright"
        'function',
        'method',
    },
})

-- <leader>tw — toggle twilight focus mode
vim.keymap.set('n', '<leader>tw', '<cmd>Twilight<CR>', { desc = 'Twilight: toggle focus dimming' })
