return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		-- HiPhish/rainbow-delimiters.nvim is the modern replacement for nvim-ts-rainbow.
		-- It automatically attaches to your Treesitter configuration, so no extra
		-- nvim-treesitter.configs setup is required!
		local rainbow_delimiters = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = function(bufnr)
					local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
					if not ok or not parser then return nil end
					return rainbow_delimiters.strategy["global"]
				end,
				vim = rainbow_delimiters.strategy["local"],
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
