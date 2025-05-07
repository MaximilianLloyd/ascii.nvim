local utils = require("ascii.utils")

local M = {}

local categories = {
	"dogs",
	"cats",
	"lions",
	"pandas",
	"dinosaurs",
}

utils.lazy_load(M, "ascii.animals.", categories)

return M
