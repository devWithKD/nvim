local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	-- use 'ellisonleao/gruvbox.nvim'
	use("nvim-treesitter/nvim-treesitter")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use("AlexvZyl/nordic.nvim")
	-- use("shaunsingh/nord.nvim")
	-- use("olimorris/onedarkpro.nvim")
	use("rmehri01/onenord.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use({
		"folke/trouble.nvim",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	}) -- automatically set up your configuration after cloning packer.nvim
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	-- put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
