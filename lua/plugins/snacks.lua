return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          actions = {
            copy_file_path = {
              action = function(_, item)
                if not item then
                  return
                end

                local vals = {
                  ["BASENAME"] = vim.fn.fnamemodify(item.file, ":t:r"),
                  ["EXTENSION"] = vim.fn.fnamemodify(item.file, ":t:e"),
                  ["FILENAME"] = vim.fn.fnamemodify(item.file, ":t"),
                  ["PATH"] = item.file,
                  ["PATH (CWD)"] = vim.fn.fnamemodify(item.file, ":."),
                  ["PATH (HOME)"] = vim.fn.fnamemodify(item.file, ":~"),
                  ["URI"] = vim.uri_from_fname(item.file),
                }

                local options = vim.tbl_filter(function(val)
                  return vals[val] ~= ""
                end, vim.tbl_keys(vals))
                if vim.tbl_isempty(options) then
                  vim.notify("No values to copy", vim.log.levels.WARN)
                  return
                end
                table.sort(options)
                vim.ui.select(options, {
                  prompt = "Choose to copy to clipboard:",
                  format_item = function(list_item)
                    return ("%s: %s"):format(list_item, vals[list_item])
                  end,
                }, function(choice)
                  local result = vals[choice]
                  if result then
                    vim.fn.setreg("+", result)
                    Snacks.notify.info("Yanked `" .. result .. "`")
                  end
                end)
              end,
            },
            search_in_directory = {
              action = function(_, item)
                if not item then
                  return
                end
                local dir = vim.fn.fnamemodify(item.file, ":p:h")
                Snacks.picker.grep({
                  cwd = dir,
                  cmd = "rg",
                  args = {
                    "-g",
                    "!.git",
                    "-g",
                    "!node_modules",
                    "-g",
                    "!dist",
                    "-g",
                    "!build",
                    "-g",
                    "!coverage",
                    "-g",
                    "!.DS_Store",
                    "-g",
                    "!.docusaurus",
                    "-g",
                    "!.dart_tool",
                  },
                  show_empty = true,
                  hidden = true,
                  ignored = true,
                  follow = false,
                  supports_live = true,
                })
              end,
            },
            diff = {
              action = function(picker)
                picker:close()
                local sel = picker:selected()
                if #sel > 0 and sel then
                  Snacks.notify.info(sel[1].file)
                  vim.cmd("tabnew " .. sel[1].file)
                  vim.cmd("vert diffs " .. sel[2].file)
                  Snacks.notify.info("Diffing " .. sel[1].file .. " against " .. sel[2].file)
                  return
                end

                Snacks.notify.info("Select two entries for the diff")
              end,
            },
          },
          win = {
            list = {
              keys = {
                ["Y"] = "copy_file_path",
                ["s"] = "search_in_directory",
                ["D"] = "diff",
              },
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<c-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["<c-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
            ["<leader>e"] = { "layout_left", mode = { "i", "n" } },
            ["<leader>j"] = { "cycle_preview", mode = { "i", "n" } },
            -- ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            -- ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
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
