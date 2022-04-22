local map = vim.api.nvim_set_keymap

-- map the leader key
-- map('n', '<Space>', '', {})
vim.g.mapleader = " "

-- copy/paste from system clipboard
map("v", "<leader>y", '"+y', { noremap = true })
map("v", "<leader>d", '"+d', { noremap = true })
map("n", "<leader>p", '"+p', { noremap = true })
map("n", "<leader>P", '"+P', { noremap = true })
map("v", "<leader>p", '"+p', { noremap = true })
map("v", "<leader>P", '"+P', { noremap = true })

-- <leader>a to close quickfix window
-- map("n", "<leader>q", ":cclose<CR>:lclose<CR>:pclose<CR>", { noremap = true })

-- gx to open link & file with macOS 'open' command
map("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', { noremap = true })

-- <M--> to "<-"
map("i", "<M-->", "<-", { noremap = true })

-- <M-=> to ":="
map("i", "<M-=>", ":=", { noremap = true })

-- move lines up or down
map("n", "<M-Down>", ":m .+1<CR>==", { noremap = true })
map("n", "<M-Up>", ":m .-2<CR>==", { noremap = true })

-- copy filepath to system clipboard
map("n", "<leader>cs", ":let @+=expand('%')<CR>", { noremap = true })
map("n", "<leader>cl", ":let @+=expand('%:p')<CR>", { noremap = true })
