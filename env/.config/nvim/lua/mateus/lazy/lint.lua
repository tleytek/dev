return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"rshkarin/mason-nvim-lint",
	},
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint(nil, { ignore_errors = true })
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint(nil, { ignore_errors = false })
		end, { desc = "Trigger linting for current file" })
	end,
}
