
-- MAPPINGS

local function map_key(mode, lhs, rhs, descj)
	a.nvim_set_keymap(mode, lhs, rhs, { 
		noremap = true,
		desc = desc
	})
end

-- Insert Mode
map_key('i', 'jj', '<Esc>', "Use 'jj' in insert mode to switch in normal mode")
map_key('i', '<C-s>', '<Esc>:w<Esc>i', "In insert mode save changes and get back in insert mode")

-- Windows
g.mapleader = " "
map_key('n', '<Leader>v', '<C-w>v', "Split Window Vertically")
map_key('n', '<Leader>r', '<C-w>r', "Rotate Windows")
map_key('n', '<Leader>w', '<C-w>w', "Switch to next window")
map_key('n', '<Leader>o', '<C-w>o', "Make this windows the only one visible")
map_key('n', '<Leader>x', '<C-w>c', "Close current window")
map_key('n', '<Leader>b', '<Esc>:30Lexplore!<Enter>', "Open netrw on the right")

-- Scroll in Normal Mode
-- g.mapleader = " "
map_key('n', '<Leader>j', '<C-d>', "Scroll down half window")
map_key('n', '<Leader>k', '<C-u>', "Scroll up hal window")
map_key('n', '<Leader>h', '<C-e>', "Scroll down one line")
map_key('n', '<Leader>l', '<C-y>', "Scroll up one line")

-- Tabs
-- g.mapleader = " "
map_key('n', '<Leader>t', ':tabnew<Enter>', "New Tab")
map_key('n', '<Leader>c', ':tabclose<Enter>', "Close Tab")
map_key('n', '<Leader>n', ':tabnext<Enter>', "Next Tab")

-- Treesitter Motions
map_key('n', 'ss', '<Plug>(MoveToNextId)')
map_key('n', 'sd', '<Plug>(MoveToPrevId)')

-- Utils
map_key('n', '<C-h>', ':nohlsearch<Enter>', "Clear search highlights")


