if vim.fn.has("nvim-0.12") == 0 then
	error("This configuration requires Neovim 0.12 or newer")
end

require("helpers.keys").set_leader(" ")

-- List dependencies explicitly, before the plugins which use them.
local function github(repo, version, name)
	return { src = "https://github.com/" .. repo, version = version, name = name }
end

local packages = {
	github("nvim-lua/plenary.nvim"),
	github("nvim-tree/nvim-web-devicons"),
	github("L3MON4D3/LuaSnip"),
	github("rafamadriz/friendly-snippets"),
	github("hrsh7th/nvim-cmp"),
	github("hrsh7th/cmp-nvim-lsp"),
	github("hrsh7th/cmp-nvim-lua"),
	github("hrsh7th/cmp-buffer"),
	github("hrsh7th/cmp-path"),
	github("saadparwaiz1/cmp_luasnip"),
	github("williamboman/mason.nvim"),
	github("williamboman/mason-lspconfig.nvim"),
	github("j-hui/fidget.nvim", "legacy"),
	github("folke/neodev.nvim"),
	github("RRethy/vim-illuminate"),
	github("neovim/nvim-lspconfig"),
	github("rose-pine/nvim", nil, "rose-pine"),
	github("EdenEast/nightfox.nvim"),
	github("rebelot/kanagawa.nvim"),
	github("numToStr/Comment.nvim"),
	github("kazhala/close-buffers.nvim"),
	github("tpope/vim-sleuth"),
	github("tpope/vim-surround"),
	github("lewis6991/gitsigns.nvim"),
	github("akinsho/git-conflict.nvim", "2957f747e1a34f1854e4e0efbfbfa59a1db04af5"),
	github("kdheepak/lazygit.nvim"),
	github("ThePrimeagen/harpoon", "harpoon2"),
	github("akinsho/toggleterm.nvim", vim.version.range("*")),
	github("folke/trouble.nvim"),
	github("norcalli/nvim-colorizer.lua"),
	github("norcalli/nvim-terminal.lua"),
	github("nvim-telescope/telescope.nvim", "0.1.x"),
	github("stevearc/conform.nvim"),
	github("nvim-treesitter/nvim-treesitter", "main"),
}

if vim.fn.executable("make") == 1 then
	table.insert(packages, github("nvim-telescope/telescope-fzf-native.nvim"))
end

-- Register hooks before add(), including installs restored from the lockfile.
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("PackageBuilds", { clear = true }),
	callback = function(event)
		local data = event.data
		if data.kind ~= "install" and data.kind ~= "update" then
			return
		end
		if data.spec.name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
			local result = vim.system({ "make" }, { cwd = data.path, text = true }):wait()
			if result.code ~= 0 then
				error("Building telescope-fzf-native failed: " .. (result.stderr or result.stdout or ""))
			end
		elseif data.spec.name == "nvim-treesitter" and data.kind == "update" then
			vim.cmd.packadd("nvim-treesitter")
			require("nvim-treesitter").update()
		end
	end,
})

vim.pack.add(packages)

-- Plain Lua setup: no plugin-spec interpreter or custom lazy loader.
for _, module in ipairs({
	"misc",
	"cmp",
	"telescope",
	"lsp",
	"formatter",
	"treesitter",
	"git",
	"harpoon",
	"toggle-term",
	"trouble",
	"colorizer",
}) do
	require("plugins." .. module)
end

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Review plugin updates" })

vim.api.nvim_create_user_command("PackInfo", function()
	vim.pack.update(nil, { offline = true })
end, { desc = "Inspect installed plugins" })

require("helpers.keys").map("n", "<leader>L", "<cmd>PackInfo<cr>", "Show packages")
