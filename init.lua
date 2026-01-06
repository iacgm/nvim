require "config.lazy"

require "plugin_maps"
require "git_maps"
require "mappings"
require "options"

vim.api.nvim_create_user_command("Config", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("ClearShada", function()
	vim.system(
		{"rm", "main.shada.tmp.*"},
		{
			cwd = vim.fn.stdpath("data") .. "/" .. "shada"
		}
	)
end, {})
vim.cmd("colorscheme nightfox")
