-- An example treesitter aware vim motions

local M = {}

local function debug_tree(node, indent)
	if indent == nil then
		indent = 0
	end
	if node ~= nil and node:child_count() ~= 0 then
		local s = ''
		for i = 0, indent, 1 do
			s = s .. "  "
		end
		print(s .. node:sexpr())
		for c in node:iter_children() do
			debug_tree(c, indent + 1)
		end
	end
end

local function after(node)
	local cr, cc = unpack(vim.api.nvim_win_get_cursor(0))
	local sr, sc, _, _ = node:range()
	if sr >= cr or (sr == cr and sc > cc) then
		return true
	end
	return false
end

function get_tree()
	local ps = vim.treesitter.get_parser(0)
	if ps == nil then return nil end
	local tree = ps:parse()[1]
	return tree
end

function M.next_function()
	local root = get_tree():root()
	-- debug_tree(root, 0)
	local it = root:iter_children()
	local prev = nil
	local current = nil
	for i in it do
		if i:type():find('function') then
			prev = current
			current = i
			if after(current) then
				break
			end
		end
	end
	return prev, current
end

function M.go_to_next_funcion_declaration(opts)
	local ff, f = M.next_function()
	if ff ~= nil then
		print("prev: " .. ff:range())
	end
	if f ~= nil then
		local r, c = f:range()
		vim.api.nvim_win_set_cursor(0, {r+1, c}) 
	end
end

function M.go_to_prev_funcion_declaration(opts)
	-- Ensure cursor is not on a function node or
	--  it will behave like M.go_to_next_function_declaration
	local tree = get_tree()
	local here = vim.treesitter.get_node()
	if here:type():find('function') or here:type():find('identifier') then
		local cr, cc = here:range()
		vim.api.nvim_win_set_cursor(0, {cr-1, cc})
	end

	local ff, f = M.next_function()
	if ff ~= nil then
		local r, c = ff:range()
		vim.api.nvim_win_set_cursor(0, {r+1, c}) 
	end
end

vim.api.nvim_create_user_command('TMNextFunctionDeclaration', M.go_to_next_funcion_declaration, {})
vim.api.nvim_create_user_command('TMPrevFunctionDeclaration', M.go_to_prev_funcion_declaration, {})

vim.keymap.set('n', 'gnf', M.go_to_next_funcion_declaration, {noremap = true}) 
vim.keymap.set('n', 'gpf', M.go_to_prev_funcion_declaration, {noremap = true}) 

return M
