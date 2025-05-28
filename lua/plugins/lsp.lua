-- Prevent pyright and ruff being installed automatically
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              configurationSources = { "flake8" },
              plugins = {
                flake8 = {
                  enabled = true,
                },
                pyflakes = {
                  enabled = false,
                },
                pycodestyle = {
                  enabled = false,
                },
              },
            },
          },
        },
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
