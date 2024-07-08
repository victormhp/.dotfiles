local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	number = true,
	relativenumber = true,
	textwidth=0,
	wrapmargin=0,
	wrap = true,
	linebreak = true,
	colorcolumn = "100",
	termguicolors = true,
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
