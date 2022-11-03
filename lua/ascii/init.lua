local animals = require("ascii.animals")

local M = {
	art = {
		animals = animals,
	},
}
function DeepPrint(e)
	-- if e is a table, we should iterate over its elements
	--
	if type(e) == "table" then
		-- print("E", e)
		--
		for k, v in pairs(e) do -- for every element in the table
			-- If string print it
			if type(k) == "string" then
				print("name:", k)
			end
			DeepPrint(v) -- recursively repeat the same procedure
		end
	else -- if not, we can just print it
		print(e)
	end
end

-- shallow print of key names
M.print_category = function()
	local categories = {}

	for _, v in pairs(M.art) do
		for k, _ in pairs(v) do
			table.insert(categories, k)
		end
	end

	DeepPrint(categories)
end

M.print_subcategory = function(category, subcategory)
	print("Category: ", category)

	local art = M.art[category][subcategory]

	DeepPrint(art)
end

M.get_random = function(category, subcategory)
	local pieces = M.art[category][subcategory]

	local keys = {}
	for k, _ in pairs(pieces) do
		table.insert(keys, k)
	end

	local random_key = math.random(1, #keys)
	local actual_key = keys[random_key]

	local piece = pieces[actual_key]

	return piece
end

return M
