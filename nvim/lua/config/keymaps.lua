vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

keymap("n", "<F3>", "<cmd>nohlsearch<CR>", { silent = true })

keymap("n", "<Right>", "<cmd>tabnext<CR>", { silent = true })
keymap("n", "<Left>", "<cmd>tabprevious<CR>", { silent = true })
keymap("n", "<Up>", "<cmd>bprevious<CR>", { silent = true })
keymap("n", "<Down>", "<cmd>bnext<CR>", { silent = true })

keymap("n", "<F5>", "<cmd>!ctags -R<CR>")

keymap("i", "<F15>", "<Nop>", { silent = true })
keymap("i", "<F16>", "<Nop>", { silent = true })

keymap("v", "*", [["zy:let @/ = @z<CR>n]])
