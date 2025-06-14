M = {}

local function show_floating_output(lines, opts)
    opts = opts or {}
    vim.lsp.util.open_floating_preview(lines, opts.syntax or "lua", {
        border = opts.border or "rounded",
        title = opts.title or "",
        title_pos = "center",
        max_width = 80,
    })
end

-- Summarizes the output of the giant table from vim.lsp.get_active_clients()
function M.LspClientSummary()

    -- local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if vim.tbl_isempty(clients) then
        vim.notify("No LSP clients attached to the current buffer", vim.log.levels.INFO)
        return
    end

    -- Assume there is only one client per buffer for now - TODO should probably
    -- iterate over all clients and build a larger summary
    local client = clients[1]
    local summary = vim.inspect({
        name = client.name,
        id = client.id,
        cmd = client.config.cmd,
        root_dir = client.config.root_dir,
        filetypes = client.config.filetypes,
        attached_buffers = client.attached_buffers,
        server_capabilities = client.server_capabilities,
    })

    local lines = vim.split(summary, "\n")
    show_floating_output(lines, { title = "LSP Client Summary", max_width = 120 })

end

return M

