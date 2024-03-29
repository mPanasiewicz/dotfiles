local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Prettify json format
keymap.set('n', '=j', ':%! jq --indent 4 .<CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-----------------------------
-- Tabs

-- New tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<S-Tab>', ':tabprev<Return>')
keymap.set('n', '<Tab>', ':tabnext<Return>')

------------------------------
-- Windows

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Markdown Preview
keymap.set('n', '<C-s>', ':MarkdownPreview<Return>')
keymap.set('n', '<M-s>', ':MarkdownPreviewStop<Return>')
keymap.set('n', '<C-p>', ':MarkdownPreviewToggle<Return>')
