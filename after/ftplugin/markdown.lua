vim.o.spell = true
vim.o.spelllang = 'en_us'

local opts = {remap = true, buffer = true}
vim.keymap.set("n", "<leader>a", "1z=", opts)
vim.keymap.set("n", "K", "z=", opts)

vim.keymap.set("v", "K", "S]%a(", opts)
