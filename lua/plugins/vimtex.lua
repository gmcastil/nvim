return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_enabled = 0

            -- Enabled 
            vim.g.vimtex_imaps_enabled = 1
            -- vim.g.vimtex_imaps_list = {
            --     enabled = 1,
            -- }
        end
    }
}
