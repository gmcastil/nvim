-- Going to return these as a module namespace
local M = {}

-- Reload global functions, keymaps, and options
function M.ReloadConfig()

    local modules = {
        "user.globals",
        "user.remaps",
        "user.set"
    }

    for _, name in ipairs(modules) do
        if package.loaded[name] then
            print("Unloading submodule " .. name)
            package.loaded[name] = nil
        end
    end

    for _, name in ipairs(modules) do
        require(name)
        print("Reloaded " .. name)
    end

    print("User configuration reloaded")

end

-- Edits the user configuration file relative to the config directory (e.g.,
-- ~/.config/nvim) in a new tab. If no path was provided, it attempts to edit the top level
-- `init.lua` file.
function M.EditConfig(filename)
    local config_file = vim.fn.stdpath("config") .. "/" .. (filename or "init.lua")

    local success, err = pcall(function()
        vim.cmd("tabedit " .. config_file)
    end)

    if not success then
        print("Failed to open " .. config_file .. ": " .. err);
    end

end

-- Closes all floats (useful for when they get a little out of control)
function M.ClearFloatingWindows()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= "" then
            vim.api.nvim_win_close(win, false)
        end
    end
end

-- Open a scratch buffer in a new tab that can be used for Lua evalution
function M.OpenLuaScratchBuffer()

    function PrintLuaScrathBanner(buf)
        vim.api.nvim_buf_set_lines(buf, 0, 0, false, {
            "-- This buffer is for text that is not saved and Lua evaluation.",
            "-- To evaluate the buffer or only a region use TODO"
        })
    end

    -- Create a new tab first, and then create the buffer
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "Lua Scratch")

    -- No file on disk, hidden so we can return without having to save, and don't
    -- create a swapfile
    vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
    vim.api.nvim_set_option_value("bufhidden", "hide", { buf = buf })
    vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
    vim.api.nvim_set_option_value("filetype", "lua", { buf = buf })

    vim.api.nvim_win_set_buf(0, buf)

    -- TODO: Set a couple of keymaps to allow saving it off or running it
    -- vim.keymap.set("n", "<leader>r", ":luafile %<CR>", { buffer = buf, noremap = true, silent = true })

    -- Probably some sort of error check that w were able to construct a buffer,
    -- write to it and that its ready for editing.
    PrintLuaScrathBanner(buf)

end

return M

