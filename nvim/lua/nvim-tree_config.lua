require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "make", "go", "cpp", "html", "css", "javascript", "vim", "cmake" },

	sync_install = false,

	auto_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = false,
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},

	indent = {
		enable = false
	}
})


require("nvim-surround").setup({})

require('hlargs').setup()

require("twilight").setup()

