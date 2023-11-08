require("sieg.remap")
require("sieg.init")
require("lualine").setup()
require('live-server').setup(opts)
require('nvim-ts-autotag').setup()

require("luasnip/loaders/from_vscode").load({ paths = { "C:/Users/57320/AppData/Local/nvim-data/site/pack/packer/start/friendly-snippets" } })
