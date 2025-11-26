local map = vim.keymap.set

map("t", "<C-k>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ 'i', 'v' }, 'jk', '<ESC>')

vim.keymap.set('n', ',', ';')

-- Better Redo
vim.keymap.set('n', 'U', '<C-r>')

-- Move line up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<M-J>', '<Cmd>m+1<CR>')
vim.keymap.set('n', '<M-K>', '<Cmd>m-2<CR>')

-- Center after scrUp/scrDown
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- (quasi)-Helix-like selection
vim.keymap.set('n', 'x', 'V')
vim.keymap.set('v', 'X', 'k')
vim.keymap.set('v', 'x', 'j')

-- X to delete
vim.keymap.set('n', 'X', 'x')

-- Line wrapping
vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'gj', 'j')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')
vim.keymap.set({ 'n', 'v' }, 'gk', 'k')

-- Center after jumps
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

-- Set diagnostics across files, then jump between them
vim.keymap.set({ 'n', 'v' }, '<M-d>', vim.diagnostic.setqflist, { desc = 'Open diagnostics in Quickfix' })
vim.keymap.set({ 'n', 'v' }, '<M-j>', '<cmd>cnext<CR>zz')
vim.keymap.set({ 'n', 'v' }, '<M-k>', '<cmd>cprev<CR>zz')

-- Only yank to system clipboard after leader
vim.opt.clipboard = ''
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])

-- Deleting doesn't yank (X can be used instead)
vim.keymap.set({ 'n', 'v' }, 'd', [["_d]])
vim.keymap.set({ 'n', }, 'dd', [["_dd]])

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>wa<CR>')

-- Paste-replace without copying
vim.keymap.set('x', 'p', [["_dp]])
vim.keymap.set('x', 'P', [["_dP]])


-- Projects:
vim.keymap.set('n', 'cd', '<cmd>CdProject<CR>')

-- Tree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

-- Leap
map({ 'n', 'x', 'o' }, 'f', '<Plug>(leap)')
