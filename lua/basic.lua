vim.g.mapleader = " "

--鼠标支持
vim.o.mouse = "a"

vim.wo.number = true
--相对行号
vim.wo.relativenumber = true

--高亮所在行
vim.wo.cursorline = true

--显示左侧图标指示列
vim.wo.signcolumn = "yes"

--缩进
vim.bo.smartindent = true --智能缩进
vim.bo.expandtab = true   --使用空格字符缩进
vim.bo.tabstop = 4
vim.bo.softtabstop = 4    --空格数
vim.bo.shiftwidth = 4     --shift >> 空格数

vim.wo.number = true
vim.wo.colorcolumn = '80'

--关闭自带explore
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


--开启高亮
vim.opt.termguicolors = true


--命令行高
vim.o.cmdheight = 2

--右侧参考线
--vim.wo.colorcolumn = "80"
