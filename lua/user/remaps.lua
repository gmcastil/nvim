-- Default options
local opts = { noremap = true, silent = true }

-- Open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

-- Edit top level configuration or change keymaps
vim.keymap.set("n", "<leader>ev", function() EditConfig("init.lua") end, opts)
vim.keymap.set("n", "<leader>kv", function() EditConfig("lua/user/remaps.lua") end, opts)
-- Reloads the entire configuration
vim.keymap.set("n", "<leader>sv", function() ReloadConfig() end, opts)
-- Open a Lua scratch buffer
vim.keymap.set("n", "<leader>L", function() OpenLuaScratchBuffer() end, opts)
-- Close the current buffer
-- vim.keymap.set("n", "<leader>c", 

vim.keymap.set("c", "%%", function()
        return vim.fn.getcmdtype() == ":" and vim.fn.expand("%:p:h") .. "/" or "%%"
    end, { expr = true })

-- Stop highlighting for the 'hlsearch' option. Doing it this way
-- will clear all of the highlights of the previous search without having to do
-- silly things like /asdf which trashes the result of the previous search
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)  -- Left
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)  -- Down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)  -- Up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)  -- Right

-- Resize Windows
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- Scroll up and down half a screen, but keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Join lines without moving the cursor - TODO: pollutes the jumplist
vim.keymap.set("n", "J", "mpJ`p")

-- Move text (experimental)
vim.keymap.set("v", "J", "<Cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<Cmd>m '<-2<CR>gv=gv")

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

