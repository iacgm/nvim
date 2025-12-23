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

-- Git keymaps

---@diagnostic disable-next-line: param-type-mismatch
map("n", "gsq", function() require("gitsigns").setqflist("all") end, { desc = "Set quickfix list to diffs" })
map("n", "gsd", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Show deleted"})
map("n", "gsb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame line"} )
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status"})
map("n", "<leader>gh", function()
	local branch = vim.fn.trim(vim.fn.system("git branch --show-current"))
	local bc = Split_str("git merge-base origin " .. branch, ' ')
	local sys = vim.system(bc):wait()
	local base = ""
	if sys.code == 0 then
		base = vim.fn.trim(sys.stdout) .. "~1.. "
	end
	local c = Split_str("git log " .. base .. "--oneline", ' ')
	require("telescope.builtin").git_commits({ git_command = c})
end, { desc = "Search commits" })

map("n", "<leader>gd", function()
	require("telescope.builtin").git_files({ git_command = { "git", "diff", "--name-only" } })
end, { desc = "Search diff" })

map("n", "<leader>gc", function()
	require("telescope.builtin").git_branches({ show_remote_tracking_branches = false })
end, { desc = "Search git branches" })

-- Other Telescope keymaps
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
