
-- Aliases
o = vim.o
c = vim.cmd
a = vim.api
g = vim.g

-- Settings
o.number = true
o.tabstop = 4
o.shiftwidth = 0

vim.loader.enable()


vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')

vim.diagnostic.config({
	virtual_text = false,
	signs          = true,          -- gutter icons
	underline      = true,          -- underline offending text
	update_in_insert = true,       -- speed vs. accuracy trade-off
	severity_sort  = true           -- highest severity on top
})

a.nvim_create_autocmd(
	'LspAttach',
	{
		callback = function(ev)
			vim.keymap.set( 'n', 'grd', vim.diagnostic.open_float)

			vim.keymap.set( 'n', 'ss', function()
				vim.diagnostic.jump({count=1})
			end)

			vim.keymap.set( 'n', 'sd', function()
				vim.diagnostic.jump({count=-1})
			end)

			vim.o.signcolumn = 'yes'
		end
	}
)

a.nvim_create_autocmd(
	'LspDetach',
	{
		callback = function(ev)
			vim.keymap.del( 'n', 'grd')
			vim.o.signcolumn = 'auto'
		end
	}
)

require('mappings')
