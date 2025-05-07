# Ascii.nvim

A curated collection of ascii art and utilities for your Neovim dashboard.

![Preview of ascii.nvim in neovim](/preview.png)

---

## Installation

- Install using your favorite plugin manager
- Nui.nvim is used for preview functionality

### With packer.nvim
```lua
...
use({ "MaximilianLloyd/ascii.nvim", requires = {
	"MunifTanjim/nui.nvim"
} })
...
```

### With lazy.nvim
```lua
{
  "MaximilianLloyd/ascii.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
```

Then set the art you want in your dashboard configuration. Here i'm using alpha.nvim.

Set a specific art piece.

```lua
...
local options = {
	header = {
		...
	    val = ascii.art.animals.dogs.lucky,
		...
	},
}
...
```

Or get one at random

```lua
...
local options = {
	header = {
		...
	    val = ascii.get_random_global(),
		...
	},
}
...
```

Or get one at random from a subcategory.

```lua
...
local options = {
	header = {
		...
	    val = ascii.get_random("animals", "dogs"),
		...
	},
}
...
```

---

## Usage

See what subcategories are available.

### Browse using poup

![Browse using popup](/preview_demo.png)

```lua
lua require("ascii").preview()
```

`j` to move down in the list and `k` to move up. The path is the value that can be copied to your dashboard configuration.

---

Non-popup way to browse plugins.

```lua
lua require("ascii").print_category("animals")
```

Preview the art available in the subcategory.

```lua
lua require("ascii").print_subcategory("animals", "dogs")
```

Get a random art piece from a subcategory.

```lua
lua require("ascii").get_random("animals", "dogs")
```

## Telescope integration

```lua
telescope.load_extension("ascii")
```

Then you can do

```
Telescope ascii
```

To fuzzy search. The name is the path you can use in your config.

## Categories

- Animals
  - [Dogs](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/animals/dogs.lua)
  - [Cats](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/animals/cats.lua)
  - [Lions](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/animals/lions.lua)
  - [Pandas](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/animals/pandas.lua)
  - [Dinosaurs](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/animals/dinosaurs.lua)
- Anime
  - [One Piece](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/anime/onepiece.lua)
- Movies
  - [Starwars](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/movies/starwars.lua)
  - [Toystory](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/movies/toystory.lua)
- Cartoons
  - [Simpsons](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/cartoons/simpsons.lua)
  - [Futurama](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/cartoons/futurama.lua)
- Gaming
  - [Doom](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/gaming/doom.lua)
  - [Pacman](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/gaming/pacman.lua)
  - [Undertale](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/gaming/undertale.lua)
- Computers
  - [Atari](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/computers/atari.lua)
  - [Amiga](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/computers/amiga.lua)
  - [Apple](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/computers/apple.lua)
  - [Linux](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/computers/linux.lua)
  - [Consoles](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/computers/consoles.lua)
- Misc
  - [Hydra](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/misc/hydra.lua)
  - [Skulls](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/misc/skulls.lua)
  - [Krakens](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/misc/krakens.lua)
- Text
  - [Slogons](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/slogons.lua)
  - [Neovim](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua)
  - [Doom](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/doom.lua)
- Planets
  - [Planets](https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/planets/planets.lua)

## Create your own and contribute

I created a small [rust cli tool](https://github.com/MaximilianLloyd/ascii-lua-table) that converts ascii art to a lua table, so you can easily contribute.

---

### Todo

- [x] Implement telescope extension
- [ ] Random independant of category
- [ ] Proper lazy loading
- [ ] Add more art - Gaming
