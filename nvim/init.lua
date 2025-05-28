
-- Aliases
o = vim.o
c = vim.cmd
a = vim.api
g = vim.g

-- Settings
o.number = true
o.tabstop = 4
o.shiftwidth = 0
o.digraph = true

require('mappings')

vim.lsp.enable('rust_analyzer')

vim.diagnostic.config({
  -- 1. Inline messages (“virtual text”) ---------------------------------------
  virtual_text = {
    -- show only errors (remove this line to see WARN/INFO/HINT too)
    severity = { min = vim.diagnostic.severity.ERROR },
    -- how the message looks
    prefix   = "●",      -- or "", "▎", etc.
    spacing  = 4,        -- distance from code
    source   = "if_many" -- show the linter name when ≥2 sources
  },

  -- 2. Supplementary UI channels (all optional) -------------------------------
  signs          = true,          -- gutter icons
  underline      = true,          -- underline offending text
  update_in_insert = false,       -- speed vs. accuracy trade-off
  severity_sort  = true           -- highest severity on top
})
