local ascii = require("ascii")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")

local find_art = function(opts)
	opts = opts or {}
	-- Get all artworks

	local results = {}
	for root, v in pairs(ascii.art) do
		-- loop again
		for second_root, v2 in pairs(v) do
			for third_name, art in pairs(v2) do
				local name = root .. "." .. second_root .. "." .. third_name
				table.insert(results, {
					name = name,
					display = art
				})
			end
		end
	end


	pickers.new(opts, {
		prompt_title = "colors",
		finder = finders.new_table {
			results = results,
			entry_maker = function(entry)
				return {
					value = entry,
					display = entry.name,
					ordinal = entry.name,
				}
			end
		},
		previewer = previewers.new_buffer_previewer({
			define_preview = function(self, entry)
				vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.display)
			end
		}),

		sorter = conf.generic_sorter(opts),
	}):find()
end


-- export picker
return require("telescope").register_extension({
	exports = {
		ascii = find_art,
	},
})
