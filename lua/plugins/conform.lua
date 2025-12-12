return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Format the buffer (from the Conform wiki)
            "<leader>f",
            function()
                require("conform").format({ async = true }, function(err)
                    if not err then
                        local mode = vim.api.nvim_get_mode().mode
                        if vim.startswith(string.lower(mode), "v") then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
                        end
                    end
                end)
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        notify_on_error = true,
        -- Disable "format_on_save lsp_fallback" for languages without good
        -- coding style standards
        format_on_save = function(bufnr)
            -- Disable autoformat on certain filetypes
            local ignore_filetypes = { "c", "cpp", "sh" }
            if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                return
            end
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            -- Disable autoformat for files in a certain path
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("/node_modules/") then
                return
            end
            return { timeout_ms = 5000, lsp_format = "fallback" }
        end,
        -- Define your formatters
        formatters_by_ft = {
            c = { "clang_format" },
            -- lua = { "stylua" },
            python = { "black" },
            markdown = { "prettierd" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Customize formatters
        formatters = {
            clang_format = {
                prepend_args = { "--fallback-style=LLVM" },
            },
            shfmt = {
                prepend_args = { "-i", "4" },
            },
        },
    },
    init = function()
        -- Autosave, but wrapped in pcall() so exceptions don't break the save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            callback = function()
                pcall(function()
                    require("conform").format({ async = false })
                end)
            end,
        })
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
