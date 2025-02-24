vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--关闭自带explore
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--鼠标支持
vim.opt.mouse = "a"

vim.opt.number = true
--相对行号
vim.opt.relativenumber = true

--高亮所在行
vim.opt.cursorline = true

--显示左侧图标指示列
vim.opt.signcolumn = "yes"

--缩进
vim.opt.tabstop = 4
vim.opt.expandtab = true --使用空格字符缩进
vim.opt.softtabstop = 4 --空格数
vim.opt.shiftwidth = 4 --shift >> 空格数

vim.opt.number = true
--右侧参考线
-- vim.opt.colorcolumn = "80"

--开启高亮
vim.opt.termguicolors = true

--命令行高
vim.opt.cmdheight = 2

