return {
  "mfussenegger/nvim-dap-python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap = require("dap")

    local pythonPath = function()
      -- First, try local .venv
      -- local cwd = vim.fn.getcwd()
      -- local local_venv = cwd .. "/.venv/bin/python"
      -- if vim.fn.executable(local_venv) == 1 then
      --   return local_venv
      -- end
      -- Function to get Python version from .python-version file
      local function get_pyenv_version()
        local file = io.open(vim.fn.expand(vim.loop.cwd() .. "/.python-version"), "r")
        if file then
          local version = file:read("*l") -- Read the first line
          file:close()
          return version
        else
          return nil -- Return nil if the file doesn't exist or can't be read
        end
      end

      -- Get Python version from .python-version
      local pyenv_version = get_pyenv_version()

      if pyenv_version == nil then
        -- Fallback to system Python
        return "/usr/bin/python3"
      end



      -- return pyenv virtualenv
      local pyenv_python = "/Users/puma/.pyenv/versions/" .. pyenv_version .. "/bin/python"
      if vim.fn.executable(pyenv_python) == 1 then
        return pyenv_python
      end
    end

    local set_python_dap = function()
      require("dap-python").setup(pythonPath())
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "DAP Django",
          program = vim.loop.cwd() .. "/manage.py",
          args = { "runserver", "--noreload" },
          justMyCode = true,
          django = true,
          console = "integratedTerminal",
        },
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = pythonPath(),
        },
        {
          type = "python",
          request = "attach",
          name = "Attach remote",
          connect = function()
            return {
              host = "127.0.0.1",
              port = 5678,
            }
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Launch file with arguments",
          program = "${file}",
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
          end,
          console = "integratedTerminal",
          pythonPath = pythonPath(),
        },
      }

      dap.adapters.python = {
        type = "executable",
        command = pythonPath(),
        args = { "-m", "debugpy.adapter" },
      }
    end

    set_python_dap()

    vim.api.nvim_create_autocmd({ "DirChanged" }, {
      callback = function()
        set_python_dap()
      end,
    })
  end,
}
