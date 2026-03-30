return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			
			-- Minimal setup for the new nvim-treesitter
			ts.setup({})

			-- Install desired parsers
			local parsers = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" }
			if ts.install then
				ts.install(parsers)
			end

			-- Enable highlighting, indentation and folding via autocommands (new style)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()
					local lang = vim.bo[bufnr].filetype
					
					-- Only start for languages that have a parser
					if lang ~= "" and pcall(vim.treesitter.get_parser, bufnr, lang) then
						pcall(vim.treesitter.start)
					end

					-- Enable treesitter-based indentation
					-- Note: Some languages might still need the old way, but this is the new standard
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
