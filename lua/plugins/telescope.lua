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

            local builtin = require("telescope.builtin")
            -- File pickers
            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Lists all files, respects .gitignore" })
            vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Lists only explicitly tracked files, respects .gitignore" })
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            -- LSP specific pickers
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "List symbols in current buffer" })
            vim.keymap.set("n", "<leader>Ls", builtin.lsp_document_symbols, { desc = "List symbols across project" })
            vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "List all references under cursor" })

            -- Vim pickers
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Show open buffers" })

            -- Stolen from kickstart....not sure if I'll use them
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

        end
    }

}
