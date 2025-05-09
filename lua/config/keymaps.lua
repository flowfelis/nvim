-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- DELETE
-- Delete some default keymaps
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")

-- Delete default mapping for window movement
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-j>")


-- GENERAL
-- Escape insert mode
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = false })

-- Select a line
vim.keymap.set("n", "vl", "_v$h", { noremap = true, silent = true, desc = "Select a line" })

-- Select all
vim.keymap.set({ "n", "i" }, "<D-a>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Allow clipboard copy paste in neovide
if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+p') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+p') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<Esc>"+pl') -- Paste insert mode
end

-- WINDOWS
-- Switch between windows
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true, desc = "go to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true, desc = "go to down window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true, desc = "go to up window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true, desc = "go to right window" })


-- Increase and decrease window size
vim.keymap.set("n", "<Up>", "<C-w>+", { noremap = true, silent = true, desc = "Window increase height" })
vim.keymap.set("n", "<Down>", "<C-w>-", { noremap = true, silent = true, desc = "Window decrease height" })
vim.keymap.set("n", "<Right>", "<C-w><", { noremap = true, silent = true, desc = "Window decrease width" })
vim.keymap.set("n", "<Left>", "<C-w>>", { noremap = true, silent = true, desc = "Window increase width" })

-- Open a vertical split
vim.keymap.set("n", "<leader>v", "<C-w>v", { noremap = true, silent = true, desc = "Vertical split a window" })

--BUFFERS
-- Close buffer
vim.keymap.set("n","<leader>w","<CMD>bdelete<CR>", { noremap = true, silent = true, desc = "Close a buffer" })

-- Move to next/prev buffer
vim.keymap.set("n", "<leader>]", "<CMD>bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", "<CMD>bprev<CR>", { noremap = true, silent = true, desc = "Prev buffer" })

