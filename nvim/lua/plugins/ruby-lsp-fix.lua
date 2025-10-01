-- Helper function to get Ruby version and paths with auto-installation
local function get_ruby_info()
  local handle = io.popen("asdf current ruby 2>/dev/null")
  local output = handle:read("*a")
  handle:close()
  
  -- Extract version from "ruby         3.3.5   ~/.tool-versions" format
  local ruby_version = output:match("ruby%s+([%d%.]+)")
  
  if ruby_version and ruby_version ~= "" then
    local ruby_major_minor = ruby_version:match("^(%d+%.%d+)")
    
    -- Fallback if pattern doesn't match
    if not ruby_major_minor then
      return {
        version = ruby_version,
        cmd = { "ruby-lsp" },
        env = {}
      }
    end
    
    local gem_path = vim.fn.expand("~/.asdf/installs/ruby/" .. ruby_version .. "/lib/ruby/gems/" .. ruby_major_minor .. ".0")
    local bin_path = vim.fn.expand("~/.asdf/installs/ruby/" .. ruby_version .. "/bin")
    local ruby_lsp_path = vim.fn.expand("~/.asdf/installs/ruby/" .. ruby_version .. "/bin/ruby-lsp")
    local gem_bin = vim.fn.expand("~/.asdf/installs/ruby/" .. ruby_version .. "/bin/gem")
    
    -- Auto-install gems if ruby-lsp is not found
    if vim.fn.executable(ruby_lsp_path) == 0 then
      vim.notify("Installing ruby-lsp and development gems...", vim.log.levels.INFO)
      
      local gems_to_install = {
        "ruby-lsp",
        "rubocop",
        "highline",
        "pry-theme", 
        "awesome_print"
      }
      
      for _, gem in ipairs(gems_to_install) do
        local install_cmd = gem_bin .. " install " .. gem
        vim.notify("Installing " .. gem .. "...", vim.log.levels.INFO)
        local result = vim.fn.system(install_cmd)
        if vim.v.shell_error ~= 0 then
          vim.notify("Failed to install " .. gem .. ": " .. result, vim.log.levels.ERROR)
        end
      end
      
      vim.notify("Gem installation completed!", vim.log.levels.INFO)
    end
    
    return {
      version = ruby_version,
      cmd = { ruby_lsp_path },
      env = {
        GEM_HOME = gem_path,
        GEM_PATH = gem_path,
        RUBY_VERSION = ruby_version,
        RUBYLIB = nil,
        PATH = bin_path .. ":" .. vim.env.PATH,
      }
    }
  else
    return {
      version = nil,
      cmd = { "ruby-lsp" },
      env = {}
    }
  end
end

return {
  {
    "neovim/nvim-lspconfig", 
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      
      local ruby_info = get_ruby_info()
      
      -- Completely disable default ruby_lsp to prevent conflicts
      opts.servers.ruby_lsp = false
      
      -- Disable other Ruby LSPs completely
      opts.servers.solargraph = false
      opts.servers.rubocop = false
    end,
  },
  
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local ruby_info = get_ruby_info()
      
      -- Manual setup after other configs are disabled
      require('lspconfig').ruby_lsp.setup({
        cmd = ruby_info.cmd,
        cmd_env = ruby_info.env,
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
            "definition",
            "references",
            "rename",
            "codeLens",
            "inlayHint",
          },
          experimentalFeaturesEnabled = false,
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.workspaceSymbolProvider = false
        end,
      })
    end,
  },
  
  -- Remove Mason RuboCop configuration to avoid dependency issues
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- ruby-lsp managed via asdf to avoid conflicts
        -- Remove rubocop to avoid gem dependency conflicts
      })
    end,
  },
}