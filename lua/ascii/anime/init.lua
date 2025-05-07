local utils = require("ascii.utils")

local M = {}

local categories = {
	"onepiece",
}

utils.lazy_load(M, "ascii.anime.", categories)

return M
