-- Set the leader before running anything else (so this file should be sourced
-- early in configuration
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Settings and options
require("user")

-- Install plugin manager
require("lazy-bootstrap")

-- Install plugins
require("lazy-plugins")

