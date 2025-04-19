
-- Aliases
o = vim.o
c = vim.cmd
a = vim.api
g = vim.g

-- Settings
c.colorscheme('wildcharm')
c.language('en_US.utf8')
o.number = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4

-- MAPPINGS

local function map_key(mode, lhs, rhs, descj)
	a.nvim_set_keymap(mode, lhs, rhs, { 
		noremap = true,
		desc = desc
	})
end

local function inoremap(lhs, rhs, desc)
	map_key('i', lhs, rhs, desc)
end

local function nnoremap(lhs, rhs, desc)
	map_key('n', lhs, rhs, desc)
end

-- Insert Mode
inoremap( 'jj', '<Esc>', "Use 'jj' in insert mode to switch to normal mode")
inoremap( 'kk', '<Esc>:', "Use 'kk' in insert mode to switch to command mode")
inoremap( '<C-s>', '<Esc>:w<Esc>i', "In insert mode save changes and get back in insert mode")

-- Windows
g.mapleader = " "
nnoremap( '<Leader>v', '<C-w>v', "Split Window Vertically")
nnoremap( '<Leader>r', '<C-w>r', "Rotate Windows")
nnoremap( '<Leader>w', '<C-w>w', "Switch to next window")

-- Scroll in Normal Mode
-- g.mapleader = " "
nnoremap( '<Leader>j', '<C-d>', "Scroll down half window")
nnoremap( '<Leader>k', '<C-u>', "Scroll up half window")
nnoremap( '<Leader>h', '3<C-e>', "Scroll three lines")
nnoremap( '<Leader>l', '3<C-y>', "Scroll up three lines")

-- Tabs
-- g.mapleader = " "
nnoremap( '<Leader>t', ':tabnew<Enter>', "New Tab")
nnoremap( '<Leader>c', ':tabclose<Enter>', "Close Tab")
nnoremap( '<Leader>n', ':tabnext<Enter>', "Next Tab")

-- Edit
nnoremap( 'c"', 'T"ct"', "Change text inside \"\"")
nnoremap( 'c\'', 'T\'ct\'', "Change text inside ''")

-- Utils
nnoremap( '<C-h>', ':nohlsearch<Enter>', "Clear search highlights")

