local utils = require("ascii.utils")

local M = {}

local categories = {
	"simpsons",
	"futurama",
}

utils.lazy_load(M, "ascii.cartoons.", categories)

return M
