-- plugins.lua
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"neovim/nvim-lspconfig",
	})

	use({ "williamboman/mason.nvim" }) -- lspconfig install mananger
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "onsails/lspkind.nvim" })

	use({ "ray-x/lsp_signature.nvim" })

	use({ "sainnhe/gruvbox-material" }) -- theme gruvbox

	use({ "nvim-treesitter/nvim-treesitter" })

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

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

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

	--use({
	--	"ravenxrz/nvim-dap",
	-- commit = "f9480362549e2b50a8616fe4530deaabbc4f889b",
	--})

	use("mfussenegger/nvim-dap")

	use("theHamsta/nvim-dap-virtual-text")

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	use({ "jbyuki/one-small-step-for-vimkind", module = "osv" }) -- debug any Lua code running in a Neovim instance
	use({
		"sakhnik/nvim-gdb",
		run = "./install.sh",
	})
end)
