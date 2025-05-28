-- Prevent pyright and ruff being installed automatically
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
        ruff = {
          mason = false,
          autostart = false,
        },
      },
    },
  },
}
