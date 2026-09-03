local spell_behavior = vim.api.nvim_create_augroup("SpellBehavior", { clear = true })

-- Enable spelling for just prose-like files
vim.opt.spelllang = "en_us"
vim.api.nvim_create_autocmd("FileType", {
	group = spell_behavior,
	pattern = { "markdown", "gitcommit", "text", "tex", "rst", "mail", "gitrebase" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
-- Put the spell file in the config directory so it can be version controller
-- since the default is to stick it somewhere like .local/share
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- Turn off spell checking in floats
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = spell_behavior,
	callback = function()
		local winid = vim.api.nvim_get_current_win()
		local config = vim.api.nvim_win_get_config(winid)

		-- Check if the window is a floating window (relative is not empty)
		if config.relative and config.relative ~= "" then
			-- Turn off spell checking for this floating window
			vim.wo[winid].spell = false
		end
	end,
})
