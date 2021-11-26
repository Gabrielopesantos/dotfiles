local on_attach = require'completion'.on_attach
require'lspconfig'.tsserver.setup{ on_attach=on_attach }

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.pyright.setup{ on_attach=on_attach }

require'lspconfig'.gopls.setup{
	on_attach=on_attach,
--	cmd = {'gopls', 'serve'}
}
--
--require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
