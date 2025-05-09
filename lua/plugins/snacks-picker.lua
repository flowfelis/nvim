return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<c-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["<c-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
          },
        },
      },
    },
  },
}
