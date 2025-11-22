local map = vim.keymap.set

-- Navigation in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>wa<CR>", { desc = "general save file" })

map("n", "<C-c>", "gcc", { desc = "toggle comment", remap = true })

map("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", { desc = "telescope diagnostics" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "telescope live_grep" })
map("n", "<leader>o", "<cmd>Telescope oldfiles<cr>", { desc = "telescope oldfiles" })
map("n", "<leader>c", "<cmd>Telescope resume<cr>", { desc = "telescope resume" })
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "telescope find buffers" })
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>F",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
