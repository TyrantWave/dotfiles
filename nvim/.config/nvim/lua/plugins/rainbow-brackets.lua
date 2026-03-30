return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		-- HiPhish/rainbow-delimiters.nvim is the modern replacement for nvim-ts-rainbow.
		-- It automatically attaches to your Treesitter configuration, so no extra
		-- nvim-treesitter.configs setup is required!
		local rainbow_delimiters = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
				noice = function() end,
				notify = function() end,
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}
	end,
}
