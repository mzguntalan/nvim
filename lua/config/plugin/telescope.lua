local builtin = require('telescope.builtin')

-- vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local telescope = require('telescope')

telescope.setup({
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
        },
        -- git_files = {
        --     theme = "dropdown",
        --     previewer = false,
        -- },
        live_grep = {
            theme = "dropdown",
        }
    },
})
