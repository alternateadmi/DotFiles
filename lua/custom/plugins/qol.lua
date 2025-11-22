-- Quality of Life Keymaps for Neovim

-- ============================================
-- FILE OPERATIONS
-- ============================================

-- Save file (Space + w like "write")
vim.keymap.set('n', '<leader>w', ':write<CR>', {
  desc = '[W]rite (save) file',
  silent = true,
})

-- Save all files (Space + W)
vim.keymap.set('n', '<leader>W', ':wall<CR>', {
  desc = '[W]rite all files',
  silent = true,
})

-- Quit (Space + q)
vim.keymap.set('n', '<leader>q', ':quit<CR>', {
  desc = '[Q]uit window',
  silent = true,
})

-- Quit all (Space + Q)
vim.keymap.set('n', '<leader>Q', ':quitall<CR>', {
  desc = '[Q]uit all windows',
  silent = true,
})

-- Save and quit (Space + x like "exit")
vim.keymap.set('n', '<leader>x', ':wq<CR>', {
  desc = 'Save and e[x]it',
  silent = true,
})

-- Force quit without saving (Space + !)
vim.keymap.set('n', '<leader>!', ':q!<CR>', {
  desc = 'Force quit (no save)',
  silent = true,
})

-- Close buffer but keep window (Space + c)
vim.keymap.set('n', '<leader>c', ':bdelete<CR>', {
  desc = '[C]lose buffer',
  silent = true,
})

-- ============================================
-- BUFFER NAVIGATION (TAB-LIKE)
-- ============================================

-- Next buffer (like next tab) - Tab key
vim.keymap.set('n', '<Tab>', ':bnext<CR>', {
  desc = 'Next buffer',
  silent = true,
})

-- Previous buffer - Shift+Tab
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', {
  desc = 'Previous buffer',
  silent = true,
})

-- ============================================
-- BETTER INDENTING
-- ============================================

-- Stay in visual mode after indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left (stay in visual)' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right (stay in visual)' })

-- ============================================
-- MOVING LINES UP/DOWN
-- ============================================

-- Move line up in normal mode (Alt+k)
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==', {
  desc = 'Move line up',
  silent = true,
})

-- Move line down in normal mode (Alt+j)
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==', {
  desc = 'Move line down',
  silent = true,
})

-- Move selected lines up in visual mode (Alt+k)
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv", {
  desc = 'Move selection up',
  silent = true,
})

-- Move selected lines down in visual mode (Alt+j)
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv", {
  desc = 'Move selection down',
  silent = true,
})

-- ============================================
-- BETTER COPYING/PASTING
-- ============================================

-- Paste without yanking in visual mode
vim.keymap.set('v', 'p', '"_dP', {
  desc = 'Paste without yanking',
})

-- Copy to system clipboard (Space + y)
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', {
  desc = '[Y]ank to system clipboard',
})

-- Paste from system clipboard (Space + p)
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', {
  desc = '[P]aste from system clipboard',
})

-- Select all (Ctrl+a)
vim.keymap.set('n', '<C-a>', 'ggVG', {
  desc = 'Select all',
})

-- ============================================
-- WINDOW MANAGEMENT
-- ============================================

-- Split window vertically (Space + |)
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', {
  desc = 'Split vertically',
  silent = true,
})

-- Split window horizontally (Space + -)
vim.keymap.set('n', '<leader>-', ':split<CR>', {
  desc = 'Split horizontally',
  silent = true,
})

-- Equal window sizes (Space + =)
vim.keymap.set('n', '<leader>=', '<C-w>=', {
  desc = 'Equal window sizes',
  silent = true,
})

-- Maximize current window (Space + m)
vim.keymap.set('n', '<leader>m', '<C-w>|<C-w>_', {
  desc = '[M]aximize window',
  silent = true,
})

-- ============================================
-- SEARCH IMPROVEMENTS
-- ============================================

-- Keep cursor centered when searching
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- Keep cursor centered when jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- ============================================
-- QUICK ACTIONS
-- ============================================

-- Source current file (reload config)
vim.keymap.set('n', '<leader><CR>', ':source %<CR>', {
  desc = 'Source current file',
  silent = true,
})

-- Format current file (Space + F for uppercase F)
vim.keymap.set('n', '<leader>F', function()
  vim.lsp.buf.format { async = true }
end, {
  desc = '[F]ormat with LSP',
})

-- Toggle line numbers (Space + n)
vim.keymap.set('n', '<leader>n', function()
  vim.o.number = not vim.o.number
  vim.notify('Line numbers: ' .. (vim.o.number and 'ON' or 'OFF'))
end, {
  desc = 'Toggle line [n]umbers',
})

-- Toggle relative line numbers (Space + N)
vim.keymap.set('n', '<leader>N', function()
  vim.o.relativenumber = not vim.o.relativenumber
  vim.notify('Relative numbers: ' .. (vim.o.relativenumber and 'ON' or 'OFF'))
end, {
  desc = 'Toggle relative [N]umbers',
})

-- Toggle wrap (Space + z)
vim.keymap.set('n', '<leader>z', function()
  vim.o.wrap = not vim.o.wrap
  vim.notify('Line wrap: ' .. (vim.o.wrap and 'ON' or 'OFF'))
end, {
  desc = 'Toggle line wrap',
})

-- ============================================
-- QUICK FIX LIST NAVIGATION
-- ============================================

-- Next error/warning (]d)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Next diagnostic',
})

-- Previous error/warning ([d)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Previous diagnostic',
})

-- ============================================
-- BETTER ESC (for insert mode)
-- ============================================

-- jk or kj to exit insert mode (fast typing!)
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })

-- ============================================
-- DUPLICATE LINE/SELECTION
-- ============================================

-- Duplicate line (Space + d)
vim.keymap.set('n', '<leader>d', 'yyp', {
  desc = '[D]uplicate line',
})

-- Duplicate selection (Space + d in visual)
vim.keymap.set('v', '<leader>d', 'y`>p', {
  desc = '[D]uplicate selection',
})

-- ============================================
-- DELETE WITHOUT YANKING
-- ============================================

-- Delete to black hole register (Space + D)
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"_d', {
  desc = '[D]elete without yanking',
})

-- ============================================
-- CLEAR SEARCH HIGHLIGHT
-- ============================================

-- Already exists as <Esc> but adding Space + h for clarity
vim.keymap.set('n', '<leader>nh', ':nohlsearch<CR>', {
  desc = '[N]o [H]ighlight',
  silent = true,
})

return {}
