return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			preset = {
				header = [[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			},
		},
		indent = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		bufdelete = { enabled = true },
		scroll = { enabled = true },
		words = { enabled = true },
		gitbrowse = { enabled = true },
		terminal = { enabled = true },
	},
	keys = {
		{ "<leader>gg", function() Snacks.lazygit() end,       desc = "[G]it" },
		{ "<leader>gb", function() Snacks.gitbrowse() end,     desc = "[G]it [B]rowse" },
		{ "<leader>bd", function() Snacks.bufdelete() end,     desc = "[B]uffer [D]elete" },
		{ "<leader>;",  function() Snacks.terminal() end,      desc = "Toggle terminal" },
		{ "<Esc><Esc>", function() Snacks.terminal() end,      desc = "Toggle terminal", mode = "t" },
	},
}
