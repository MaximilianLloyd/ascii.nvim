local utils = require("ascii.utils")

local M = {}

M.categories = {
	"pacman",
	"undertale",
	"doom",
}

utils.lazy_load(M, "ascii.gaming.", M.categories)

return M
