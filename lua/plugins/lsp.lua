return {

	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.lsp.enable({
			'pyright',
			'bitbake-language-server',
		})
	end,
}

