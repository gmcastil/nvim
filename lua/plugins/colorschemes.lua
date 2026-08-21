return {
    {
        "ellisonleao/gruvbox.nvim",
	lazy = false,
        priority = 1000,
	config = function()
		vim.cmd([[colorscheme gruvbox]])
	end,
    },

    {
        "rose-pine/neovim",
	lazy = false,
        priority = 1000,
        name = "rose-pine"
    },

    {
        "folke/tokyonight.nvim",
	lazy = false,
        priority = 1000
    }
}

