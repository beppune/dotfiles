
o = vim.o
a = vim.api
c = vim.cmd
g = vim.g

o.tabstop = 4
o.shiftwidth = 4
o.number = true
o.relativenumber = true
o.mouse = ""

c.colorscheme('blue')

g.mapleader = " "
a.nvim_set_keymap('n', '<Leader>v', '<C-w>v', {noremap = true})
a.nvim_set_keymap('n', '<Leader>w', '<C-w>w', {noremap = true})
a.nvim_set_keymap('n', '<Leader>r', '<C-w>r', {noremap = true})

a.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})
a.nvim_set_keymap('i', '<C-o>', '<Esc>o}<Esc>O', {noremap = true})
a.nvim_set_keymap('i', '<C-s>', '<Esc>:w<Enter>i', {noremap = true})

a.nvim_set_keymap('n', '<C-h>', '<Esc>:noh<Enter>', {noremap = true})


-- AUTOCOMMAND GROUP FOR FOLDING

folds = a.nvim_create_augroup('Folds', {
	clear = true
})

a.nvim_create_autocmd('FileType', {
	group = folds,
	pattern = 'c,rust',
	callback = 'set foldmethod=indent'
})

a.nvim_create_autocmd('FileType', {
	group = folds,
	pattern = 'c,rust',
	callback = 'set foldcolumn=1'
})

