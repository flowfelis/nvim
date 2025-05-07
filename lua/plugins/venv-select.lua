return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  keys = {
    { "<leader>fv", "<cmd>VenvSelect<cr>" },
  },
  ---@type venv-selector.Config
  opts = {
    on_venv_activate_callback = function(venv_path)
      print("Venv Activated" .. venv_path)
    end,
    -- Your settings go here
  },
}
