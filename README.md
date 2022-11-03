# Ascii.nvim

Easily get fun ascii art in your Neovim dashboard.
!(Preview of ascii.nvim in neovim)[./preview.png]
---

## Installaton

- Install using your favorite plugin manager (here i'm using packer)

```lua
...
use({ "MaximilianLloyd/ascii.nvim" })
...
```

Then set the art you want in your dashboard. Here i'm using alpha.nvim.

Set a specific art piece.

```lua
local options = {
	header = {
		type = "text",
	    val = ascii.art.animals.dogs.lucky,
		opts = {
			position = "center",
			hl = "AlphaHeader",
		},
	},
}
```
Or get one at random
```lua
local options = {
	header = {
		type = "text",
	    val = ascii.get_random("animals", "dogs"),
		opts = {
			position = "center",
			hl = "AlphaHeader",
		},
	},
}
```

---

## Usage

### See different categories

This is simply a small helper so you don't have to check the sourcecode. Right now animals is the only category.

See what subcategories are available.

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

## Create your own and contribute

I created a small [rust cli tool](https://github.com/MaximilianLloyd/ascii-lua-table) that converts ascii art to a lua table, so you can easily contribute.

### Todo
- [] Add more art
- [] Implement telescope extension
- [] Random independant of category
