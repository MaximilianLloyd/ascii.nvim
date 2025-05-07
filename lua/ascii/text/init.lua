local utils = require("ascii.utils")

local M = {}

M.categories = {
	"slogons",
	"doom",
	"neovim",
}

utils.lazy_load(M, "ascii.text.", M.categories)

return M
