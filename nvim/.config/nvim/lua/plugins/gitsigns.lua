return {
	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
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
			current_line_blame = true, -- Enable inline git blame by default
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
