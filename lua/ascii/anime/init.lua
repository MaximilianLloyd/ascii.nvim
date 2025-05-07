local utils = require("ascii.utils")

local M = {}

M.categories = {
	"onepiece",
}

utils.lazy_load(M, "ascii.anime.", M.categories)

return M
