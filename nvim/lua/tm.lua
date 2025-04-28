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
		return node
	end
	return nil
end

function M.next_function()
	local ps = vim.treesitter.get_parser(0)
	if ps == nil then return nil end
	local tree = ps:parse()[1]
	local root = tree:root()
	-- debug_tree(root, 0)
	local it = root:iter_children()
	local current = nil
	for i in it do
		if i:type():find('function') then
			current = after(i)
			if current ~= nil then break end;
		end
	end
	return current
end

function M.go_to_next_funcion_declaration(opts)
		local c = M.next_function()
		if c ~= nil then
			local r, c = c:range()
			vim.api.nvim_win_set_cursor(0, {r+1, c}) 
		end
end

vim.api.nvim_create_user_command('TMNextFunctionDeclaration', M.go_to_next_funcion_declaration, {})

vim.keymap.set('n', 'gnf', M.go_to_next_funcion_declaration, {noremap = true}) 

return M
