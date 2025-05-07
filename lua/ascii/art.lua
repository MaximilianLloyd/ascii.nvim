local utils = require("ascii.utils")
local M = {}

M.categories = {
	"animals",
	"anime",
	"text",
	"misc",
	"gaming",
	"planets",
	"movies",
	"computers",
	"cartoons",
}

utils.lazy_load(M, "ascii.", M.categories)

return M
