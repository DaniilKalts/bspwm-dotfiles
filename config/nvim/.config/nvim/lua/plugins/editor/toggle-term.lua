return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10,
			open_mapping = [[<C-t>]],
			hide_numbers = true,
			shade_terminals = false,
			start_in_insert = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = "zsh",

			highlights = {
				Normal = {
					guibg = "#282a36",
					guifg = "#f8f8f2",
				},
				NormalFloat = {
					link = "Normal",
				},
				FloatBorder = {
					guifg = "#6272a4",
					guibg = "#282a36",
				},
			},

			-- Automatically change to the project root when opening the terminal
			on_open = function(term)
				local current_dir = vim.fn.getcwd()
				if current_dir and current_dir ~= "" then
					term:change_dir(current_dir)
					print("Terminal opened in directory: " .. current_dir)
				else
					print("Failed to get current directory")
				end
			end,
		})

		-- Keybindings to toggle specific terminals in normal mode
		vim.api.nvim_set_keymap(
			"n",
			"<M-1>",
			"<cmd>1ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<M-2>",
			"<cmd>2ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<M-3>",
			"<cmd>3ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<M-4>",
			"<cmd>4ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<M-5>",
			"<cmd>5ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<M-6>",
			"<cmd>6ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true }
		)

		-- Keybindings to toggle specific terminals in terminal mode
		vim.api.nvim_set_keymap(
			"t",
			"<M-1>",
			"<cmd>1ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<M-2>",
			"<cmd>2ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<M-3>",
			"<cmd>3ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<M-4>",
			"<cmd>4ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<M-5>",
			"<cmd>5ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<M-6>",
			"<cmd>6ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true }
		)

		-- Keybindings to change the size of terminals in normal mode
		vim.api.nvim_set_keymap("n", "<M-=>", ":resize +5<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<M-->", ":resize -5<CR>", { noremap = true, silent = true })

		-- Keybindings to change the size of terminals in terminal mode
		vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:resize +5<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("t", "<M-->", "<C-\\><C-n>:resize -5<CR>", { noremap = true, silent = true })
	end,
}
