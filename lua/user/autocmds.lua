-- Set the cursor line in the active window when we switch
local cursor = vim.api.nvim_create_augroup("CursorLine", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = cursor,
	pattern = { "*" },
	callback = function()
		vim.opt.cursorline = true
	end,
})

-- Turn off the cursorline when we leave an active window
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	group = cursor,
	pattern = { "*" },
	callback = function()
		vim.opt.cursorline = false
	end,
})

-- Not sure if I like this behavior
-- local file_behavior = vim.api.nvim_create_augroup("FileBehavior", { clear = true })
--
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	group = file_behavior,
-- 	callback = function()
-- 		vim.highlight.on_yank({ timeout = 200 })
-- 	end
-- })
--
