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

            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),             -- Trigger completion
                ["<C-n>"] = cmp.mapping.select_next_item(),         -- Next item
                ["<C-p>"] = cmp.mapping.select_prev_item(),         -- Previous item
                ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
            }),

            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
            }
        })
    end
};

