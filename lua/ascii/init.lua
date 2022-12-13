local utils = require("ascii.utils")
local ui = require("ascii.ui")

local art = require("ascii.art")

local M = {
	art = art
}

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
	ui.open()
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

M.get_random_global = function()
	local category = utils.get_random_key(M.art);
	local subcategories = M.art[category]
	local subcategory_key = utils.get_random_key(subcategories)
	local piece = M.get_random(category, subcategory_key)
	return piece
end

return M
