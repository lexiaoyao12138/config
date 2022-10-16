-- telescop map
vim.api.nvim_set_keymap("n", "ff", ":Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fg", ":Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fb", ":Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fh", ":Telescope help_tags<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fs", ":Telescope lsp_document_symbols<cr>", { noremap = true })
-- 列出光标下单词的lsp引用
vim.api.nvim_set_keymap("n", "ls", ":Telescope lsp_references prompt_prefix=🔍 theme=cursor<CR>", {noremap = true})


local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")
require("neoclip").setup()

-- Configure the extension
t.setup({
	extensions = {
		zoxide = {
			prompt_title = "[ Walking on the shoulders of TJ ]",
			mappings = {
				default = {
					after_action = function(selection)
						print("Update to (" .. selection.z_score .. ") " .. selection.path)
					end
				},
				["<C-s>"] = {
					before_action = function(selection) print("before C-s") end,
					action = function(selection)
						vim.cmd("edit " .. selection.path)
					end
				},
				["<C-q>"] = { action = z_utils.create_basic_command("split") },
			},
			vim_bookmarks = {
				themes = "ivy",
			},
		},
	},
})

-- Load the extension
t.load_extension('zoxide')
-- 书签选择
t.load_extension('vim_bookmarks')
-- 剪切板
t.load_extension('neoclip')

-- Add a mapping
vim.keymap.set("n", "Cd", t.extensions.zoxide.list)
