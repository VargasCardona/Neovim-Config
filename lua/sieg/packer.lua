--      ██████╗░░█████╗░░█████╗░██╗░░██╗███████╗██████╗░  ██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗
--     ██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔════╝██╔══██╗  ██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝
--    ██████╔╝███████║██║░░╚═╝█████═╝░█████╗░░██████╔╝  ██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░
--   ██╔═══╝░██╔══██║██║░░██╗██╔═██╗░██╔══╝░░██╔══██╗  ██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗
--  ██║░░░░░██║░░██║╚█████╔╝██║░╚██╗███████╗██║░░██║  ██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝
-- ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝  ╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░

-- Packer plugin list

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Pugins

  use "nvim-lua/plenary.nvim" 

  use 'mbbill/undotree' -- Undo history

  use {
	  "ThePrimeagen/harpoon",  -- Switch easily between files
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  use "barrett-ruth/live-server.nvim"

  use "windwp/nvim-ts-autotag"

  use "turbio/bracey.vim"

  use {
	  'phaazon/hop.nvim',
	  branch = 'v2', -- optional but strongly recommended
	  config = function()
		  -- you can configure Hop the way you like here; see :h hop-config
		  require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	  end
  }

  use {
	  'tamton-aquib/duck.nvim',
	  config = function()
		  vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("😀", 10) end, {})
		  vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
	  end
  }

  use 'rafamadriz/friendly-snippets'

  use 'mfussenegger/nvim-jdtls' -- Java language server provider

  use {
	'nvim-lualine/lualine.nvim', -- Lualine themes
	requires = { 'nvim-tree/nvim-web-devicons', opt = true } -- Lualine icons
  }

  use 'wbthomason/packer.nvim' -- Packer main

  use 'windwp/nvim-autopairs' -- Autopair

  use 'hrsh7th/nvim-cmp' -- Completion Engine

  use 'hrsh7th/cmp-nvim-lsp' -- Language Highlight

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- Treesitter (Highlight)

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2', -- Telescope (File finder)
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'VonHeikemen/lsp-zero.nvim', -- Lsp provider
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Snippet Engine
	  }
  }


--    ░█████╗░░█████╗░██╗░░░░░░█████╗░██████╗░  ░██████╗░█████╗░██╗░░██╗███████╗███╗░░░███╗███████╗░██████╗
--    ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗  ██╔════╝██╔══██╗██║░░██║██╔════╝████╗░████║██╔════╝██╔════╝
--   ██║░░╚═╝██║░░██║██║░░░░░██║░░██║██████╔╝  ╚█████╗░██║░░╚═╝███████║█████╗░░██╔████╔██║█████╗░░╚█████╗░
--  ██║░░██╗██║░░██║██║░░░░░██║░░██║██╔══██╗  ░╚═══██╗██║░░██╗██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░░╚═══██╗
-- ╚█████╔╝╚█████╔╝███████╗╚█████╔╝██║░░██║  ██████╔╝╚█████╔╝██║░░██║███████╗██║░╚═╝░██║███████╗██████╔╝
-- ░╚════╝░░╚════╝░╚══════╝░╚════╝░╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░

-- Themes
--
 use({
    'ramojus/mellifluous.nvim',
    config = function()
        require'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
        vim.cmd('colorscheme mellifluous')
    end,
  })

  use {'kdheepak/monochrome.nvim', config = function() -- Monochrome theme
	  vim.cmd 'colorscheme monochrome'
  end}

  use { "ellisonleao/gruvbox.nvim" } -- Gruvbox theme

  use { "kabouzeid/nvim-jellybeans", requires = "rktjmp/lush.nvim" } -- jellybeans theme

  use({ 'rose-pine/neovim', as = 'rose-pine' }) -- Rose pine theme

  use 'kvrohit/rasmus.nvim' -- Rasmus theme

  use "rebelot/kanagawa.nvim"

  use "slugbyte/lackluster.nvim"

end)
