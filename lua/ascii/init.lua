local utils = require("ascii.utils")

local art = require("ascii.art")

local M = {
	art = art,
}

-- Simple setup function for lazy.nvim
M.setup = function()
	return M
end

-- shallow print of key names
M.print_category = function()
	local categories = {}

	for _, v in pairs(M.art) do
		for k, _ in pairs(v) do
			table.insert(categories, k)
		end
	end

	utils.DeepPrint(categories)
end

M.print_subcategory = function(category, subcategory)
	print("Category: ", category)

	local print_art = M.art[category][subcategory]

	utils.DeepPrint(print_art)
end

M.preview = function()
	require("ascii.ui").open()
end

M.get_random = function(category, subcategory)
	math.randomseed(os.time())

	if not M.art[category] then
		M.art[category] = require("ascii." .. category)
	end

	if not M.art[category][subcategory] then
		local _ = M.art[category][subcategory]
	end

	local pieces = M.art[category][subcategory]
	if not pieces then
		return nil
	end

	local keys = {}
	for k, _ in pairs(pieces) do
		table.insert(keys, k)
	end

	if #keys == 0 then
		return nil
	end

	local random_key = math.random(1, #keys)
	local actual_key = keys[random_key]

	local piece = pieces[actual_key]

	return piece
end

M.get_random_global = function()
	math.randomseed(os.time() + math.random(1, 1000))

	local category_name = M.art.categories[math.random(1, #M.art.categories)]

	if not M.art[category_name] then
		M.art[category_name] = require("ascii." .. category_name)
	end

	local category_module = M.art[category_name]
	local subcategory_name = category_module.categories[math.random(1, #category_module.categories)]

	local art = M.get_random(category_name, subcategory_name)

	return art
end

return M
