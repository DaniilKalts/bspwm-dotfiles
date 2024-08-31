return {
	"nvim-pack/nvim-spectre",
	config = function()
		-- Function to find the project root
		local function find_project_root()
			local patterns = { ".git", "package.json", "pyproject.toml", ".hg", ".svn", "Makefile" }
			return vim.fn.expand(vim.fn.finddir(unpack(patterns), ";"))
		end

		require("spectre").setup({
			default = {
				find_engine = {
					rg = {
						cmd = "rg",
						options = {
							"--hidden",
							"--files",
							"--no-ignore-vcs",
							"--glob",
							"!vendor/**", -- Exclude vendor directory
							"--glob",
							"!node_modules/**", -- Exclude node_modules directory
							"--glob",
							"!.git/**", -- Exclude .git directory
							"--glob",
							"!.go/pkg/**", -- Exclude Go modules directories
						},
					},
				},
			},
		})

		-- Set up keybinding for Ctrl + s
		vim.keymap.set("n", "<C-s>", function()
			-- Automatically detect and set the project root directory
			local project_root = find_project_root()
			if project_root ~= "" then
				vim.cmd("lcd " .. project_root)
			else
				vim.cmd("lcd " .. vim.fn.getcwd()) -- Fallback to current directory
			end

			-- Open Spectre limited to the project root
			require("spectre").open({
				search_path = project_root, -- Limit search to the current working directory
			})
		end, { desc = "Open Spectre for search and replace in project" })
	end,
}
