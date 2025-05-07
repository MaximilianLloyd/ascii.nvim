local utils = require("ascii.utils")

local M = {}

M.categories = {
	"dogs",
	"cats",
	"lions",
	"pandas",
	"dinosaurs",
}

utils.lazy_load(M, "ascii.animals.", M.categories)

return M
