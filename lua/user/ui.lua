local M = {}

function M.configure_floats(opts)

    local border = opts and opts.border or nil

    -- Diagnostic floats
    -- vim.diagnostic.config({
    --     float = {
    --         border = border,
    --     },
    -- })

    -- LSP and signature help borders
    -- vim.lsp.handlers["textDocument/hover"] =
    --     vim.lsp.with(vim.lsp.handlers.hover, { border = border })

    -- vim.lsp.handlers["textDocument/signatureHelp"] =
    --     vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

end

return M

