return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- Recommended/example keymaps.
    local opencode_fullscreen = false
    local opencode_default_win_opts

    local function toggle_opencode_fullscreen()
      local opencode = require("opencode")
      local provider = require("opencode.config").provider
      if not provider or provider.name ~= "snacks" or type(provider.get) ~= "function" then
        opencode.toggle()
        return
      end

      local win = provider:get()
      if not win then
        provider:toggle()
        win = provider:get()
      end
      if not win then
        return
      end

      if not opencode_default_win_opts then
        opencode_default_win_opts = vim.deepcopy(win.opts)
      end

      if opencode_fullscreen then
        win.opts = vim.deepcopy(opencode_default_win_opts)
      else
        win.opts.position = "float"
        win.opts.relative = "editor"
        win.opts.row = 0
        win.opts.col = 0
        win.opts.width = 0
        win.opts.height = 0
        win.opts.enter = true
      end

      opencode_fullscreen = not opencode_fullscreen

      if win:valid() then
        win:hide()
      end
      win:show()
    end

    vim.keymap.set({ "n", "x" }, "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<leader>ar", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<leader>ai", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })
    vim.keymap.set({ "n", "t" }, "<leader>af", toggle_opencode_fullscreen,                                           { desc = "Toggle opencode fullscreen" })

    vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
    vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })

    -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
  end,
}
