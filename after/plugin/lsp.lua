local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()

require('lspconfig').pyright.setup { capabilities = capabilities }
require('lspconfig').lua_ls.setup { capabilities = capabilities }
require('lspconfig').jdtls.setup { capabilities = capabilities }
require('lspconfig').html.setup { capabilities = capabilities }
require('lspconfig').cssls.setup { capabilities = capabilities }
require('lspconfig').quick_lint_js.setup { capabilities = capabilities }
require('lspconfig').vtsls.setup { capabilities = capabilities }

require("lspconfig").html.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
		},
	}
}

