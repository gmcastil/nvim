return {

	"lewis6991/gitsigns.nvim",

	event = { "BufReadPre", "BufNewFile" },

	opts = {

		numhl = true,
		signcolumn = false,

		-- This might cause some cursos jumping if this is toggled on and the
		-- delay is too short
		current_line_blame = false,
		current_line_blame_opts = { delay = 700 },
		-- This renders the date a bit more human readable
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},

		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- Next hunk
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(gs.next_hunk)
				return "<Ignore>"
			end, "Next hunk")

			-- Previous hunk
			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(gs.prev_hunk)
				return "<Ignore>"
			end, "Prev hunk")

			-- Hunk actions
			map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
			map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle inline blame")
			map("n", "<leader>hd", gs.diffthis, "Diff against index")

			-- Text object for hunks
			map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
		end,
	},
}
