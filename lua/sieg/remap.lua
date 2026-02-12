-- =============================================================================
-- KEYBINDINGS AND OPTIONS CONFIGURATION
-- =============================================================================

-- Set leader key to space
vim.g.mapleader = " "

-- =============================================================================
-- TAB BEHAVIOR
-- =============================================================================
-- Command mode: Tab exits to normal mode
vim.keymap.set("c", "<Tab>", "<C-C><Esc>")
-- Insert mode: Tab exits to normal mode and stays at cursor position
vim.keymap.set("i", "<Tab>", "<Esc>`^")

-- =============================================================================
-- PYTHON EXECUTION
-- =============================================================================
-- F5: Save and run current Python file with output capture
vim.keymap.set('n', '<F5>', function()
    vim.cmd('w')
    local file_path = vim.fn.expand('%')
    vim.fn.jobstart('python ' .. file_path, {
        on_stdout = function(_, data, _)
            if data then
                vim.api.nvim_echo({ { table.concat(data, '\n'), 'Normal' } }, false, {})
            end
        end,
        on_stderr = function(_, data, _)
            if data then
                vim.api.nvim_echo({ { table.concat(data, '\n'), 'ErrorMsg' } }, false, {})
            end
        end,
    })
end, { noremap = true, silent = false })

-- =============================================================================
-- TAB KEY MODIFIERS
-- =============================================================================
-- CapsLock acts as Tab in insert mode
vim.api.nvim_set_keymap("i", "<CapsLock>", "<Tab>", { noremap = true, silent = true })
-- CapsLock enters insert mode and inserts Tab
vim.api.nvim_set_keymap("n", "<CapsLock>", "i<Tab>", { noremap = true, silent = true })
-- F13 acts as Tab in insert mode
vim.api.nvim_set_keymap("i", "<F13>", "<Tab>", { noremap = true, silent = true })

-- =============================================================================
-- CLIPBOARD AND MOUSE
-- =============================================================================
-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
-- Disable mouse support
vim.opt.mouse = ""

-- =============================================================================
-- NAVIGATION DISABLING
-- =============================================================================
-- Disable arrow keys in normal mode to force hjkl usage
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
-- Disable some arrow keys in insert mode
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

-- =============================================================================
-- SCROLLING
-- =============================================================================
-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- =============================================================================
-- FILE OPERATIONS
-- =============================================================================
-- Ctrl+p: Save and run Python in split terminal
vim.keymap.set("n", "<C-p>", ":w <CR> :sp <CR> :term python3 % <CR> <Esc>i")
-- Ctrl+ho: Save and open file in Firefox
vim.keymap.set("n", "<C-ho", ":w <CR> :silent !firefox % <CR>")
-- Ctrl+s: Save file
vim.keymap.set("n", "<C-s>", ":w <CR>")

-- =============================================================================
-- MOVEMENT AND SEARCH
-- =============================================================================
-- Leader+w: Hop to word (requires hop.nvim plugin)
vim.keymap.set("n", "<leader>w", ":HopWord <CR>")
vim.keymap.set("x", "<leader>w", ":HopWord <CR>")

-- =============================================================================
-- VISUAL MODE
-- =============================================================================
-- Keep selection when indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- =============================================================================
-- EDITOR OPTIONS
-- =============================================================================
-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Line numbers
vim.opt.relativenumber = true
vim.opt.nu = true

-- Display
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Performance
vim.opt.backup = false
vim.opt.swapfile = false

-- Scrolling and timing
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
