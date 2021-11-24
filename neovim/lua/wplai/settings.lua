-- alias
local o = vim.opt
local cmd = vim.cmd
local g = vim.g

-- global options
o.ignorecase = true
o.smartcase = true
o.joinspaces = false
o.hidden = true
o.showmatch = true
o.splitbelow = true
o.splitright = true
o.mouse = "a"
o.scrolloff = 8
o.updatetime = 1000
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.relativenumber = true
o.number = true
o.wrap = false
o.colorcolumn = "80"
o.foldlevel = 99 -- unfold when open
o.signcolumn = "yes"
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo/"
o.pumblend = 10 -- enable transparency for the popup-menu
o.inccommand = "nosplit" -- preview the effects of command
o.iskeyword:prepend({ "-" }) -- treat dash separated words as a word textobject
o.termguicolors = true

o.completeopt = {"menu", "menuone", "noselect"}
o.shortmess:append({ c = true })

-- netrw
g.netrw_banner = 0
g.netrw_liststyle = 3

-- python
g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/local/bin/python"

-- -- theme
-- cmd "colorscheme gruvbox-material"
