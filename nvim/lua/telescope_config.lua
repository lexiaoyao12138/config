local vim = vim
-- telescop map
vim.keymap.set("n", "ff", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>")
vim.keymap.set("n", "fm", ":Telescope vim_bookmarks theme=dropdown prompt_prefix=  <cr>")
vim.keymap.set("n", "fb", ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>")
vim.api.nvim_set_keymap("n", "fg", ":Telescope live_grep<cr>", { noremap = true })
-- 列出光标下单词的lsp引用
vim.api.nvim_set_keymap("n", "<space>ls", ":Telescope lsp_references prompt_prefix=🔍 theme=cursor<CR>", {noremap = true})


local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")
require("neoclip").setup()

-- Configure the extension
t.setup({
	pickers = {
		find_files = {
			previewer = false,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown { }
		},
		zoxide = {
			themes = "ivy",
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
		},
	},
})

-- Load the extension
t.load_extension('zoxide')
-- 书签选择
t.load_extension('vim_bookmarks')
-- 剪切板
t.load_extension('neoclip')

t.load_extension("lazygit")

t.load_extension("ui-select")

-- Add a mapping
vim.keymap.set("n", "Cd", t.extensions.zoxide.list)
