vim.g.mapleader = " "
vim.keymap.set("c", "<Tab>", "<C-C><Esc>")
vim.keymap.set("i", "<Tab>", "<Esc>`^")

vim.keymap.set('n', '<F5>', function()
    vim.cmd('w')

    -- Get the current file's path
    local file_path = vim.fn.expand('%')

    -- Run the Python script in the background
    vim.fn.jobstart('python ' .. file_path, {
        on_stdout = function(_, data, _)
            -- Print the output to the Neovim message area
            if data then
                vim.api.nvim_echo({ { table.concat(data, '\n'), 'Normal' } }, false, {})
            end
        end,
        on_stderr = function(_, data, _)
            -- Print errors to the Neovim message area
            if data then
                vim.api.nvim_echo({ { table.concat(data, '\n'), 'ErrorMsg' } }, false, {})
            end
        end,
    })
end, { noremap = true, silent = false })

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

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-p>", ":w <CR> :sp <CR> :term python3 % <CR> <Esc>i")
vim.keymap.set("n", "<C-ho", ":w <CR> :silent !firefox % <CR>")

vim.keymap.set("n", "<C-s>", ":w <CR>")

vim.keymap.set("n", "<leader>w", ":HopWord <CR>" )
vim.keymap.set("x", "<leader>w", ":HopWord <CR>" )

vim.keymap.set("v", "<", ">gv")
vim.keymap.set("v", ">", "<gv")
