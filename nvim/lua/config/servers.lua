return {
  nil_ls = {
    settings = {
      ["nil"] = { formatting = { command = { "nixfmt" } } },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.tbl_deep_extend("force", vim.api.nvim_get_runtime_file("", true), {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            -- "${3rd}/luv/library",
            -- "${3rd}/busted/library",
            -- "/usr/share/awesome/lib",
            -- "/usr/share/lua",
          }),
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
        format = {
          enable = false,
        },
      },
    },
  },
  gopls = {
    settings = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
  basedpyright = {
    settings = {
      analysys = {
        typeCheckingMode = "basic",
        enableTypeIgnoreComments = false,
        logLevel = "error",
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        inlayHints = { variableTypes = true },
      },
    },
  },
  jsonls = {
    settings = {
      init_options = { allowTrailingCommas = true, allowComments = true, provideFormatter = false },
    },
  },
}
