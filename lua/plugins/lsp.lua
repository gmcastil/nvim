return {
    {
        -- Plugin name
        "neovim/nvim-lspconfig",

        -- Function that Lazy runs after the plugin is loaded
        config = function()
                local lspconfig = require("lspconfig")
                -- Python (pyright)
                lspconfig.pyright.setup({
                })
                -- Lua (lua-ls)
                lspconfig.lua_ls.setup({
                })
        end,

        -- Optional: If Lazy has a plugin-aware handler for nvim-lspconfig (see
        -- ~/.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig/configs for a
        -- list of supported servers) define setup options here instead of
        -- config().
        opts = {
            servers = {
                pyright = {
                },
                lua_ls = {
                },
            },
        },

        -- Optional: Runs before the plugin is loaded
        init = function()
            -- e.g., set global vars here
        end,

        -- Optional: list of other specs or plugin names to load before this one
        dependencies = {
        },

        -- Optional: Disable plugin entirely
        enabled = true,
    },
}

-- vim.lsp.config('lua_ls', {
--   on_init = function(client)
--     if client.workspace_folders then
--       local path = client.workspace_folders[1].name
--       if
--         path ~= vim.fn.stdpath('config')
--         and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
--       then
--         return
--       end
--     end

--     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most
--         -- likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Tell the language server how to find Lua modules same way as Neovim
--         -- (see `:h lua-module-load`)
--         path = {
--           'lua/?.lua',
--           'lua/?/init.lua',
--         },
--       },
--       -- Make the server aware of Neovim runtime files
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME
--           -- Depending on the usage, you might want to add additional paths
--           -- here.
--           -- '${3rd}/luv/library'
--           -- '${3rd}/busted/library'
--         }
--         -- Or pull in all of 'runtimepath'.
--         -- NOTE: this is a lot slower and will cause issues when working on
--         -- your own configuration.
--         -- See https://github.com/neovim/nvim-lspconfig/issues/3189
--         -- library = {
--         --   vim.api.nvim_get_runtime_file('', true),
--         -- }
--       }
--     })
--   end,
--   settings = {
--     Lua = {}
--   }
-- })
            -- on_attach = function(client, bufnr)

            --     -- Basic keymaps for LSP functions
            --     local opts = { buffer = bufnr, noremap = true, silent = true }
            --     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            --     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            --     vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            --     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            -- end

