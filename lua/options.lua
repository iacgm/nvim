local o = vim.opt
local g = vim.g

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

--Line numbers
o.number = true
o.numberwidth = 2
o.ruler = false
o.relativenumber = true
o.splitbelow = true
o.splitright = true

o.updatetime = 250

o.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.cursorlineopt = 'both' -- to enable cursorline!

o.scrolloff = 10

o.linebreak = true
o.hlsearch = false

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 99
o.autoread = true
o.tabstop = 2
o.shiftwidth = 2
o.lazyredraw = true

o.autowriteall = true
