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
keymap("n", "<leader>e", ":NvimTreeToggle<CR>",opts)

-- Aerial
keymap("n", "<leader>a", ":NvimTreeClose<CR>:AerialToggle<CR>",opts)

-- LSP
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>lua require'trouble'.toggle()<CR>",opts )
keymap("n", "<leader>xw", "<cmd>lua require'trouble'.toggle('workspace_diagnostics')<CR>",opts)
keymap("n", "<leader>xd", "<cmd>lua require'trouble'.toggle('document_diagnostics')<CR>",opts)
keymap("n", "<leader>xq", "<cmd>lua require'trouble'.toggle('quickfix')<CR>",opts)
keymap("n", "<leader>xl", "<cmd>lua require'trouble'.toggle('loclist')<CR>",opts)
keymap("n", "gR", "<cmd>lua require'trouble'.toggle('lsp_references')<CR>",opts)

--Resize with arrows
keymap("n","<C-Up>", ":resize +2<CR>", opts)
keymap("n","<C-Down>", ":resize -2<CR>", opts)
keymap("n","<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n","<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate Buffers
keymap("n","<S-l>", ":bnext<CR>", opts)
keymap("n","<S-h>", ":bprevious<CR>",opts)
keymap("n","<S-q>", ":Bdelete<CR>",opts)

-- Telescope
keymap("n","<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",opts)
keymap("n", "<c-f>", "<cmd>Telescope live_grep<cr>", opts)

-- Tagbar
keymap("n","<leader>t",":TagbarToggle<CR>",opts)

-- Git
keymap("n","<leader>gs", ":Git<CR>",opts)
keymap("n","<leader>gc", ":Git commit<CR>",opts)
keymap("n","<leader>gp", ":Git push<CR>",opts)

-- Golang
keymap("n","<leader>gb", ":GoBuild<CR>",opts)
keymap("n","<leader>gt", ":GoTest<CR>",opts)
keymap("n","<leader>gr", ":GoRun<CR>",opts)
keymap("n","<leader>gz", ":GoCoverage<CR>",opts)
keymap("n","<leader>gl", ":GoLint<CR>",opts)
keymap("n","<leader>gv", ":GoVet<CR>",opts)

-- Visual --
-- Indent
keymap("v","<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==",opts)
keymap("v", "<A-j>", ":m .+1<CR>==",opts) 
-- More familiar pasting
keymap("v", "p", '"_dP', opts)

-- Visual Block
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv",opts)
keymap("x", "K", ":move '<-2<CR>gv-gv",opts)
