-- Set buffer local keybinds for when we attach to an LSP
vim.api.nvim_create_autocmd("LspAttach", {

    group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),

    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Navigation
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

        -- LSP features
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: Find references" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "LSP: Go to type definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Show hover documentation" })
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

            -- Auto complete capbilities to provide to each LSP
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Bash language server with shellcheck integration
            vim.lsp.enable('bashls')
            vim.lsp.config('bashls', {

                on_attach = on_attach,

                capabilities = capabilities,

                -- See https://github.com/bash-lsp/bash-language-server for more details
                settings = {

                    bashIde = {
                        globPattern = '*@(.sh|.inc|.bash|.command)',
                    },

                },

                filetypes = { 'bash', 'sh' },

                single_file_support = true,

            })

            -- C (clangd)
            vim.lsp.enable('clangd')
            vim.lsp.config('clangd', {

                cmd = {
                    "clangd",
                    "--background-index",
--                    "--compile-commands-dir=/home/castillo/github/arty-z7/extern/linux-xlnx"
                },

                on_attach = on_attach,

                capabilities = capabilities,

                settings = {

                },

                filetypes = {
                    "c", "cpp", "objc", "objcpp", "cuda", "proto"
                },

                root_markers = {
                    ".clangd", ".clang-tidy", ".clang-format",
                    "compile_commands.json", "compile_flags.txt", "configure.ac",
                    ".git"
                },

                single_file_support = true,
            })

            -- Python (pyright)
            vim.lsp.enable('pyright')
            vim.lsp.config('pyright', {

                -- Optional per-server hook to call when the LSP attaches to a buffer 
                on_attach = on_attach,

                capabilities = capabilities,

            })

            -- Lua language server (lua-ls)
            vim.lsp.enable('lua-ls')
            vim.lsp.config('lua-ls', {

                -- Specify the command to run if necessary (defaults to
                -- running the user's LSP if it exist, then the system variant)
                cmd = {
                    vim.fn.expand("~/.local/bin/lua-language-server")
                },

                -- Optional per-server hook to call when the LSP attaches to a buffer 
                on_attach = on_attach,

                -- LSP comparison capabilities
                capabilities = capabilities,

                -- See https://luals.github.io/wiki/settings/ for more details
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
                        -- directory can and should override these values. We
                        -- just use sane defaults in the event a project doesn't
                        -- have one.
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("lua", true),
                        },
                    },
                },
                filetypes = { "lua" },
            })

            -- VHDL language server (VHDL_LS)
            vim.lsp.enable('vhdl_ls')
            vim.lsp.config('vhdl_ls', {

                cmd = {
                    vim.fn.expand("~/.local/bin/vhdl_ls")
                },

                -- Optional per-server hook to call when the LSP attaches to a buffer 
                on_attach = on_attach,

                -- LSP comparison capabilities
                capabilities = capabilities,

                filetypes = { "vhdl" },

                root_markers = {
                    "vhdl_ls.toml",
                    ".git"
                },

                settings = {

                },

                single_file_support = true,

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

