-- Set the cursor line in the active window when we switch
local group = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
    group = group,
    pattern = { "*" },
    callback = function()
        vim.opt.cursorline = true
    end
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
    group = group,
    pattern = { "*" },
    callback = function()
        vim.opt.cursorline = false
    end
})

-- Workaround to fix weird highlighting and fontification in sh-mode (this might
-- not be needed with different syntax highlighters)
-- local group = vim.api.nvim_create_augroup("ShModeFixes", { clear = true })
-- vim.api.nvim_create_autocmd({ "Filetype", {
--     pattern = "bash, sh",
--     callb
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        -- Prevents wild wrapping behavior within parenthesis in docstrings
        vim.opt_local.indentkeys:remove("o")
    end,
})

-- Use the `par` program to format text if it's available for the following
-- types of files
if vim.fn.executable("par") == 1 then
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "text", "gitcommit" },
        callback = function()
            vim.opt_local.formatprg = "par"
        end,
    })
end
