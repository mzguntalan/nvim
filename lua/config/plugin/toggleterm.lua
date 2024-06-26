local toggleterm = require('toggleterm')

toggleterm.setup({
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
        border = "curved",
    }
})
