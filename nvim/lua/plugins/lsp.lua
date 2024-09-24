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
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
				},
				automatic_installation = true,
			})

			-- Quick access via keymap
			require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

			-- Neodev setup before LSP config
			require("neodev").setup()

			-- Turn on LSP status information
			require("fidget").setup()

			-- Set up cool signs for diagnostics
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

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

				lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
				lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
				lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
				lsp_map("<leader>ln", vim.lsp.buf.signature_help, bufnr, "Signature Help")
				lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

				lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
				lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
				lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
				lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
				lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

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

			local lspconfig = require("lspconfig")
			-- Lua
			lspconfig["lua_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
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
			lspconfig["pylsp"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							flake8 = {
								enabled = true,
								maxLineLength = 120,
							},
							-- Disable plugins overlapping with flake8
							pycodestyle = {
								enabled = false,
							},
							mccabe = {
								enabled = false,
							},
							pyflakes = {
								enabled = false,
							},
							-- Use Black as the formatter
							autopep8 = {
								enabled = false,
							},
						},
					},
				},
			})

			-- Go
			lspconfig["gopls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotempl" },
			})

			-- Templ
			lspconfig["templ"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.filetype.add({ extension = { templ = "templ" } })

			-- C
			lspconfig["clangd"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--fallback-style=webkit",
				},
			})

			-- Rust
			lspconfig["rust_analyzer"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Typescript
			lspconfig["ts_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- HTML
			lspconfig["html"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "tmpl", "templ" },
			})

			-- CSS
			lspconfig["cssls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					scss = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			-- Tailwind
			lspconfig["tailwindcss"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "templ", "astro", "javascript", "typescript", "react", "svelte" },
				init_options = { userLanguages = { templ = "html" } },
			})

			-- Svelte
			lspconfig["svelte"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Astro
			lspconfig["astro"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
