-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable autoformat for all filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })
--
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function(ev)
    vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = ev.buf, nowait = true })
  end,
})

-- Set `q` to close Diffview, only in Diffview buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "DiffviewFiles", "DiffviewFileHistory", "DiffviewView" },
      callback = function(args)
        vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = args.buf, silent = true })
      end,
    })
