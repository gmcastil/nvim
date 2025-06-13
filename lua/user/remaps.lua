-- Import global functions
local globals = require("user.globals")

-- Define a local helper function to set keymaps more easily
local function map(mode, lhs, rhs, desc)
    local opts = { noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Edit configuration files
map("n", "<leader>ev", function () globals.EditConfig("lua/user/init.lua") end, "Edit top level user configuration")
map("n", "<leader>kv", function () globals.EditConfig("lua/user/remaps.lua") end, "Edit user keymaps")
map("n", "<leader>sv", function () globals.ReloadConfig() end, "Reloads the entire configuration")

-- Open special buffers
map("n", "<leader>pv", vim.cmd.Ex, "Open Netrw")
map("n", "<leader>L", function () globals.OpenLuaScratchBuffer() end, "Open a Lua scratch buffer")

-- Buffer navigation
map("n", "<leader>c", "<C-w>c", "Close the current window")
map("n", "<leader><leader>", "<C-^>", "Alternate file")

-- Expands `%%` to the CWD of the file in the current buffer (variation on `%`)
vim.keymap.set("c", "%%", function()
    return vim.fn.getcmdtype() == ":" and vim.fn.expand("%:p:h") .. "/" or "%%"
end, { expr = true, desc = "Expands `%%` to the CWD of the current buffer" })

-- Stop highlighting for the 'hlsearch' option. Doing it this way
-- will clear all of the highlights of the previous search without having to do
-- silly things like /asdf which trashes the result of the previous search
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "")

-- Window navigation
map("n", "<C-h>", "<C-w>h", "Left window")
map("n", "<C-j>", "<C-w>j", "Down window")
map("n", "<C-k>", "<C-w>k", "Up window")
map("n", "<C-l>", "<C-w>l", "Right window")

-- Resize windows
map("n", "<C-Up>", "<Cmd>resize +2<CR>", "Resize up")
map("n", "<C-Down>", "<Cmd>resize -2<CR>", "Resize down")
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", "Resize left")
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", "Resize right")

-- Scroll up and down half a screen, but keep the cursor in the middle
map("n", "<C-d>", "<C-d>zz", "")
map("n", "<C-u>", "<C-u>zz", "")

-- Join lines without moving the cursor - TODO: pollutes the jumplist
map("n", "J", "mpJ`p", "")

-- Move text (experimental)
map("v", "J", ":m '>+1<CR>gv=gv", "")
map("v", "K", ":m '<-2<CR>gv=gv", "")

-- Delete text to void register (experimental)
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Yank into system clipboard more conveniently (experimental)
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Make current buffer executable on disk
vim.keymap.set("n", "<leader>X", "<cmd>!chmod ug+x %<CR><CR>")

-- Repeats the last search but unfolds the code enough to make the cursor
-- visible, and then centers the search result in the buffer
vim.keymap.set("n", "n", "nzvzz")
vim.keymap.set("n", "N", "Nzvzz")

-- The default behavior of `&` doesn't preserve flags, which is somewhat
-- unintuitive so remap it to `&&`. This basically remaps & to 'repeat previous
-- search command exactly'.
vim.keymap.set("n", "&", "<Cmd>&&<CR>")

-- List mappings
vim.keymap.set("n", "\"\"", "<Cmd>registers \"0123456789abcdefghijklmnopqrstuvwxyz*+.:<CR>")
vim.keymap.set("n", "\"j", "<Cmd>jumps<CR>")
-- Might replace with the undo history plugin at some point
vim.keymap.set("n", "\"c", "<Cmd>changes<CR>")

