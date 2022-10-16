-- plugins.luaplug
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- lsp
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" }) -- lspconfig install mananger
	use({ "hrsh7th/nvim-cmp", tag = "v0.0.1" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "onsails/lspkind.nvim" })

	use({ "ray-x/lsp_signature.nvim" })
	use("p00f/clangd_extensions.nvim")

	-- use {
	-- 	'kosayoda/nvim-lightbulb',
	-- 	requires = 'antoinemadec/FixCursorHold.nvim',
	-- }

	use("glepnir/lspsaga.nvim")
	-- theme
	use("Mofiqul/vscode.nvim")
	use({ "sainnhe/gruvbox-material" }) -- theme gruvbox

	use({ "nvim-treesitter/nvim-treesitter" })

	use({ "kylechui/nvim-surround" })

	use('m-demare/hlargs.nvim')

	use("folke/twilight.nvim")

	use({ "windwp/nvim-autopairs" })

	use({ "p00f/nvim-ts-rainbow" })

	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- 望远镜系列
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use { 'stevearc/dressing.nvim' }
	use('jvgrootveld/telescope-zoxide')
	use('tom-anders/telescope-vim-bookmarks.nvim')
	use("AckslD/nvim-neoclip.lua")        -- 剪切板管理
	use ('nvim-telescope/telescope-symbols.nvim')   -- symbols

	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	use({ "simrat39/symbols-outline.nvim" })

	use({ "rcarriga/nvim-notify" })

	use({ "lewis6991/gitsigns.nvim" })

	use({ "skywind3000/asyncrun.vim" })

	use({ "mhartington/formatter.nvim" }) -- format code

	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

	use({ "NvChad/nvim-colorizer.lua" })

	use({ "folke/trouble.nvim" })

	use("lukas-reineke/indent-blankline.nvim")

	use({ "nvim-lualine/lualine.nvim" })

	use("ravenxrz/DAPInstall.nvim") -- help us install several debuggers

	use("mfussenegger/nvim-dap")

	use("theHamsta/nvim-dap-virtual-text")

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	use({ "jbyuki/one-small-step-for-vimkind", module = "osv" }) -- debug any Lua code running in a Neovim instance

	use({
		"sakhnik/nvim-gdb",
		run = "./install.sh",
	})

	use("godlygeek/tabular")

	use("numToStr/Comment.nvim")

	use("RRethy/vim-illuminate")

	--rename
	use {
		'filipdutescu/renamer.nvim',
		branch = 'master',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- use "smjonas/inc-rename.nvim"

	--save
	use("Pocco81/auto-save.nvim")

	--snip
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })

	use "rafamadriz/friendly-snippets"

	use { 'saadparwaiz1/cmp_luasnip' }

	-- vim-bookmarkss 书签功能
	use({ 'MattesGroeger/vim-bookmarks' })

end)
