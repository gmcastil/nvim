-- Reload Snips from all sources (doesn't include custom paths)
vim.api.nvim_create_user_command("SnipReloadAll", function()
    local ls = require("luasnip")
    ls.cleanup()
    pcall(function() require("luasnip.loaders.from_lua").load() end)
    vim.notify("LuaSnip: reloaded all snippet sources")
end, {})

-- Show Snips that are available for the given buffer
vim.api.nvim_create_user_command("SnipList", function()
    local ft = vim.bo.filetype
    local ls = require("luasnip")

    local snips = ls.get_snippets(ft)
    local out = { "--- Active Snippets for [" .. ft .. "] ---", "" }
    for _, s in ipairs(snips) do
        table.insert(out, string.format("[%s]", s.trigger))
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, out)
    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(buf)
end, {})

