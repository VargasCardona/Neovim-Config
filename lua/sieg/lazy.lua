-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'nvim-lua/plenary.nvim',
  'mbbill/undotree',
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
  },
  "barrett-ruth/live-server.nvim",
  "windwp/nvim-ts-autotag",
  "turbio/bracey.vim",
  {
      'smoka7/hop.nvim',
      version = "*",
      opts = {
          keys = 'etovxqpdygfblzhckisuran'
      }
  },
  'rafamadriz/friendly-snippets',
  'mfussenegger/nvim-jdtls',
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'windwp/nvim-autopairs',
	{
			'nvim-telescope/telescope.nvim', version = '*',
			dependencies = {
					'nvim-lua/plenary.nvim',
					{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			}
	},
  "ellisonleao/gruvbox.nvim",
  { 
	  	"kabouzeid/nvim-jellybeans",
			dependencies = "rktjmp/lush.nvim"
	},
  'kvrohit/rasmus.nvim',
  "rebelot/kanagawa.nvim",
  "slugbyte/lackluster.nvim",
}

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup(plugins, {})
