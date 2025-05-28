return {
  "sindrets/diffview.nvim",
  opts = {
    view = {
      default = {
        layout = "diff2_vertical",
      },
    },
  },
  keys = {
    {
      "<leader>gd",
      function()
        local view = require("diffview.lib").get_current_view()
        if view then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle Git Diffview",
    },
  },
}
