local utils = require("ascii.utils")

local M = {}

M.categories = {
	"consoles",
	"linux",
	"amiga",
	"atari",
	"apple",
}

utils.lazy_load(M, "ascii.computers.", M.categories)

return M
