-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- NEOVIDE OPTIONS
-- Use alt key
vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

-- Neovide animation on cursor
vim.g.neovide_cursor_vfx_mode = "pixiedust" -- or "torpedo", "pixiedust", etc.

-- Font
-- vim.o.guifont = "JetBrainsMono Nerd Font:h13" -- or FiraCode, Meslo, etc.
vim.o.guifont = "Menlo:h13" -- or FiraCode, Meslo, etc.

-- Border radius for floating windows
vim.g.neovide_floating_corner_radius = 0.2

-- Hiding the mouse when typing
vim.g.neovide_hide_mouse_when_typing = true

-- Set the colorscheme background
vim.g.neovide_theme = 'auto'

-- Refresh rate
vim.g.neovide_refresh_rate = 180

-- Idle refresh rate
vim.g.neovide_refresh_rate_idle = 5

--------------------------------

-- disable relative numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Remove context spaces top and bottom of the page
vim.opt.scrolloff = 0

-- Disable auto format
vim.g.autoformat = false

-- Don't sync clipboard with system
vim.opt.clipboard = ""

-- Disable automatic root switching entirely
vim.g.root_spec = { "cwd" }
