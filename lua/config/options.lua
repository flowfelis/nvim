-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- NEOVIDE oPTIONS
-- Use alt key
vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

-- Neovide animation on cursor
vim.g.neovide_cursor_vfx_mode = "pixiedust" -- or "torpedo", "pixiedust", etc.

-- Font
vim.o.guifont = "JetBrainsMono Nerd Font:h12" -- or FiraCode, Meslo, etc.

--------------------------------

-- Colorscheme background
vim.opt.background = "light"

-- disable relative numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Remove context spaces top and bottom of the page
vim.opt.scrolloff = 0

-- Disable auto format
vim.g.autoformat = false

-- Don't sync clipboard with system
vim.opt.clipboard = ""
