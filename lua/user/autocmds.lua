-- Set the cursor line in the active window when we switch
local group = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = group,
	pattern = { "*" },
	callback = function()
		vim.opt.cursorline = true
	end,
})

-- Turn off the cursorline when we leave an active window
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	group = group,
	pattern = { "*" },
	callback = function()
		vim.opt.cursorline = false
	end,
})
