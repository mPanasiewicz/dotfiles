return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- "astro",
        "cmake",
        -- "cpp",
        "css",
        "fish",
        "gitignore",
        -- "go",
        "graphql",
        "http",
        "html",
        -- "java",
        "php",
        -- "rust",
        "scss",
        "sql",
        "svelte",
        "lua",
        "ruby",
        "jq",
        "json5",
        "bash",
        "regex",
        "yaml",
        "markdown",
        "markdown_inline",
        "query",
        "luap",
        "json",
        "jsonc",
        "javascript",
        "diff",
        "terraform",
        "vim", -- Added to fix query issues
      },

      -- Enhanced highlighting for Ruby
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      -- Better indentation for Ruby
      indent = {
        enable = true,
        disable = {},
      },

      -- matchup = {
      -- 	enable = true,
      -- },

      -- https://github.com/nvim-treesitter/playground#query-linter
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = true, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      
      -- Force ensure Ruby parser is properly installed
      vim.defer_fn(function()
        local has_parser = pcall(require, "nvim-treesitter.parsers")
        if has_parser then
          vim.cmd("TSInstall! ruby")
        end
      end, 100)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
