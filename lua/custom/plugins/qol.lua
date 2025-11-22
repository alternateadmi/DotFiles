-- Quality of Life Keymaps for Neovim
-- Organized into clean groups - no clutter!

-- ============================================
-- FILE OPERATIONS (Space + f + ...)
-- ============================================

-- Save file
vim.keymap.set('n', '<leader>fw', ':write<CR>', {
  desc = '[F]ile [w]rite (save)',
  silent = true,
})

-- Save all files
vim.keymap.set('n', '<leader>fW', ':wall<CR>', {
  desc = '[F]ile [W]rite all',
  silent = true,
})

-- Close buffer
vim.keymap.set('n', '<leader>fc', ':bdelete<CR>', {
  desc = '[F]ile [c]lose buffer',
  silent = true,
})

-- Quit window
vim.keymap.set('n', '<leader>fq', ':quit<CR>', {
  desc = '[F]ile [q]uit window',
  silent = true,
})

-- Quit all
vim.keymap.set('n', '<leader>fQ', ':quitall<CR>', {
  desc = '[F]ile [Q]uit all',
  silent = true,
})

-- Save and quit
vim.keymap.set('n', '<leader>fx', ':wq<CR>', {
  desc = '[F]ile save and e[x]it',
  silent = true,
})

-- Source current file
vim.keymap.set('n', '<leader>fs', ':source %<CR>', {
  desc = '[F]ile [s]ource (reload)',
  silent = true,
})

-- ============================================
-- BUFFER NAVIGATION (Space + b + ...)
-- ============================================

-- Next buffer
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', {
  desc = '[B]uffer [n]ext',
  silent = true,
})

-- Previous buffer
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', {
  desc = '[B]uffer [p]revious',
  silent = true,
})

-- First buffer
vim.keymap.set('n', '<leader>bf', ':bfirst<CR>', {
  desc = '[B]uffer [f]irst',
  silent = true,
})

-- Last buffer
vim.keymap.set('n', '<leader>bl', ':blast<CR>', {
  desc = '[B]uffer [l]ast',
  silent = true,
})

-- Close buffer (duplicate for convenience)
vim.keymap.set('n', '<leader>bc', ':bdelete<CR>', {
  desc = '[B]uffer [c]lose',
  silent = true,
})

-- List buffers (uses telescope if available)
vim.keymap.set('n', '<leader>bb', '<leader><leader>', {
  desc = '[B]uffer list',
  remap = true,
})

-- ============================================
-- WINDOW MANAGEMENT (Space + w + ...)
-- Note: Using 'ww' prefix to avoid conflict with 'fw' (file write)
-- ============================================

-- Split vertically
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', {
  desc = '[W]indow split [v]ertical',
  silent = true,
})

-- Split horizontally
vim.keymap.set('n', '<leader>wh', ':split<CR>', {
  desc = '[W]indow split [h]orizontal',
  silent = true,
})

-- Equal window sizes
vim.keymap.set('n', '<leader>w=', '<C-w>=', {
  desc = '[W]indow equal sizes',
  silent = true,
})

-- Maximize window
vim.keymap.set('n', '<leader>wm', '<C-w>_<C-w>|', {
  desc = '[W]indow [m]aximize',
  silent = true,
})

-- Close window
vim.keymap.set('n', '<leader>wc', '<C-w>c', {
  desc = '[W]indow [c]lose',
  silent = true,
})

-- Only this window (close all others)
vim.keymap.set('n', '<leader>wo', '<C-w>o', {
  desc = '[W]indow [o]nly (close others)',
  silent = true,
})

-- Resize windows with Ctrl + arrows (not grouped, direct access)
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', {
  desc = 'Increase window height',
  silent = true,
})

vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', {
  desc = 'Decrease window height',
  silent = true,
})

vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', {
  desc = 'Increase window width',
  silent = true,
})

vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', {
  desc = 'Decrease window width',
  silent = true,
})

-- ============================================
-- YANK/PASTE (Space + y + ... / Space + p + ...)
-- ============================================

-- Copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>yy', '"+y', {
  desc = '[Y]ank to system clipboard',
})

-- Copy line to system clipboard
vim.keymap.set('n', '<leader>yY', '"+yy', {
  desc = '[Y]ank line to system',
})

-- Copy whole file to system clipboard
vim.keymap.set('n', '<leader>ya', 'ggyG', {
  desc = '[Y]ank [a]ll (file)',
})

-- Paste from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>pp', '"+p', {
  desc = '[P]aste from system clipboard',
})

-- Paste from system clipboard before cursor
vim.keymap.set({ 'n', 'v' }, '<leader>pP', '"+P', {
  desc = '[P]aste before cursor',
})

-- Paste without yanking (in visual mode)
vim.keymap.set('v', 'p', '"_dP', {
  desc = 'Paste without yanking',
})

-- ============================================
-- TOGGLES (Space + t + ...)
-- Already has some from kickstart, adding more
-- ============================================

-- Toggle line numbers
vim.keymap.set('n', '<leader>tn', function()
  vim.o.number = not vim.o.number
  vim.notify('Line numbers: ' .. (vim.o.number and 'ON' or 'OFF'))
end, {
  desc = '[T]oggle line [n]umbers',
})

-- Toggle relative line numbers
vim.keymap.set('n', '<leader>tN', function()
  vim.o.relativenumber = not vim.o.relativenumber
  vim.notify('Relative numbers: ' .. (vim.o.relativenumber and 'ON' or 'OFF'))
end, {
  desc = '[T]oggle [r]elative numbers',
})

-- Toggle wrap
vim.keymap.set('n', '<leader>tw', function()
  vim.o.wrap = not vim.o.wrap
  vim.notify('Line wrap: ' .. (vim.o.wrap and 'ON' or 'OFF'))
end, {
  desc = '[T]oggle line [w]rap',
})

-- Toggle spell check
vim.keymap.set('n', '<leader>ts', function()
  vim.o.spell = not vim.o.spell
  vim.notify('Spell check: ' .. (vim.o.spell and 'ON' or 'OFF'))
end, {
  desc = '[T]oggle [s]pell check',
})

-- Clear search highlight
vim.keymap.set('n', '<leader>tc', ':nohlsearch<CR>', {
  desc = '[T]oggle [c]lear highlight',
  silent = true,
})

-- ============================================
-- LINE OPERATIONS (Space + l + ...)
-- ============================================

-- Duplicate line down
vim.keymap.set('n', '<leader>ld', 'yyp', {
  desc = '[L]ine [d]uplicate down',
})

-- Duplicate line up
vim.keymap.set('n', '<leader>lu', 'yyP', {
  desc = '[L]ine duplicate [u]p',
})

-- Duplicate selection (in visual mode)
vim.keymap.set('v', '<leader>ld', 'y`>p', {
  desc = '[L]ine [d]uplicate selection',
})

-- Delete line without yanking
vim.keymap.set('n', '<leader>lx', '"_dd', {
  desc = '[L]ine delete (no yank)',
})

-- Join lines without space
vim.keymap.set('n', '<leader>lj', 'gJ', {
  desc = '[L]ine [j]oin (no space)',
})

-- Insert blank line above
vim.keymap.set('n', '<leader>lO', 'O<Esc>j', {
  desc = '[L]ine insert above',
})

-- Insert blank line below
vim.keymap.set('n', '<leader>lo', 'o<Esc>k', {
  desc = '[L]ine insert below',
})

-- Select all
vim.keymap.set('n', '<leader>la', 'ggVG', {
  desc = '[L]ine select [a]ll',
})

-- ============================================
-- QUICKFIX (Space + q + ...)
-- q already used by kickstart for diagnostic quickfix
-- ============================================

-- Next quickfix
vim.keymap.set('n', ']q', ':cnext<CR>zz', {
  desc = 'Next quickfix',
  silent = true,
})

-- Previous quickfix
vim.keymap.set('n', '[q', ':cprev<CR>zz', {
  desc = 'Previous quickfix',
  silent = true,
})

-- Open quickfix list
vim.keymap.set('n', '<leader>qo', ':copen<CR>', {
  desc = '[Q]uickfix [o]pen',
  silent = true,
})

-- Close quickfix list
vim.keymap.set('n', '<leader>qc', ':cclose<CR>', {
  desc = '[Q]uickfix [c]lose',
  silent = true,
})

-- ============================================
-- MOVEMENT ENHANCEMENTS (Direct keys - no prefix)
-- ============================================

-- Better line start/end
vim.keymap.set({ 'n', 'v' }, 'H', '^', {
  desc = 'Go to line start',
})

vim.keymap.set({ 'n', 'v' }, 'L', 'g_', {
  desc = 'Go to line end',
})

-- Keep cursor centered when searching
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search (centered)' })

-- Keep cursor centered when jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Move lines up/down with Alt
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==', {
  desc = 'Move line down',
  silent = true,
})

vim.keymap.set('n', '<A-k>', ':move .-2<CR>==', {
  desc = 'Move line up',
  silent = true,
})

vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv", {
  desc = 'Move selection down',
  silent = true,
})

vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv", {
  desc = 'Move selection up',
  silent = true,
})

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Better insert mode exits
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })

-- ============================================
-- FORMAT (Space + F - LSP format)
-- ============================================

vim.keymap.set('n', '<leader>F', function()
  vim.lsp.buf.format { async = true }
end, {
  desc = '[F]ormat with LSP',
})

return {}
