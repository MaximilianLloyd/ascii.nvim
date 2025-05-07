local M = {}

M.DeepPrint = function(e)
	if type(e) == "table" then
		for k, v in pairs(e) do -- for every element in the table
			-- If string print it
			if type(k) == "string" then
				print("name:", k)
			end
			M.DeepPrint(v) -- recursively repeat the same procedure
		end
	else
		print(e)
	end
end

M.get_random_key = function(t)
	local keys = {}

	for k, _ in pairs(t) do
		table.insert(keys, k)
	end

	local random_key = math.random(1, #keys)
	local actual_key = keys[random_key]
	return actual_key
end

M.lazy_load = function(module, path, modules)
	setmetatable(module, {
		__index = function(t, key)
			if vim.tbl_contains(modules, key) then
				local mod = require(path .. key)
				t[key] = mod -- Cache the loaded module
				return mod
			end
			return nil
		end,
	})
end

return M
