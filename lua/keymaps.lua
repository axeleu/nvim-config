--[
-- This is the main file to set and customize keymaps
--]

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Centering of screen
vim.api.nvim_set_keymap("n", "<C-D>", "<C-D>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-U>", "<C-U>zz", { noremap = true, silent = true })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Shortcut to open terminal (below) 
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("split")  -- create horizontal split
    vim.cmd("term")   -- open terminal
    vim.cmd("resize 15") -- resize split to 15 lines
    vim.cmd("startinsert") -- Go to insert mode
end, { desc = "Open terminal below" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Brute force SQL
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.cmd("setfiletype tsql")
    end,
})

-- Yanking into and pasting from system clipboard register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Map <leader>cf to run sqlfluff fix on the current file
vim.keymap.set("n", "<leader>cs", function()
    local filepath = vim.fn.expand("%:p") -- full path of current file
    if filepath == "" then
        print("No file to format")
        return
    end
    -- Run sqlfluff fix on the current file
    local cmd = string.format('sqlfluff fix "%s" ', filepath)
    -- Execute shell command
    local result = vim.fn.system(cmd)
    -- Reload buffer to see changes
    vim.cmd("edit!")
    -- Print output for info
    print(result)
end, { desc = "SQLFluff: fix current file" })
