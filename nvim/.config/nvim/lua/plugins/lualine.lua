return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "catppuccin/nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-macchiato",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
