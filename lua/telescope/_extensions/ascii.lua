local ascii = require("ascii")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")

local find_art = function(opts)
	opts = opts or {}

	local results = {}

	for _, category_name in ipairs(ascii.art.categories) do
		-- Make sure category is loaded
		if not ascii.art[category_name] then
			ascii.art[category_name] = require("ascii." .. category_name)
		end

		local category = ascii.art[category_name]

		for _, subcategory_name in ipairs(category.categories) do
			if not category[subcategory_name] then
				local _ = category[subcategory_name]
			end

			local subcategory = category[subcategory_name]
			if type(subcategory) == "table" then
				for art_name, art in pairs(subcategory) do
					if art_name ~= "categories" and type(art) == "table" then
						local name = "ascii.art." .. category_name .. "." .. subcategory_name .. "." .. art_name
						table.insert(results, {
							name = name,
							display = art,
						})
					end
				end
			end
		end
	end

	pickers
		.new(opts, {
			prompt_title = "colors",
			finder = finders.new_table({
				results = results,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.name,
						ordinal = entry.name,
					}
				end,
			}),
			previewer = previewers.new_buffer_previewer({
				define_preview = function(self, entry)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.display)
				end,
			}),

			sorter = conf.generic_sorter(opts),
		})
		:find()
end

return require("telescope").register_extension({
	exports = {
		ascii = find_art,
	},
})
