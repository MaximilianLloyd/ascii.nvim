local utils = require("ascii.utils")

local M = {}

local categories = {
	"planets",
}

utils.lazy_load(M, "ascii.planets.", categories)

return M
