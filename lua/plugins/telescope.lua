return {

	'nvim-telescope/telescope.nvim',

	tag = "v0.2.2",

	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},

	config = function()
		require("telescope").setup({

			defaults = {
				devicons = false
			},

			pickers = {},

			extensions = {}
		})

		local builtin = require("telescope.builtin")
		-- File pickers
		vim.keymap.set("n", "<leader>pf", builtin.find_files,
		{ desc = "Search for files (respecting .gitignore)" })
		vim.keymap.set("n", "<leader>pF", function()
			builtin.find_files({
				no_ignore = true,
				hidden = true
			})
			end,
		{ desc = "Search for files in entire repository" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files,
		{ desc = "Lists only explicitly tracked files in project, respects .gitignore" })
		vim.keymap.set("n", "<leader>ps", builtin.grep_string,
		{ desc = "Search for the string under the cursor in the current working directory"})
		vim.keymap.set("n", "<leader>pl", builtin.live_grep,
		{ desc = "Search for a string and get results live as you type, respects .gitignore" })

	end,
}

