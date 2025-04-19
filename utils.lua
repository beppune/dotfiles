local M = {}

function M.maps(mode)
	local maps = vim.api.nvim_get_keymap(mode)
	for i,v in ipairs(maps) do
		local a = v['rhs']
		local b = v['desc']
		local c = v['lhs']

		if c:sub(1, 1) == ' ' then
			c = '<Leader>' .. c:sub(2)
		end

		if a ~= nill and b ~= nill then
			print( c .. "			" .. "[" .. a .. "] " .. b .. "\n" )
		end
	end
	return maps
end

return M
