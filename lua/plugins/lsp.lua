return {

	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.lsp.enable({
			"clangd",
			"pyright",
			"lua_ls",
			"language-server-bitbake",
		})
	end,

	vim.lsp.log.set_level("debug"),

	vim.diagnostic.config({
		float = {
			border = "single",
			style = "minimal",
		},
	}),

	vim.lsp.config("language-server-bitbake", {
		cmd = { "language-server-bitbake", "--stdio" },
		filetypes = { "bitbake" },
		root_markers = { ".git", "conf" }
	}),

	-- Since we're mostly using this to format Neovim Lua code, we need to
	-- let the LSP know where to find objects on the runtime path (see
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls) for more details
	vim.lsp.config("lua_ls", {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using (most
					-- likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Tell the language server how to find Lua modules same way as Neovim
					-- (see `:h lua-module-load`)
					path = {
						"lua/?.lua",
						"lua/?/init.lua",
					},
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						-- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
						vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
					},
				},
			})
		end,
		settings = {
			Lua = {},
		},
	}),
}
