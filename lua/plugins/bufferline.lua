return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          always_show_bufferline = true,
          show_close_icon = false,
          show_buffer_close_icons = false,
        },
      })
    end,
  },
}
