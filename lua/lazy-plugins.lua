-- Configure and install plugins
require("lazy").setup({

  spec = {
    -- Install plugins from spec files in nvim/lua/plugins
    { import = "plugins" },
  },

  -- Configure any other settings here. See the documentation for more details.
  install = { colorscheme = { "habamax" } },

  -- Automatically check for plugin updates
  checker = { enabled = true },

  performance = {

    cache = {
      enabled = true,
    },

    rtp = {

      -- Lazy.nvim aggressively resets the runtime path and inadvertently (or
      -- possibly intentionally) drops some paths that are needed by the
      -- built-in treesitter functionality. In particular, if /usr/lib/nvim is
      -- not found, the parsers in that location will be missing and throw
      -- errors up (until or unless treesitter is installed). For now, leave
      -- this at true and then add back in the missing path so that the tool
      -- doesn't fail when asking for help.

      reset = true, -- Reset the runtime path to $VIMRUNTIME and the config directory

      ---@type string[]
      paths = {
              "~/.local/share/nvim/lazy/lazy.nvim",
              "/usr/share/nvim/runtime",
              "/usr/lib/nvim",
      },

      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
})
