
vim.lsp.config['rustls'] = {
	cmd = { 'rust-analyzer' },
	filetypes = {'rust'},
	root_markers = {'Cargo.toml'},	
	capabilities = vim.lsp.protocol.make_client_capabilities(),
---	settings = {
---     ['rust-analyzer'] = {
---       diagnostics = {
---         enable = false;
---       }
---     }
---   }
}

vim.lsp.enable('rustls')

