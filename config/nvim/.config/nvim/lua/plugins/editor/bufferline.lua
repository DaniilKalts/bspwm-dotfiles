return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- Set mode to buffers
					numbers = "ordinal", -- Set numbers for tabs
					offsets = {
						{
							filetype = "neo-tree", -- Set offset for neo-tree
							text = "", -- Display text for the neo-tree buffer
							separator = true, -- Show a separator between the offset and the buffers
							text_align = "left", -- Position the text to the left side
						},
					},
					show_buffer_close_icons = true, -- Show close icons
					show_tab_indicators = true, -- Show indicators for tabs
					enforce_regular_tabs = true, -- Enforce tab size to be regular
					always_show_bufferline = true, -- Always show the bufferline
				},
			})
		end,
	},
}
