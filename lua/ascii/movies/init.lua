local utils = require("ascii.utils")

local M = {}

M.categories = {
	"starwars",
	"toystory",
}

utils.lazy_load(M, "ascii.movies.", M.categories)

return M
