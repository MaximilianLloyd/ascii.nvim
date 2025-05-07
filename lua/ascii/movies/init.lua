local utils = require("ascii.utils")

local M = {}

local categories = {
	"starwars",
	"toystory",
}

utils.lazy_load(M, "ascii.movies.", categories)

return M
