return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<c-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["<c-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
            ["<leader>e"] = { "layout_left", mode = { "i", "n" } },
            ["<leader>j"] = { "cycle_preview", mode = { "i", "n" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          },
        },
      },
      actions = {
        cycle_preview = function(picker)
          local picker_layout = picker.layout
          local layout_config = vim.deepcopy(Snacks.picker.config.layout(picker.opts))

          local preview_config ---@type snacks.layout.Box|snacks.layout.Win|nil
          for _, w in ipairs(layout_config.layout) do
            if w.win == "preview" then
              preview_config = w
            end
          end

          if not preview_config then
            return
          end

          local width, height ---@type number|nil, number|nil
          picker_layout:each(function(w)
            if w.win == "preview" then
              local eval = function(s)
                return type(s) == "function" and s(w) or s
              end
              width, height = eval(w.width), eval(w.height)
            end
          end)

          if not width and not height then
            return
          end

          local vert = height and true or false

          local cycle_sizes = {
            -- 0.1,
            0.9,
          }
          local size_prop, size

          if vert then
            size_prop, size = "height", height
            table.insert(cycle_sizes, preview_config.height)
            table.sort(cycle_sizes)
          else
            size_prop, size = "width", width
            table.insert(cycle_sizes, preview_config.width)
            table.sort(cycle_sizes)
          end

          for i, s in ipairs(cycle_sizes) do
            if size == s then
              local smaller = cycle_sizes[i - 1] or cycle_sizes[#cycle_sizes]
              preview_config[size_prop] = smaller
              break
            end
          end

          picker:set_layout(layout_config)
        end,
      },
    },
  },
}
