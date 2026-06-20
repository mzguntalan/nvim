local duck = require('duck')

-- Edit these freely: every spawn picks a random cat, every cook picks a
-- random dish that cat turns into when caught.
local cats = { '🐱', '🐈', '😺', '😼' }
local dishes = { '🥟', '🍜', '🥡', '🍚', '🍢', '🥠' }

local function random_from(pool)
    return pool[math.random(#pool)]
end

local M = {}

-- spawn a cat that wanders the buffer
function M.spawn()
    duck.hatch({
        name = random_from(cats),
        food = random_from(dishes),
    })
end

-- cook the cat nearest the cursor
function M.cook()
    duck.cook()
end

-- cook every cat currently on screen
function M.cook_all()
    while #duck.get_ducks() > 0 do
        duck.cook()
    end
end

return M
