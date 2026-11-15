-- Highlight, edit, and navigate code
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"bash", "c", "css", "go", "gomod", "gowork", "html",
				"javascript", "json", "lua", "markdown", "markdown_inline",
				"python", "svelte", "tsx", "typescript", "vim", "vimdoc",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
				callback = function(args)
					-- Keep syntax highlighting available for filetypes without a parser.
					local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
					if lang and vim.treesitter.language.add(lang) then
						vim.treesitter.start(args.buf, lang)
					end
				end,
			})
		end,
	},
}
