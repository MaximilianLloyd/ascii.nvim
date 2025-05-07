-- local animals = require("ascii.animals")
-- local anime = require("ascii.anime")
-- local text = require("ascii.text")
-- local misc = require("ascii.misc")
-- local gaming = require("ascii.gaming")
-- local planets = require("ascii.planets")
-- local movies = require("ascii.movies")
local utils = require("ascii.utils")
local M = {}

local modules = {
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

utils.lazy_load(M, "ascii.", modules)

return M
