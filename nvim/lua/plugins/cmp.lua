return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      "hrsh7th/nvim-cmp",
    },
    opts = {
      history = true,
    },
  },

  {
    "Exafunction/codeium.nvim",
    commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer" },
    event = "InsertEnter",
    config = function()
      dofile(vim.g.base46_cache .. "cmp")
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      local options = {
        sources = {
          { name = "codeium" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-c>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        experimental = { ghost_text = true },
        -- window = {
        --   completion = cmp.config.window.bordered {
        --     scrollbar = true,
        --     border = "single",
        --     col_offset = -1,
        --     side_padding = 0,
        --   },
        --   documentation = cmp.config.window.bordered {
        --     scrollbar = true,
        --     border = "single",
        --   },
        -- },
      }
      options = vim.tbl_deep_extend("force", options, require "nvchad.cmp")
      cmp.setup(options)
    end,
  },
}
