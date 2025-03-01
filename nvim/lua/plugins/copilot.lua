return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			window = {
				layout = "float",
			},
		},
		keys = {
			{ "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
			{ "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
			{ "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
			{ "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
			{ "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
			{ "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" },
		},
	},
}
