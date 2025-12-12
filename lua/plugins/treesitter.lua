return {
    {
        "nvim-treesitter/playground",

        cmd = "TSPlaygroundToggle",

        config = function()
            require("nvim-treesitter.configs").setup({

                playground = { enable = true }

            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",

        -- The master branch is frozen as of mid-May 2025 and all development work
        -- has migrated to main.  The installation and setup are different and a lot
        -- of online sources and the documentation still hasn't caught up yet.
        branch = "master",

        build = ":TSUpdate",

        lazy = false,

        config = function()
            require("nvim-treesitter.configs").setup({
                -- Directory to install parsers and quereis to
                install_dir = vim.fn.stdpath('data') .. '/site',

                ensure_installed = {
                    "vimdoc", "c", "cpp", "lua", "bash", "python", "vhdl",
                    "verilog", "tcl", "make", "json", "yaml", "cmake", "markdown",
                    "markdown_inline", "diff"
                },

                -- Install parsers asynchronously (only applies to ensure_installed
                sync_install = false,

                -- Not recomended if CLI tools not installed (install via NPM)
                auto_install = true,

                highlight = {

                    -- To diable the entire extension, just set this to false
                    enable = true,

                    -- Selectively disable languages that are problematic or if
                    -- the buffer is too large
                    disable = function(lang, buf)
                        -- Disable if this is a filetype we
                        local blacklist = { "html", "ruby", "tcl" }
                        for _, val in ipairs(blacklist) do
                            if lang == val then
                                print("Disabled tree-sitter for language " .. lang)
                                return true
                            end
                        end

                        local max_filesize = 200 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            vim.notify(
                                "File larger than 100KB, disabling tree-sitter for performance gainz",
                                vim.log.levels.WARN,
                                { title = "tree-sitter" }
                            )
                            return true
                        end

                        print("Tree-sitter enabled for lang:", lang)
                        return false
                    end,

                    additional_vim_regex_highlighting = { "markdown", "ruby", "tcl" }

                },
            })
        end
    }
}
