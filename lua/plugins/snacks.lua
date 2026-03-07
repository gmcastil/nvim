return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            bufdelete = { enabled = false },
        },
        keys = {
            -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
        },
    },
}
