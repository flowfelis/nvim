return {
  "folke/flash.nvim",
  -- stylua: ignore
  keys = {
    -- disable the default flash keymap
    { "s", mode = { "n", "x", "o" }, false },
    { "<leader>a", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
