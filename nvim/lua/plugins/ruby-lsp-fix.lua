return {
  {
    "neovim/nvim-lspconfig", 
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      
      -- Use ruby-lsp only
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
        on_attach = function(client, bufnr)
          client.server_capabilities.workspaceSymbolProvider = false
        end,
      }
      
      -- Disable other Ruby LSPs completely
      opts.servers.solargraph = false
      opts.servers.rubocop = false  -- Disable RuboCop LSP
    end,
  },
  
  -- Remove Mason RuboCop configuration to avoid dependency issues
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "ruby-lsp",
        -- Remove rubocop to avoid gem dependency conflicts
      })
    end,
  },
}