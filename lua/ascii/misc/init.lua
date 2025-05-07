local utils = require("ascii.utils")

local M = {}

M.categories = {
	"skulls",
	"krakens",
	"hydra",
}

utils.lazy_load(M, "ascii.misc.", M.categories)

return M
