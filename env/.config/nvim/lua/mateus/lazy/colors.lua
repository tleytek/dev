function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			-- ColorMyPencils()
			-- require("tokyonight").setup({
			-- 	style = "moon",
			-- 	transparent = true,
			-- 	terminal_colors = true,
			-- 	styles = {
			-- 		comments = { italic = false },
			-- 		keywords = { italic = false },
			-- 		sidebars = "dark",
			-- 		float = "dark",
			-- 	},
			-- })
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})
			-- vim.cmd("colorscheme rose-pine")

			-- ColorMyPencils()
		end,
	},
	{
		"metalelf0/black-metal-theme-neovim",
		config = function()
			require("black-metal").setup({})
			require("black-metal").load("gorgoroth")
		end,
	},
}
