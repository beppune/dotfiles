
-- Aliases
o = vim.o
c = vim.cmd
a = vim.api
g = vim.g

-- Settings
o.number = true
o.tabstop = 4
o.shiftwidth = 0
-- o.digraph = true

o.background = 'dark'
c.colorscheme 'carbonfox'

require('mappings')

-- Get this plugin -> https://github.com/neovim/nvim-lspconfig
vim.lsp.enable('rust_analyzer')

vim.diagnostic.config({
  -- 1. Inline messages (“virtual text”) ---------------------------------------
  virtual_text = false,

  -- 2. Supplementary UI channels (all optional) -------------------------------
  signs          = true,          -- gutter icons
  underline      = true,          -- underline offending text
  update_in_insert = false,       -- speed vs. accuracy trade-off
  severity_sort  = true           -- highest severity on top
})

vim.api.nvim_create_autocmd('LspAttach',{
	callback = function(args)
		vim.keymap.set( 'n', 'grd', vim.diagnostic.open_float )
		vim.o.signcolumn = 'yes'
	end
})

-- Function to set StatusLine background color
local function set_statusline_bg(color)
  vim.cmd("highlight StatusLine guibg=" .. color .. " guifg=#ffffff")
end

-- When entering INSERT mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    set_statusline_bg("#005f5f")  -- Teal-like color
  end,
})

-- When leaving INSERT mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    set_statusline_bg("#262626")  -- Back to dark grey or theme default
  end,
})

vim.o.termguicolors = true

-- local original_statusline = vim.api.nvim_get_hl(0, { name = "StatusLine" })

-- Then you can restore it later
-- vim.api.nvim_set_hl(0, "StatusLine", original_statusline)

