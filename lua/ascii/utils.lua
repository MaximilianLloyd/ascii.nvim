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

return M
