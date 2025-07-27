return
{
    -- Plugin name
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
    },

    -- Function that Lazy runs after the plugin is loaded
    config = function()

        local cmp = require("cmp")

        cmp.setup({

            -- Manual completion only; nothing pops up unless I ask for it
            completion = {
                autocomplete = false,
                completeopt = "menu,menuone,noinsert",
            },

            -- Better borders
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            -- Vim-style manual interaction
            --
            -- A note here on the way the `cmp.mapping` works - when you provide
            -- a custom function to `cmp.mapping`, the completion engine passes
            -- in a fallback function.  Here we preserve the original function
            -- of C-p / C-n unless the completion menu is not visible yet, in
            -- which case we open it.
            mapping = cmp.mapping.preset.insert({
                ["<C-space>"] = cmp.mapping.complete(),             -- Trigger completion
                ["<C-n>"] = function(fallback)                      -- Open the completion menu or next item
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        cmp.complete()
                    end
                end,
                ["<C-p>"] = function(fallback)                      -- Open the completion menu or prev item
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        cmp.complete()
                    end
                end,
                ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
                ["<C-e>"] = cmp.mapping.abort(),                    -- Close the menu
            }),

            -- Ghost text preview disabled (re-enable by setting to `true`)
            experimental = {
                ghost_text = false,
            },

            -- Where to get auto complete text (order is significant)
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "nvim_lua" },
            }

        })
    end
};
