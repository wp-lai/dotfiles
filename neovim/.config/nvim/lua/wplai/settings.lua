-- alias
local o = vim.opt

-- line numbers
o.number = true
o.relativenumber = true

-- completion
o.completeopt = { "menuone", "noinsert", "noselect" }
o.shortmess:append({ c = true })

-- search settings
o.ignorecase = true
o.smartcase = true

-- tabs & indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- appearance
o.termguicolors = true
o.laststatus = 3
o.signcolumn = "yes"
o.colorcolumn = "80"
o.pumblend = 15 -- enable transparency for the popup-menu

-- mouse
o.mouse = "a"

-- line wrapping
o.wrap = false

-- split windows
o.splitbelow = true
o.splitright = true

-- scroll
o.scrolloff = 8

-- swap
o.updatetime = 1000

-- fold
o.foldlevel = 99 -- unfold when open

-- undofile
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo/"

-- word pattern
o.iskeyword:prepend({ "-" }) -- treat dash separated words as a word textobject

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
