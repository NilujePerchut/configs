-- ------------------------
-- Setup plugin stuff
-- ------------------------

-- Bootstrapping mode taken from LunarVim
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Please wait during plugins install. Then close and reopen Neovim...")
end
vim.cmd([[packadd packer.nvim]])

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
  -- Make packer manage itself
  use({ "wbthomason/packer.nvim", opt = true })

  -- Interface
	use "folke/which-key.nvim"
	use {
		"nvim-lualine/lualine.nvim",
		--requires = { "kyazdani42/nvim-web-devicons", opt = true }
		requires = { "kyazdani42/nvim-web-devicons" }
	}
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}
	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			"nvim-lua/plenary.nvim",
		}
	}

  -- Lsp
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		}
	}
	use "williamboman/mason.nvim"
	use "neovim/nvim-lspconfig"

  -- Tools
	use "nvim-orgmode/orgmode"
	use {
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
		}
	}

  -- Eye candy
	use "olimorris/onedarkpro.nvim"
	use "ntpeters/vim-better-whitespace"
	use "lukas-reineke/indent-blankline.nvim"
	use "lewis6991/gitsigns.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
		requires = { "p00f/nvim-ts-rainbow", opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
