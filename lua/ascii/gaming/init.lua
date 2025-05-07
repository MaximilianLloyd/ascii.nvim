local utils = require("ascii.utils")

local M = {}

local categories = {
	"pacman",
	"undertale",
	"doom",
}

utils.lazy_load(M, "ascii.gaming.", categories)

return M
