return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local sections = opts.sections
    -- local tail_cwd = vim.fn.fnamemodify(vim.loop.cwd(), ":t")

    -- Initialize the tail_cwd variable to store the current working directory's tail
    local tail_cwd = vim.fn.fnamemodify(vim.loop.cwd(), ":t")

    -- Function to update tail_cwd whenever the buffer changes
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        tail_cwd = vim.fn.fnamemodify(vim.loop.cwd(), ":t") -- Update the cwd tail
        -- Trigger an update for the statusline
        vim.cmd("redrawstatus")
      end,
    })

    -- Insert the custom lualine component
    table.insert(sections.lualine_c, 2, {
      function()
        local icon = require("mini.icons").get("os", "macos")
        return icon .. " " .. tail_cwd
      end,
      color = function()
        return { fg = require("snacks.util").color("Statement") }
      end,
    })

    -- table.insert(sections.lualine_c, 2, {
    --   function()
    --     local icon = MiniIcons.get("directory", "home")
    --     return icon .. " " .. tail_cwd
    --   end,
    --   color = function()
    --     return { fg = Snacks.util.color("Statement") }
    --   end,
    -- })

    -- sections.lualine_c =
    --   {
    --     LazyVim.lualine.root_dir(),
    --     tail_cwd,
    --     {
    --       "diagnostics",
    --       symbols = {
    --         error = icons.diagnostics.Error,
    --         warn = icons.diagnostics.Warn,
    --         info = icons.diagnostics.Info,
    --         hint = icons.diagnostics.Hint,
    --       },
    --     },
    --     { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
    --     { LazyVim.lualine.pretty_path() },
    --   }
    -- -- Add mini.diff custom source
    -- for _, comp in ipairs(x) do
    --   if comp[1] == "diff" then
    --     comp.source = function()
    --       local summary = vim.b.minidiff_summary
    --       return summary
    --         and {
    --           added = summary.add,
    --           modified = summary.change,
    --           removed = summary.delete,
    --         }
    --     end
    --     break
    --   end
    -- end
    --
    -- Add Python virtualenv display
    table.insert(sections.lualine_z, 1, {
      function()
        local venv = vim.env.VIRTUAL_ENV
        if not venv then
          return ""
        end
        -- local icon = require("nvim-web-devicons").get_icon_by_filetype("python") or "🐍"
        -- local icon = require("mini.icons").python
        local icon = MiniIcons.get("extension", "py")
        return icon .. " " .. vim.fn.fnamemodify(venv, ":t") -- shows basename
      end,
      cond = function()
        local buf_path = vim.api.nvim_buf_get_name(0)
        local cwd = vim.loop.cwd()
        return buf_path:find(cwd, 1, true) == 1
      end,
      -- cond = function()
      --   return vim.bo.filetype == "python"
      -- end,
      -- color = { fg = "#98c379" }, -- green color
    })
  end,
}
