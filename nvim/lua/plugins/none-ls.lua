return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			null_ls.setup({
				sources = {
					formatting.stylua,
					formatting.clang_format,
					formatting.black,
					formatting.isort,
					formatting.prettier,
					diagnostics.eslint_d,
				},
			})
		end,
	},
}
