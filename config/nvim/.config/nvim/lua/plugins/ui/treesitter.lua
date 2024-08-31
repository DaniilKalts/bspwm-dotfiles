return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true, -- Highlight also non-bracket delimiters like tags
				max_file_lines = nil, -- Do not limit by file size
				colors = {
					"#FF79C6", -- Pink
					"#BD93F9", -- Purple
					"#8BE9FD", -- Cyan
					"#50FA7B", -- Green
					"#F1FA8C", -- Yellow
					"#FFB86C", -- Orange
					"#FF5555", -- Red
				},
				termcolors = {
					"Pink",
					"Purple",
					"Cyan",
					"Green",
					"Yellow",
					"Orange",
					"Red",
				},
			},
		})
	end,
}
