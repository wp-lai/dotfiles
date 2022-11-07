-- map the leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- remove highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- copy filepath to system clipboard
keymap.set("n", "<leader>cs", ":let @+=expand('%')<CR>")
keymap.set("n", "<leader>cl", ":let @+=expand('%:p')<CR>")

-- copy/paste from system clipboard
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>p", '"+p')
keymap.set("n", "<leader>P", '"+P')
keymap.set("v", "<leader>p", '"+p')

-- gx to open link & file with macOS 'open' command
keymap.set("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>')

-- move lines up or down
keymap.set("n", "<M-Down>", ":m .+1<CR>==")
keymap.set("n", "<M-Up>", ":m .-2<CR>==")
