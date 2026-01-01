-----------------------------------------------------------
-- Basic Neovim Init.lua
-- Author: You
-- Feel free to modify anything
-----------------------------------------------------------

---------------------
-- General Settings
---------------------
vim.g.mapleader = " " -- Space as leader key
vim.g.maplocalleader = " "

vim.opt.mouse = "a" -- Enable mouse
vim.opt.clipboard = "unnamedplus" -- System clipboard
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- Persistent undo

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

---------------------
-- UI Settings
---------------------
vim.opt.number = true -- Line numbers
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.wrap = false -- Disable line wrap
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

---------------------
-- Indentation
---------------------
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

---------------------
-- Search
---------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

---------------------
-- Splits
---------------------
vim.opt.splitbelow = true
vim.opt.splitright = true

---------------------
-- Performance
---------------------
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300

---------------------
-- Completion
---------------------
vim.opt.completeopt = { "menu", "menuone", "noselect" }

---------------------
-- Files
---------------------
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.autoread = true

---------------------
-- Keymaps
---------------------
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save & quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":wq<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

---------------------
-- Visual Mode Tweaks
---------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

---------------------
-- Terminal
---------------------
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

---------------------
-- Autocommands
---------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 150 })
	end,
})

---------------------
-- Filetype Specific
---------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

---------------------
-- Diagnostics (built-in LSP)
---------------------
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

require("config.lazy")

require("oil").setup() -- Oil startup
