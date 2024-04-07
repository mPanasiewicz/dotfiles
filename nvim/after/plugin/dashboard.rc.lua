local status, db = pcall(require, "dashboard")
if (not status) then return end

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true
    },
    shortcut = {
      {
        icon = "📦",
        desc = 'Update Packer',
        group = '@property',
        action = 'PackerSync',
        key = 'u'
      },
      {
        icon = "👾",
        desc = 'Mason',
        group = '@property',
        action = 'Mason',
        key = 'U'
      },
      {
        icon = "🌳",
        desc = 'Update Tree Sitter',
        group = '@property',
        action = 'TSUpdate',
        key = 'T'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      -- {
      --   desc = ' Apps',
      --   group = 'DiagnosticHint',
      --   action = 'Telescope app',
      --   key = 'a',
      -- },
      -- {
      --   desc = ' dotfiles',
      --   group = 'Number',
      --   action = 'Telescope dotfiles',
      --   key = 'd',
      -- },
    },
  },
})

vim.keymap.set('n', 'db', ':Dashboard<CR>')
