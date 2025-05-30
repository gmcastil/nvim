-- TODO: Need to add the following keybinds:
--
--  - Find symbols in current buffer and entire codebase
--  - Find strings in current buffer and entire codebase
--  - Go to definitions
--  - Go to reference
--  - Show diagnostics for current file and entire codebase
--
return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8', -- or branch = '0.1.x',

        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },

        config = function()
            require("telescope").load_extension("fzf")
        end
    }
}
