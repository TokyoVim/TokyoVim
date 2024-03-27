local data = vim.fn.stdpath "data" .. "/tokyovim"

vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.fillchars = { eob = " ", fold = " ", vert = "│" }
vim.opt.list = true
vim.opt.expandtab = true
vim.opt.autowrite = true
vim.opt.scrolloff = 4
vim.o.syntax = "on"
vim.o.updatetime = 250
vim.o.undofile = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.wo.wrap = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
