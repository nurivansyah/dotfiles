local plugins = {
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "gopls",
          "pyright",
          "mypy",
          "ruff",
          "black",
          "debugpy",
          "eslint-lsp",
          "js-debug-adapter",
          "prettier",
          "typescript-language-server"
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function ()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      ft = {"go", "python"},
      opts = function ()
        return require "custom.configs.null-ls"
      end
    },
    {
      "mfussenegger/nvim-dap",
      config = function()
        require "custom.configs.dap"
        require("core.utils").load_mappings("dap")
      end
    },
    {
      "leoluz/nvim-dap-go",
      ft = "go",
      dependencies = "mfussenegger/nvim-dap",
      config = function (_, opts)
        require("dap-go").setup(opts)
        require("core.utils").load_mappings("dap_go")
      end
    },
    {
      "olexsmir/gopher.nvim",
      ft = "go",
      config = function (_, opts)
        require("gopher").setup(opts)
      end,
      build = function ()
        vim.cmd [[silent! GoInstallDeps]]
      end
    },
    {
      "mfussenegger/nvim-dap-python",
      ft = "python",
      dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
      },
      config = function (_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("core.utils").load_mappings("dap_python")
      end
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    },
    {
      "mfussenegger/nvim-lint",
      event = "VeryLazy",
      config = function()
        require "custom.configs.lint"
      end
    },
    {
      "mhartington/formatter.nvim",
      event = "VeryLazy",
      opts = function()
        return require "custom.configs.formatter"
      end
    },
  }
  return plugins
  
