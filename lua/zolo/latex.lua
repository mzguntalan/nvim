-- Section-based folding for LaTeX: \section / \subsection / \subsubsection
local levels = { section = 1, subsection = 2, subsubsection = 3 }

function _G.TexFoldExpr(lnum)
    local line = vim.fn.getline(lnum)
    local name = line:match('^%s*\\(%a+)%*?%s*[%[{]')
    if name and levels[name] then
        return '>' .. levels[name]
    end
    if line:match('^%s*\\end{document}') then return '0' end
    return '='
end

vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
    group = vim.api.nvim_create_augroup('user_latex', { clear = true }),
    pattern = { '*.tex', 'tex', 'plaintex' },
    callback = function()
        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldexpr = 'v:lua.TexFoldExpr(v:lnum)'
        vim.opt_local.foldlevel = 99

        -- <leader>fo: toggle fold of the section/subsection/subsubsection under cursor
        vim.keymap.set('n', '<leader>fo', function()
            if vim.fn.foldlevel('.') == 0 then
                vim.notify('No section fold here', vim.log.levels.INFO)
                return
            end
            vim.cmd('normal! za')
        end, { buffer = true, desc = 'Toggle LaTeX section fold' })
    end,
})
