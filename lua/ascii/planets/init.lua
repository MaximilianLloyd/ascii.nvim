local utils = require("ascii.utils")

local M = {}

M.categories = {
	"planets",
}

utils.lazy_load(M, "ascii.planets.", M.categories)

return M
