-- Use `hi GruvboxYellow` to get hex values asdasdfasffsdfaafsdfad
vim.api.nvim_set_hl(0, "FilenameHighlightGroup", { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "FilenameHighlightGroupNC", { fg = "#fabd2f", bg = "#3c3836", bold = true })

local function buffer_status()
    if not vim.bo.modified and not vim.bo.readonly and vim.bo.modifiable then
        return nil
    end

    -- 1. Sense the mode to find the EXACT Lualine group currently in use
    local mode = vim.fn.mode():lower()
    local mode_name = (mode == 'i' and 'insert' or mode == 'v' and 'visual' or 'normal')
    local section_hl = "lualine_c_" .. mode_name
    local symbol

    -- 2. Get the background of that section so our 'Pop' color matches perfectly
    local bg = vim.fn.synIDattr(vim.fn.hlID(section_hl), "bg#")

    -- 3. Update our 'Pop' highlight to use that background
    vim.api.nvim_set_hl(0, 'LualineStatusPop', {
        fg = vim.bo.modified and '#ff9e64' or '#f7768e',
        bg = bg,
        bold = true
    })

    if vim.bo.modified then
        symbol = "+"
    elseif vim.bo.readonly then
        symbol = "RO"
    else
        symbol = "X"
    end

    -- 4. The "Triple Switch" Strategy:
    -- [ (Section HL) -> Symbol (Pop HL) -> ] (Section HL)
    return string.format(" %%#%s#[%%#LualineStatusPop#%s%%#%s#]",
        section_hl,
        symbol,
        section_hl
    )
end

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
    local status_str = buffer_status()

    if fname == nil then
        fname = '[No Name]'
    end

    if status_str == nil then
        return string.format('%s@%s:%s', user, host, fname)
    else
        return string.format('%s@%s:%s %s', user, host, fname, buffer_status())
    end
end

return {

    "nvim-lualine/lualine.nvim",
    event = 'VeryLazy',
    -- Not sure if I want to get rid of this or not
    -- dependencies = {
    --     "nvim-tree/nvim-web-devicons"
    -- },

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
            lualine_c = { {
                user_host_filename,
                separator = { right = '' },
                padding = { left = 1, right = 1 },
            }, {
                -- buffer_status,
                -- separator = { left = '' },
                -- padding = { left = 1, right = 1 },
                -- -- Dynamic color logic
                -- color = function()
                --     -- Red for modified, orange for readonly
                --     if vim.bo.modified then
                --         return { fg = '#ff9e64', gui = 'bold' }
                --     elseif vim.bo.readonly or not vim.bo.modifiable then
                --         return { fg = '#f7768e' }
                --     end
                -- end
            } },
            -- Right side
            lualine_x = {},
            lualine_y = { 'branch', },
            lualine_z = { 'location' }, -- e.g., 12:34 (line:col)
        },

        -- Inactive windows keep it simple as well
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { user_host_filename, color = nil } },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
    }
}
