return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",

		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
				},
			})

			vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", { desc = "Go to next buffer (tab)" })
			vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { desc = "Go to previous buffer (tab)" })
		end,
	},
}
