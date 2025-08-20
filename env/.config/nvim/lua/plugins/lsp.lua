vim.pack.add({
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		-- "eslint",
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"graphql",
		"prismals",
		"gopls",
	},
})

mason_tool_installer.setup({
	ensure_installed = {
		"stylua",
		"eslint_d",
	},
})

require("lspconfig").eslint.setup({})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(e)
		-- :help vim.lsp.* if I'm stuck, RTFM
		local opts = { buffer = e.buf, silent = true }

		vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)
		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "gtd", "<cmd>Telescope lsp_type_definitions<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "gw", "<cmd>Telescope lsp_references<CR>", opts)

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	end,
})
