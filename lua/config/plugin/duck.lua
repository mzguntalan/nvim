local duck = require('duck')

-- Edit these freely: every spawn picks a random cat, every cook picks a
-- random dish to turn that duck into.
local cats = { '🐱', '🐈', '😺', '😼' }
local dishes = { '🥟', '🍜', '🥡', '🍚', '🍢', '🥠' }

local function random_from(pool)
    return pool[math.random(#pool)]
end

-- <leader>zcc — spawn a cat that wanders the buffer
vim.keymap.set('n', '<leader>zcc', function()
    duck.hatch({
        name = random_from(cats),
        food = random_from(dishes),
    })
end, { desc = 'Duck: spawn cat' })

-- <leader>zxc — cook the cat nearest the cursor
vim.keymap.set('n', '<leader>zxc', function()
    duck.cook()
end, { desc = 'Duck: cook nearest cat' })

-- <leader>zxx — cook every cat currently on screen
vim.keymap.set('n', '<leader>zxx', function()
    while #duck.get_ducks() > 0 do
        duck.cook()
    end
end, { desc = 'Duck: cook all cats' })
