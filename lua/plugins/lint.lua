return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				bitbake = { "oelint-adv" },
			}

			-- Run linters on certain events
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
