return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Basic LSP server setup
      local lspconfig = require("lspconfig")

      -- Python (pyright)
      lspconfig.pyright.setup({
        on_attach = function(client, bufnr)
          -- Basic keymaps for LSP functions
          local opts = { buffer = bufnr, noremap = true, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })
    end,
  },
}

