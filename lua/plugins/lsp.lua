-- Set buffer local keybinds for when we attach to an LSP
vim.api.nvim_create_autocmd("LspAttach", {

    group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),

    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Navigation
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

        -- LSP features
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    end,
})

-- Optional per-server hook called when an LSP client attaches to a buffer.
-- (e.g., disable formatting for, inlay hints, server-specific keymaps)
local function on_attach(client, bufnr)
    -- Example: disable formatting if handled elsewhere
    -- if client.name == "tsserver" then
    --     client.server_capabilities.documentFormattingProvider = false
    -- end
end

-- Plugin specification for Lazy.nvim to load and configure LSP
return {
    {
        -- Plugin name
        "neovim/nvim-lspconfig",
        -- Function that Lazy runs after the plugin is loaded
        config = function()

            local lspconfig = require("lspconfig")

            -- Bash language server with shellcheck integrtation
            lspconfig.bashls.setup({
            })

            -- Python (pyright)
            lspconfig.pyright.setup({
            })

            -- Lua language server (lua-ls)
            lspconfig.lua_ls.setup({

                -- Optional per-server hook to call when the LSP attaches to a
                -- buffer 
                on_attach = on_attach,

                -- See https://luals.github.io/wiki/settings/ for more
                -- details
                settings = {

                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            -- Tell the language server how to find Lua modules same way as Neovim
                            -- (see `:h lua-module-load`)
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            }
                        },
                        diagnostics = {
                            globals = { "vim" },
                            -- Adjust a few message severities
                            severity = {
                                ["redefined-local"] = "Warning",
                                ["unused-local"] = "Hint",
                            },
                            -- Do not report names like `_` or `_tmp` as unused
                            unusedLocalExclude = { "_*" },
                            neededFileStatus = {
                                ["codestyle-check"] = "Any",
                                ["await-in-sync"] = "Any"
                            },
                        },
                        -- Note here that a .luarc.json in the project root
                        -- directory can and should override these values.
                        -- We just use sane defaults in the event a project
                        -- doesn't have one.
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                -- Depending on the usage, you might want to add additional paths
                                -- here:
                                '${3rd}/luv/library',
                                '${3rd}/busted/library',
                                vim.env.VIMRUNTIME
                            },
                        },
                    },
                },
            })
        end,

        -- Optional: list of other specs or plugin names to load before this one
        dependencies = {
        },

        -- Optional: If Lazy has a plugin-aware handler for nvim-lspconfig (see
        -- ~/.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig/configs for a
        -- list of supported servers) define setup options here instead of
        -- config(). This adds an additional dependancy on Lazy which I do not
        -- particularly want, so leave it empty. This implies that all setup
        -- function needs to be done by defining the `settings` table for each
        -- server.
        opts = {
        },

        -- Optional: Called by Lazy.nvim before the plugin is loaded
        init = function()
            -- e.g., set global vars here
        end,

        -- Optional: Disable Lazy loading the plugin entirely
        enabled = true,
    },
}

