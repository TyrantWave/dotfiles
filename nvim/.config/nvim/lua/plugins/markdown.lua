return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "markdown", "norg", "rmd", "org" },
		config = function()
			require("render-markdown").setup({
				-- You can customize the styling here. The defaults are fantastic.
				heading = {
					sign = true,
					icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				},
				bullet = {
					icons = { "●", "○", "◆", "◇" },
				},
				checkbox = {
					unchecked = { icon = "󰄱 " },
					checked = { icon = "󰱒 " },
				},
			})
			-- Optional keymap to toggle the rendering on and off
			vim.keymap.set("n", "<leader>tm", "<cmd>RenderMarkdown toggle<CR>", { desc = "[T]oggle [M]arkdown rendering" })
		end,
	},
}
