-- Editor options must be set before plugins configure themselves.
require("core.options")

-- Register native packages and configure plugins.
require("core.packages")

-- General Neovim keymaps
require("core.keymaps")

-- Theme packages are available after registration.
vim.cmd.colorscheme(require("helpers.colorscheme"))
