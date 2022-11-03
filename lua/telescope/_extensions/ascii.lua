-- Implement picker
-- local pickers = require('telescope.pickers')
-- local finders = require('telescope.finders')
-- local actions = require('telescope.actions')
-- local action_state = require('telescope.actions.state')
-- local conf = require('telescope.config').values
-- local previewers = require('telescope.previewers')
-- local sorters = require('telescope.sorters')
-- local utils = require('telescope.utils')
-- local entry_display = require('telescope.pickers.entry_display')
-- local make_entry = require('telescope.make_entry')
local ascii = require("ascii")

local function get_category_names()
	local categories = {}
	for k, v in pairs(ascii) do
		table.insert(categories, k)
	end
	return categories
end


-- export picker
return require("telescope").register_extension({
	setup = function(ext_config, config)
		-- access extension config and user config
	end,
	exports = {
		stuff = require("ascii").stuff,
	},
})
