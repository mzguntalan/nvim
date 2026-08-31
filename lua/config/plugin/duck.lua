local duck = require('duck')

-- Edit freely: every spawn picks a random cat to wander the buffer.
local cats = { '🐱', '🐈', '😺', '😼' }

local function random_from(pool)
    return pool[math.random(#pool)]
end

local M = {}

-- spawn a cat that wanders the buffer
function M.spawn()
    duck.hatch(random_from(cats))
end

-- cook the cat nearest the cursor
function M.cook()
    duck.cook()
end

-- cook every cat currently on screen
function M.cook_all()
    duck.cook_all()
end

return M
