vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.defer_fn(function()
      print("AFTER colorscheme:", vim.inspect(vim.api.nvim_get_hl(0, { name = "Normal" })))
    end, 100)
  end
})

