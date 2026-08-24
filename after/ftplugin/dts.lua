-- Fold device tree nodes by indent level, collapsed one level deep by default
vim.opt_local.foldmethod = "indent"
vim.opt_local.foldenable = true
vim.opt_local.foldlevel = 1

-- Device tree source files should use the same indent settings as the Linux
-- kernel does
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ":0,l1,t0,g0,(0"
vim.opt_local.shiftwidth = 8
vim.opt_local.tabstop = 8
vim.opt_local.softtabstop = 8
vim.opt_local.expandtab = false
