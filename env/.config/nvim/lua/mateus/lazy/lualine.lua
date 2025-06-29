return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"metalelf0/black-metal-theme-neovim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "blackmetal-gorgoroth",
			},
		})
	end,
}
