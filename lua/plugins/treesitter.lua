return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "neovim-treesitter/treesitter-parser-registry" },
		lazy = false,
		build = ":TSUpdate",

			-- Install parsers
			config = function()
			require("nvim-treesitter").install({ "python", "bash", "make", "bitbake", "markdown", "devicetree", "c", "cpp", "json", "yaml" })

			-- Enable treesitter based highlighting for these
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "python", "sh", "make", "bitbake", "markdown", "dts", "c", "cpp", "json", "yaml" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
