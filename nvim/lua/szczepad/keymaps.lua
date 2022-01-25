local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader
keymap("","<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n","<C-h>","<C-w>h", opts)
keymap("n","<C-j>","<C-w>j", opts)
keymap("n","<C-k>","<C-w>k", opts)
keymap("n","<C-l>","<C-w>l", opts)

-- Leader + e for File Explorer
keymap("n", "<leader>e", ":Lex 30<cr>",opts)

--Resize with arrows
keymap("n","<C-Up>", ":resize +2<CR>", opts)
keymap("n","<C-Down>", ":resize -2<CR>", opts)
keymap("n","<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n","<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate Buffers
keymap("n","<A-l>", ":bnext<CR>", opts)
keymap("n","<A-h>", ":bprevious<CR>",opts)

-- Visual --
-- Indent
keymap("v","<", "<gv", opts)
keymap("v", ">", ">gv", opts)
