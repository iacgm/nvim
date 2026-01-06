require"plugin_maps"
local map = vim.keymap.set

map("n", "gsd", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Show deleted"})
map("n", "gsb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame line"} )
map("n", "gsr", "<cmd>Gitsigns change_base HEAD<cr>", { desc = "Git reset base"})
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status"})

local function git_log_cmd()
	local branch = vim.fn.trim(vim.fn.system("git branch --show-current"))
	local bc = Split_str("git merge-base origin " .. branch, ' ')
	local sys = vim.system(bc):wait()
	local base = ""
	if sys.code == 0 then
		base = vim.fn.trim(sys.stdout) .. "~1.. "
	end
	return "git log " .. base .. "--oneline"
end

-- Git history (local, buffer, full local, full buffer)

local actions_state = require("telescope.actions.state")
local function diff_to_commit()
	local commit = actions_state.get_selected_entry().value
	vim.cmd("G difftool " .. commit)
	require"gitsigns".change_base(commit)
end

local function buffer_diff()
	local commit = actions_state.get_selected_entry().value
	vim.cmd("Gvdiffsplit " .. commit)
	require"gitsigns".change_base(commit)
end

local function checkout_commit()
	local commit = actions_state.get_selected_entry().value
	vim.cmd("G checkout " .. commit)
end

local git_mappings = function(_, lmap)
	lmap({"n", "i"}, "<cr>", diff_to_commit)
	lmap({"n", "i"}, "<C-f>", diff_to_commit)
	lmap({"n", "i"}, "<C-b>", buffer_diff)
	lmap({"n", "i"}, "<C-c>", checkout_commit)
	return true
end

local buff_git_mappings = function(_, lmap)
	lmap({"n", "i"}, "<cr>", buffer_diff)
	lmap({"n", "i"}, "<C-f>", diff_to_commit)
	lmap({"n", "i"}, "<C-b>", buffer_diff)
	lmap({"n", "i"}, "<C-c>", checkout_commit)
	return true
end

map("n", "<leader>gd", function()
	local c = Split_str('git diff --name-only', ' ')
	require("telescope.builtin").git_files({ git_command = c })
end, { desc = "Changed files" })
map("n", "<leader>gh", function()
	local c = Split_str(git_log_cmd(), ' ')
	require("telescope.builtin").git_commits({ git_command = c, attach_mappings = git_mappings })
end, { desc = "Git History" })
map("n", "<leader>gbh", function()
	local c = Split_str(git_log_cmd(), ' ')
	require("telescope.builtin").git_bcommits({ git_command = c, attach_mappings = git_mappings })
end, { desc = "Git Buffer History" })
map("n", "<leader>gfh", function()
	require("telescope.builtin").git_commits({ attach_mappings = buff_git_mappings })
end, { desc = "Git Full History" })
map("n", "<leader>gfb", function()
	require("telescope.builtin").git_bcommits({ attach_mappings = buff_git_mappings })
end, { desc = "Git Full Buffer History" })

map("n", "<leader>gb", function()
	require("telescope.builtin").git_branches({ show_remote_tracking_branches = false, attach_mappings = git_mappings })
end, { desc = "Search git branches" })
