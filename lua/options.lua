--[
-- This is the main file to set and customize neovim options
--]

-- Makes the cursor always look like a block 
-- (no blinking, no changing shape in insert/replace modes)
--vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-c-i:block"

-- Set number lines and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- We have a nerd font installed
vim.g.have_nerd_font = true

--Set indent rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- A vertical line to signal dont go further
vim.opt.colorcolumn = "80"

-- Rules for searching (case insensitive, highlighting, incremental)
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Time in ms to look for e.g LSP and git
vim.opt.updatetime = 100

-- Enable terminal colors
vim.opt.termguicolors = true

-- Keep some lines when scrolling
vim.opt.scrolloff = 8

-- Always show the sign column (used for git diff markers,
-- LSP diagnostics, breakpoints, etc.), so text doesn’t shift.
vim.opt.signcolumn = "yes"

-- Show which mode im in, dont understand how this works with lualine
vim.opt.showmode = false

-- Split behaviour
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Shows some icons for tabs and whitespace and such
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Gives some suggestions in command mode
vim.opt.inccommand = "split"

-- Highlights the line where the cursor is
vim.opt.cursorline = true
