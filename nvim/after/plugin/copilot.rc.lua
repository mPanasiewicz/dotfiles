vim.keymap.set('i', '<C-h>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  silent = true,
  script = true
})
vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)")
vim.keymap.set("i", "<C-o>", "<Plug>(copilot-dismiss)")
vim.keymap.set("i", "<C-p>", "<Plug>(copilot-suggest)")
vim.g.copilot_no_tab_map = true
