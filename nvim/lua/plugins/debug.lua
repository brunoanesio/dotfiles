return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
      {
        "<leader>dus",
        function()
          local widgets = require "dap.ui.widgets"
          local sidebar = widgets.sidebar(widgets.scopes)
          sidebar.open()
        end,
        desc = "Open DAP Sidebar",
      },
    },
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type gopher.Config
    opts = {},
    keys = {
      { "<leader>gsj", "<CMD>GoTagAdd json<CR>", desc = "Add JSON struct tags" },
      { "<leader>gsy", "<CMD>GoTagAdd yaml<CR>", desc = "Add YAML struct tags" },
    },
  },
}
