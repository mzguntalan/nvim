if vim.g.neovide then
    vim.o.guifont = "MonaspiceNe Nerd Font Mono:h12" 
    vim.g.neovide_padding_top = 4
    vim.g.neovide_padding_bottom = 4
    vim.g.neovide_padding_right = 4
    vim.g.neovide_padding_left = 4
    vim.g.neovide_transparency = 0.95

    vim.g.neovide_animation_length = 0.001
end

if vim.g.neovide then
	-- 	maps control-shift-v to paste in both normal mode and insert mode command mode, and terminal mode
	vim.api.nvim_set_keymap('n', '<C-S-v>', '"+p', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('i', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
	local paste_clipboard = function()
		local clipboard_contents = vim.fn.getreg('+')
		vim.api.nvim_paste(clipboard_contents, true, -1)
	end
	vim.keymap.set('c', '<C-S-v>', paste_clipboard)
	vim.keymap.set('t', '<C-S-v>', paste_clipboard)
	-- vim.api.nvim_set_keymap('c', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
end
