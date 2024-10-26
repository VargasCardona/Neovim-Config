vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("c", "<Tab>", "<C-C><Esc>")
vim.keymap.set("i", "<Tab>", "<Esc>`^")

vim.api.nvim_set_keymap("i", "<CapsLock>", "<Tab>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<CapsLock>", "i<Tab>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F13>", "<Tab>", { noremap = true, silent = true })

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

vim.keymap.set("i", "<Up>", "<Nop>")
--vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

vim.opt.mouse = ""

vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

vim.keymap.set("n", "<C-p>", ":w <CR> :sp <CR> :term python3 % <CR> <Esc>i")
vim.keymap.set("n", "<C-ho", ":w <CR> :silent !firefox % <CR>")

vim.keymap.set("n", "<C-s>", ":w <CR>")

vim.keymap.set("n", "<leader>w", ":HopWord <CR>" )
vim.keymap.set("x", "<leader>w", ":HopWord <CR>" )

