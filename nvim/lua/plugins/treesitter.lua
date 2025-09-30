return {
  -- Remove deprecated playground plugin
  -- { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

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
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

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
