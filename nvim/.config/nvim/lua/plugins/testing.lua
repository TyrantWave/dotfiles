return { {
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- Test adapters for the languages you use
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-go",
		},
		config = function()
			local neotest = require("neotest")

			-- ==========================================
			-- Environment Runner Setup (Shared with Debugger)
			-- ==========================================
			local function load_env(file)
				local env_file = vim.fn.getcwd() .. "/" .. file
				if vim.fn.filereadable(env_file) == 1 then
					local lines = vim.fn.readfile(env_file)
					for _, line in ipairs(lines) do
						if not line:match("^%s*#") and line:match("=") then
							local k, v = line:match("([^=]+)=?(.*)")
							if k and v then
								v = v:gsub("^[\"']", ""):gsub("[\"']$", "")
								vim.fn.setenv(k, v)
							end
						end
					end
				end
			end

			local function prepare_test_env()
				local env_files = {
					".env",
					".env.local",
					".env.test",
					"envs/local.env",
					"envs/pytest.env",
				}
				for _, file in ipairs(env_files) do
					load_env(file)
				end

				local global_overrides = {
					DB_HOSTNAME = "localhost",
					REDIS_HOST = "localhost",
				}
				for k, v in pairs(global_overrides) do
					vim.fn.setenv(k, v)
				end
			end

			-- ==========================================
			-- Neotest Setup
			-- ==========================================
			neotest.setup({
				adapters = {
					require("neotest-python")({
						-- Extra arguments for nvim-dap configuration
						dap = { justMyCode = false },
						-- runner = "pytest",
					}),
					require("neotest-go")({
						experimental = { test_table = true },
					}),
				},
				output = { open_on_run = true },
				summary = {
					open = "botright vsplit | vertical resize 60", -- Opens explicitly wide
				},
				output_panel = {
					enabled = true,
					open = "botright split | resize 15",
				},
			})

			-- ==========================================
			-- Keymaps
			-- ==========================================
			
			-- Run nearest test (method/function under cursor)
			vim.keymap.set("n", "<leader>tr", function()
				vim.cmd("silent! wa")
				prepare_test_env()
				neotest.run.run()
			end, { desc = "Test: Run Nearest" })

			-- Run the entire current file
			vim.keymap.set("n", "<leader>tf", function()
				vim.cmd("silent! wa")
				prepare_test_env()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Test: Run File" })

			-- Toggle test summary panel (shows tree of all tests)
			vim.keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, { desc = "Test: Toggle Summary Panel" })

			-- Toggle the test output panel (bottom window with all output)
			vim.keymap.set("n", "<leader>tp", function()
				neotest.output_panel.toggle()
			end, { desc = "Test: Toggle Output Panel" })

			-- Show test output/error in a floating window
			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open({ enter = true, auto_close = true })
			end, { desc = "Test: Show Output Hover" })

			-- Attach to the running test (useful for tests that take input or you want to see realtime)
			vim.keymap.set("n", "<leader>ta", function()
				neotest.run.attach()
			end, { desc = "Test: Attach to Runner" })
		end,
	},
}
