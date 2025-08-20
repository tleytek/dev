return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				-- theme = require("lualine.themes.black_metal"),
				theme = require("mateus.lazy.lualine.themes.black_metal"),
				-- theme = "black_metal",
			},
		})
	end,
}
