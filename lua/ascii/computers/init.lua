local utils = require("ascii.utils")

local M = {}

local categories = {
	"consoles",
	"linux",
	"amiga",
	"atari",
}

utils.lazy_load(M, "ascii.computers.", categories)

return M
