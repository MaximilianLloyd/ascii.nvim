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

return M
