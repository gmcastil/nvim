-- Set the leader before running anything else (so this file should be sourced
-- early in configuration)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("user")

require("config.lazy")
