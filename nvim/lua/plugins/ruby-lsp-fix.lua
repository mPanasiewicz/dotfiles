return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Override Ruby LSP configuration to avoid project-specific issues
      opts.servers = opts.servers or {}
      
      -- Alternative 1: Use Solargraph instead of ruby-lsp for projects with complex Rails setups
      opts.servers.solargraph = {
        cmd = { "solargraph", "stdio" },
        init_options = {
          formatting = true,
        },
        settings = {
          solargraph = {
            autoformat = true,
            completion = true,
            diagnostic = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true,
          },
        },
        on_attach = function(client, bufnr)
          -- Enable formatting if available
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
          end
        end,
      }
      
      -- Alternative 2: Enhanced ruby-lsp config with error handling
      opts.servers.ruby_lsp = {
        cmd = { "ruby-lsp" },
        init_options = {
          enabledFeatures = {
            "documentSymbols",
            "foldingRanges", 
            "selectionRanges",
            "semanticHighlighting",
            "formatting",
            "codeActions",
            "diagnostics",
            "hover",
            "completion",
          },
          experimentalFeaturesEnabled = false,
        },
        settings = {},
        on_attach = function(client, bufnr)
          -- Disable problematic capabilities
          client.server_capabilities.workspaceSymbolProvider = false
          
          -- Disable Rails-specific features that cause env errors
          if client.config.init_options then
            client.config.init_options.featuresConfiguration = {
              inlayHint = { enableAll = false },
            }
          end
        end,
        on_init = function(client)
          -- Disable addons that require Rails environment
          client.config.cmd = { "ruby-lsp", "--disable-addons" }
        end,
      }
    end,
  },
  
  -- Add Mason configuration for Ruby tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "ruby-lsp",
        "solargraph", -- Alternative Ruby LSP
        "rubocop",    -- Ruby linter/formatter (optional)
      })
    end,
  },
}