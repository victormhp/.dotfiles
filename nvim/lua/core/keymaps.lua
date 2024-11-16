local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
map("i", "jj", "<esc>")

-- Quick access to some common actions
map("n", "<leader>ww", "<cmd>w<cr>", "Write")
map("n", "<leader>wa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>dw", "<cmd>close<cr>", "Window")
map("n", "<leader>qw", "<cmd>Ex<cr>", "Go back")

-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>db", buffers.delete_this, "Current buffer")
map("n", "<leader>do", buffers.delete_others, "Other buffers")
map("n", "<leader>da", buffers.delete_all, "All buffers")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- Tmux sessionizer
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Tmux sessionizer")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- Copy to clipboard
map("v", "<C-c>", '"+y')

-- Go to nvim remaps
map("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/lua/core/keymaps.lua<CR>")

-- Greates remap ever
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>l", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- Markdown
map("n", "<leader>mk", "<cmd>MarkdownPreview<CR>")
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>")
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>")
