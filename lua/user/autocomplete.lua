-- Autocomplete settings (within reason)

-- Non-LSP completion sources (buffer, other windows/buffers, tags, includes)
vim.opt.complete = ".,w,b,u,t,i"

-- When autocomplete is supported by the LSP, just use that as our source
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf)
		end
	end,
})

vim.opt.completeopt = "menu,menuone,noinsert,popup,nearest"
vim.opt.pumheight = 10
vim.opt.pummaxwidth = 40
vim.opt.pumborder = "rounded"
vim.opt.pumblend = 10
