local map = vim.api.nvim_set_keymap

-- map the leader key
-- map('n', '<Space>', '', {})
vim.g.mapleader = " "

-- copy/paste from system clipboard
map("v", "<leader>y", '"+y', { noremap = true })
map("n", "<leader>p", '"+p', { noremap = true })
map("v", "<leader>p", '"+p', { noremap = true })

-- <leader>a to close quickfix window
-- map("n", "<leader>q", ":cclose<CR>:lclose<CR>:pclose<CR>", { noremap = true })

-- gx to open link & file with macOS 'open' command
map("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', { noremap = true })

-- edit .zshrc
map("n", "<leader>ez", ":e ~/.zshrc<cr>", { noremap = true })

-- <M--> to "<-"
map("i", "<M-->", "<-", { noremap = true })

-- <M-=> to ":="
map("i", "<M-=>", ":=", { noremap = true })

-- J K to mv lines in vmode
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
