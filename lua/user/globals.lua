-- Reload global functions, keymaps, and options
function _G.ReloadConfig()

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

function _G.EditConfig(filename)
    local config_file = vim.fn.stdpath("config") .. "/" .. (filename or "init.lua")

    local success, err = pcall(function()
        vim.cmd("tabedit " .. config_file)
    end)

    if not success then
        print("Failed to open " .. config_file .. ": " .. err);
    end

end

function _G.ClearFloatingWindows()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= "" then
            vim.api.nvim_win_close(win, false)
        end
    end
end

function _G.OpenLuaScratchBuffer()

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

end
