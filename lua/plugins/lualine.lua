-- Use `hi GruvboxYellow` to get hex values
vim.api.nvim_set_hl(0, "FilenameHighlightGroup", { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "FilenameHighlightGroupNC", { fg = "#fabd2f", bg = "#3c3836", bold = true })

local function fullpath_component()
    local name = vim.api.nvim_buf_get_name(0)
    if name == '' then
        return nil
    end
    return vim.fn.fnamemodify(name, ':p')
end

local function user_host_filename()
    local user = os.getenv('USER') or os.getenv('USERNAME')
    local host = vim.fn.hostname()
    local fname = fullpath_component()
    if fname == nil then
        fname = '[No Name]'
    end
    return string.format('%s@%s:%s', user, host, fname)
end

return {

    "nvim-lualine/lualine.nvim",
    event = 'VeryLazy',
    -- Not sure if I want to get rid of this or not
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
        globalstatus = true,
        disabled_filetypes = {
            statusline = { 'alpha', 'dashboard', 'starter' }
        },
        sections = {
            -- Left side
            lualine_a = { { 'mode', fmt = function(m) return m end } },
            lualine_b = {},
            -- Center
            lualine_c = { user_host_filename, color = nil },
            -- Right side
            lualine_x = {},
            lualine_y = { 'branch', },
            lualine_z = { 'location' }, -- e.g., 12:34 (line:col)
        },

        -- Inactive windows keep it simple as well
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { user_host_filename, color = nil },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
    }
}
