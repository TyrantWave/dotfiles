-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>n", ":Neotree toggle<CR>", desc = "NeoTree toggle" },
	},
	opts = {
                enable_diagnostics = false,
		window = {
			position = "right",
		},
		filesystem = {

			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					-- '.git',
					".DS_Store",
					"thumbs.db",
				},
				never_show = {},
			},

			window = {
				mappings = {
					-- ["e"] = "close_window",
				},
			},
		},
	},
}
