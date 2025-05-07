local utils = require("ascii.utils")

local M = {}

local categories = {
	"skulls",
	"krakens",
	"hydra",
}

utils.lazy_load(M, "ascii.misc.", categories)

return M
