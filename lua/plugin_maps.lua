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

-- Search subset of files by default
function Split_str(s, pat)
	local out = {}
	for dir in string.gmatch(s, "[^" .. pat .. "]+") do
		table.insert(out, dir)
	end
	return out
end

local function get_search_dirs()
	local curr = vim.g.search_dirs
	if curr == nil then curr = "" end
	return Split_str(curr, ",")
end

local function set_search_dirs()
	local curr = vim.g.search_dirs
	if curr == nil then curr = "" end
	vim.g.search_dirs = vim.fn.input("Search Directory:", curr, "dir")
end

map("n", "<leader>cd", set_search_dirs, { desc = "Set search directory" })

-- Telescope keymaps
map("n", "<leader>tkm", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })
map("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics" })
map("n", "<leader>o", "<cmd>Telescope oldfiles<cr>", { desc = "Search oldfiles" })
map("n", "<leader>r", "<cmd>Telescope resume<cr>", { desc = "Search resume" })
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Search find buffers" })

map("n", "<leader>/", function() require("telescope.builtin").live_grep({ search_dirs = get_search_dirs() }) end,
	{ desc = "Search live_grep" })
map("n", "<leader>f",
	function()
		require("telescope.builtin").find_files({ search_dirs = get_search_dirs() })
	end,
	{ desc = "Search find files" }
)
