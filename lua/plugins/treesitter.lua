return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
		lazy = false,
		build = ':TSUpdate',

		config = function()
			-- Install parsers
			require('nvim-treesitter').install{ 'python', 'bash', 'make', 'bitbake' }

			-- Enable treesitter based highlighting for these
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { 'python', 'sh', 'make', 'bitbake' },
				callback = function()
					vim.treesitter.start()
				end
			})

			-- Enable treesitter based folding for these
			-- vim.api.nvim_create_autocmd('FileType', {
			-- 	pattern = { 'python', 'sh', 'make', 'bitbake' }
			-- 	callback = function()
			-- 		vim.opt_local.foldmethod = 'expr'
			-- 		vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
			--
			-- 	end
			-- end,
		end,
	},
}
