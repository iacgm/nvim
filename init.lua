require "config.lazy"

require "plugin_maps"
require "mappings"
require "options"

vim.api.nvim_create_user_command("Config", "source $MYVIMRC", {})
vim.cmd("colorscheme nightfox")
