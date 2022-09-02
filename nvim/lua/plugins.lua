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
end)
