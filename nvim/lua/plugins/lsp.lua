-- LSP Configuration & Plugins
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				event = "LspAttach",
			},
			"folke/neodev.nvim",
			"RRethy/vim-illuminate",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Set up Mason before anything else
			require("mason").setup()

			-- Quick access via keymap
			require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

			-- Neodev setup before LSP config
			require("neodev").setup()

			-- Turn on LSP status information
			require("fidget").setup()

			-- Set up cool signs for diagnostics
			local signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			}

			-- Diagnostic config
			local config = {
				virtual_text = true,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)

			-- This function gets run when an LSP connects to a particular buffer.
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local on_attach = function(client, bufnr)
				local lsp_map = require("helpers.keys").lsp_map

				lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
				lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
				lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
				lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
				lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
				lsp_map("<leader>rn", vim.lsp.buf.rename, bufnr, "Rename symbol")

				lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
				lsp_map("<leader>lt", vim.lsp.buf.type_definition, bufnr, "Type definition")

				lsp_map("<leader>ln", vim.lsp.buf.signature_help, bufnr, "Signature Help")
				lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")
				lsp_map("<leader>le", vim.diagnostic.open_float, bufnr, "Show Diagnostics")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })

				lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")

				-- Attach and configure vim-illuminate
				require("illuminate").on_attach(client)
			end

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Lua
			vim.lsp.config("lua_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- Python
			vim.lsp.config("pyright", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					pyright = { disableOrganizeImports = true },
					python = { analysis = { ignore = { "*" } } },
				},
			})

			vim.lsp.config("ruff", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Go
			vim.lsp.config("gopls", {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotempl" },
			})

			-- C
			vim.lsp.config("clangd", {
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "clangd" },
			})

			-- Typescript
			vim.lsp.config("ts_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = vim.fs.root(0, { "package.json" }),
				single_file_support = true,
				init_options = { disableSuggestions = true },
			})

			-- Eslint
			vim.lsp.config("eslint", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- CSS
			vim.lsp.config("cssls", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					css = { validate = true, lint = { unknownAtRules = "ignore" } },
					scss = { validate = true, lint = { unknownAtRules = "ignore" } },
				},
			})

			-- Tailwind
			vim.lsp.config("tailwindcss", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Svelte
			vim.lsp.config("svelte", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Astro
			vim.lsp.config("astro", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"ruff",
				"gopls",
				"clangd",
				"ts_ls",
				"eslint",
				"cssls",
				"tailwindcss",
				"svelte",
				"astro",
			})
		end,
	},
}
