return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			null_ls.setup({
				sources = {
					-- Lua
					formatting.stylua,
					-- C
					formatting.clang_format,
					-- Python
					formatting.black,
					formatting.isort,
					-- Go
					formatting.gofumpt,
					formatting.goimports_reviser,
					formatting.golines,
					-- TS
					formatting.prettier,
					require("none-ls.diagnostics.eslint").with({
						only_local = "node_modules/.bin",
					}),
				},
			})
		end,
	},
}