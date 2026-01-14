return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
	cmd = { "ConformInfo" },
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },

      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        go = {
          "gofumpt",
          "goimports-reviser",
          "golines",
        },
        javascript = { "biome", "biome-organize-imports" },
        javascriptreact = { "biome", "biome-organize-imports"  },
        typescript = { "biome", "biome-organize-imports"  },
        typescriptreact = { "biome", "biome-organize-imports"  },
      },
    },
  },
}

