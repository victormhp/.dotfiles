require("gitsigns").setup()
require("git-conflict").setup({
	default_mappings = {
		ours = "co",
		theirs = "ct",
		none = "c0",
		both = "cb",
		next = "cn",
		prev = "cp",
	},
})
require("helpers.keys").map("n", "<leader>lg", "<cmd>LazyGit<cr>", "LazyGit")
