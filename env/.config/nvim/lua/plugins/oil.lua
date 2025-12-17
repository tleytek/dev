vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	keymaps = {},
	columns = {},
	delete_to_trash = true,
	-- watchForChanges = true,
	skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "<leader>pe", ":Oil<CR>", { silent = true })
