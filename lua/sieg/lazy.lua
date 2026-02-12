-- Bootstrap lazy.nvim - the modern plugin manager for Neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- Clone lazy.nvim if it doesn't exist yet
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    -- Display error message and exit if clone fails
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- Add lazy.nvim to the runtime path so it can be loaded
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration - list of all plugins to be managed by lazy.nvim
local plugins = {
  'nvim-lua/plenary.nvim',           -- Utility library for Neovim plugins (required by many plugins)
  'mbbill/undotree',                 -- Visual undo history navigator
  {
      "ThePrimeagen/harpoon",        -- Quick navigation between files/bookmarks
      branch = "harpoon2",           -- Use the newer harpoon2 branch
      dependencies = { "nvim-lua/plenary.nvim" }
  },
  "barrett-ruth/live-server.nvim",   -- Live development server for web development
  "windwp/nvim-ts-autotag",          -- Auto-close/rename HTML/JSX tags using treesitter
  "turbio/bracey.vim",               -- Live browser preview for HTML/CSS/JS
  {
      'smoka7/hop.nvim',             -- Easy motion navigation plugin (like easymotion)
      version = "*",
      opts = {
          keys = 'etovxqpdygfblzhckisuran' -- Custom hop keys for navigation
      }
  },
  'rafamadriz/friendly-snippets',   -- Collection of snippets for various languages
  'mfussenegger/nvim-jdtls',         -- Java development tools language server
  {
      'nvim-lualine/lualine.nvim',   -- Status line plugin
      dependencies = { 'nvim-tree/nvim-web-devicons' } -- File icons for status line
  },
  'hrsh7th/nvim-cmp',                -- Completion engine
  'hrsh7th/cmp-nvim-lsp',            -- LSP completion source for nvim-cmp
  'windwp/nvim-autopairs',           -- Auto-close brackets, quotes, etc.
	{
			'nvim-telescope/telescope.nvim', version = '*', -- Fuzzy finder, file browser, etc.
			dependencies = {
					'nvim-lua/plenary.nvim', -- Required dependency
					{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Faster sorting algorithm
			}
	},
  "ellisonleao/gruvbox.nvim",        -- Gruvbox color scheme
  { 
	  	"kabouzeid/nvim-jellybeans",   -- Jellybeans color scheme
			dependencies = "rktjmp/lush.nvim" -- Color scheme creation framework
	},
  'kvrohit/rasmus.nvim',             -- Rasmus color scheme
  "rebelot/kanagawa.nvim",           -- Kanagawa color scheme (inspired by Japanese paintings)
  "slugbyte/lackluster.nvim",        -- Minimal color scheme
}

-- Set up leader keys before loading lazy.nvim to ensure plugin mappings work correctly
-- Leader keys are used for custom keybindings (leader for global, localleader for buffer-local)
vim.g.mapleader = " "               -- Use space as the global leader key
vim.g.maplocalleader = "\\"         -- Use backslash as the local leader key

-- Initialize lazy.nvim with the plugin list
require("lazy").setup(plugins, {})   -- Load all configured plugins
