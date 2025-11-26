local g = vim.g

g.floaterm_width = 0.9
g.floaterm_height = 0.9

local toggle_modes = {'n', 't'}
local mappings = {
  { toggle_modes, '<M-i>', "<cmd>wa<cr><cmd>FloatermToggle<CR>", },
  { toggle_modes, '<M-t>', "<cmd>wa<cr><cmd>FloatermNew<CR>", },
  { toggle_modes, '<M-n>', "<cmd>wa<cr><cmd>FloatermNext<CR>", },
  { toggle_modes, '<M-p>', "<cmd>wa<cr><cmd>FloatermPrev<CR>", },
  { toggle_modes, '<M-w>', "<cmd>wa<cr><cmd>FloatermKill<CR>", },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
