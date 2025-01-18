-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  update_cwd = true,
  hijack_cursor = true,
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})

