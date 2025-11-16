local utils = require("ascii.utils")

local M = {}

M.categories = {
	"onepiece",
	"naruto",
}

utils.lazy_load(M, "ascii.anime.", M.categories)

return M
