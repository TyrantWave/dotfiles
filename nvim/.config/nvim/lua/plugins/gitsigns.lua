return {
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		config = function(_, opts)
			require("gitsigns").setup(opts)
			vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Git[H]unk [P]review" })
			vim.keymap.set(
				"n",
				"<leader>ht",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Git[H]unk [T]oggle Blame" }
			)
		end,

		opts = {
			current_line_blame = true,
			linehl = true,
			word_diff = true,
			signs = {
				add = { text = "▎", linehl = "GitSignsAddLn" },
				change = { text = "▎", linehl = "GitSignsChangeLn" },
				delete = { text = "", linehl = "GitSignsDeleteLn" },
				topdelete = { text = "", linehl = "GitSignsDeleteLn" },
				changedelete = { text = "▎", linehl = "GitSignsChangeLn" },
				untracked = { text = "┆", linehl = "GitSignsUntrackedLn" },
			},
		},
	},
}
