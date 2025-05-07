local utils = require("ascii.utils")

local M = {}

M.categories = {
	"simpsons",
	"futurama",
}

utils.lazy_load(M, "ascii.cartoons.", M.categories)

return M
