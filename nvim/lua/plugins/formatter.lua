return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo", "Format" },
		keys = {
			{ "<leader>ff", "<cmd>Format<cr>", desc = "Format" },
		},
		opts = {
			default_format_opts = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
			format_on_save = {},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				go = { "gofumpt", "goimports-reviser", "golines" },
				javascript = { "biome", "biome-organize-imports" },
				javascriptreact = { "biome", "biome-organize-imports" },
				typescript = { "biome", "biome-organize-imports" },
				typescriptreact = { "biome", "biome-organize-imports" },
			},
		},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)
			vim.api.nvim_create_user_command("Format", function()
				conform.format()
			end, { desc = "Format current buffer" })
		end,
	},
}
