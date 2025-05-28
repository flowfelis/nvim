return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        htmldjango = { "djlint" }, -- use djlint for Django templates
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        python = {"pylsp", "isort" },
      },
      formatters = {
        djlint = {
          command = "djlint",
          args = { "--reformat", "--indent", "2", "-" }, -- set indent to 2
          stdin = true,
        },
        prettier = {
          prepend_args = { "--tab-width", "2" }, -- set indent to 2
        },
      },
    },
  },
}
