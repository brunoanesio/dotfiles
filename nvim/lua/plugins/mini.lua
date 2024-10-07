return {
  {
    "echasnovski/mini.bracketed",
    version = false,
    event = "BufReadPost",
    opts = {},
  },

  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPost",
    version = false,
    opts = {},
    config = function()
      local hipatterns = require "mini.hipatterns"
      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },

  {
    "echasnovski/mini.comment",
    version = false,
    event = "BufReadPost",
    opts = {},
  },

  {
    "echasnovski/mini.surround",
    version = false,
    event = "BufReadPost",
    opts = {},
  },

  {
    "echasnovski/mini.pick",
    version = false,
    opts = {},
    keys = {
      { "<leader>ff", "<cmd>Pick files<cr>", desc = "Open Files" },
      { "<leader>,", "<cmd>Pick files<cr>", desc = "Open Files" },
      { "<leader>fg", "<cmd>Pick grep_live<cr>", desc = "Open Files" },
      { "<leader>.", "<cmd>Pick buffers<cr>", desc = "Open Files" },
    },
  },

  {
    "echasnovski/mini.jump",
    version = false,
    event = "BufReadPost",
    opts = {},
  },

  {
    "echasnovski/mini.ai",
    version = false,
    event = "BufReadPost",
    opts = {},
  },

  {
    "echasnovski/mini.sessions",
    version = false,
    opts = {},
    keys = {
      { "<leader>qs", "<cmd>lua MiniSessions.read()<cr>", desc = "Read Session" },
    },
  },

  -- {
  --   "echasnovski/mini.icons",
  --   version = false,
  --   event = "VeryLazy",
  --   opts = {},
  -- },

  -- {
  --   "echasnovski/mini.statusline",
  --   version = false,
  --   event = "VeryLazy",
  --   opts = {},
  -- },

  {
    "echasnovski/mini.files",
    version = false,
    opts = {},
    keys = {
      { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open Files" },
    },
  },
}
