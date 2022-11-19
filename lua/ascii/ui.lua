local Popup = require("nui.popup")
local NuiText = require("nui.text")
local NuiLine = require("nui.line")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local ascii_art = require("ascii.art")

local config = {
	width = 60,
	height = 10,
}

local M = {}


M.open = function()
	local menu_items = {}

	for k, v in pairs(ascii_art) do --pseudocode
		table.insert(menu_items, Menu.item(k))
	end

	local menu = Create_menu(menu_items, function(item)
		local sub_menu_items = {}

		for sk, _ in pairs(ascii_art[item.text]) do --pseudocode
			table.insert(sub_menu_items, Menu.item(sk))
		end

		local sub_menu = Create_menu(sub_menu_items, function(subitem)
			local category_art = ascii_art[item.text][subitem.text]

			M.create_window(category_art, item.text, subitem.text)
		end)

		sub_menu:mount()
	end)

	menu:mount()
end

M.create_window = function(art_pieces, category, subcategory)
	local index = 1
	local indexes = {}

	local i = 1

	local length = 0

	for k, _ in pairs(art_pieces) do
		indexes[i] = k
		i = i + 1
		length = length + 1
	end


	local popup = Popup({
		enter = true,
		focusable = true,
		zindex = 50,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "50%",
			height = "50%",
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:SpecialChar",
		},

	})

	local ok = popup:map("n", "<esc>", function(bufnr)
		popup:unmount()
	end, { noremap = true })

	local ok = popup:map("n", "k", function(bufnr)
		if (index > 1) then
			index = index - 1
			local piece_key = indexes[index]
			local piece = art_pieces[piece_key]
			Clear_buffer(popup.bufnr)
			Draw_piece(piece, category, subcategory, piece_key,  popup.bufnr, index, length)
		end
	end, { noremap = true })

	local ok = popup:map("n", "j", function(bufnr)
		if (index < length) then
			index = index + 1
			local piece_key = indexes[index]
			local piece = art_pieces[piece_key]
			Clear_buffer(popup.bufnr)
			Draw_piece(piece, category, subcategory, piece_key,  popup.bufnr, index, length)
		end
	end, { noremap = true })

	-- P(popup)

	popup:mount()

	local piece_key = indexes[index]
	local piece = art_pieces[piece_key]

	Draw_piece(piece, category, subcategory, piece_key, popup.bufnr, index, length)
end

function Clear_buffer(bufnr)
	-- Clear buffer
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {})
end

function Draw_piece(piece, category, subcategory, piece_key, bufnr, index, length)
	local line = NuiLine()

	line:append("Path: " .. "ascii.art." .. category .. "." .. subcategory .. "." .. piece_key .. " | " .. index .. "/" .. length)
	local ns_id, linenr_start = -1, 1
	vim.api.nvim_buf_set_lines(bufnr, 1, 1, false, piece)
	line:render(bufnr, ns_id, linenr_start)
end

function Create_menu(items, on_submit)
	local menu = Menu({
		position = "50%",
		size = {
			width = 25,
			height = 5,
		},
		border = {
			style = "single",
			text = {
				top = "Choose a category",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = items,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
		end,
		on_submit = on_submit,
	})

	return menu
end

return M;
