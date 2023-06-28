vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true


vim.o.compatible = false

vim.o.visualbell = true
vim.o.backspace = "indent,eol,start"
vim.o.laststatus = 2
vim.o.fileformat = "unix"
vim.o.encoding = "utf-8"
vim.o.number = true
vim.o.numberwidth = 6
vim.o.colorcolumn = 80
vim.o.hlsearch = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.ttyfast = true
vim.o.mouse = "a"
vim.o.hidden = true
vim.o.wrap = false
vim.o.undofile = true

vim.cmd [[
filetype plugin indent on
syntax on
]]

vim.cmd.colorscheme "koehler"

vim.cmd.noremap("<Up>", "<NOP>")
vim.cmd.noremap("<Down>", "<NOP>")
vim.cmd.noremap("<Left>", "<NOP>")
vim.cmd.noremap("<Right>", "<NOP>")
vim.cmd.noremap("q:", "<NOP>")
vim.cmd.noremap("Q", "<NOP>")
vim.cmd.nmap("<C-\\>", "I/*<ESC>A*/<ESC>")

vim.cmd [[ autocmd FileType gitcommit setlocal spell ]]


vim.opt.rtp:append("/usr/local/opt/fzf")

vim.cmd [[
source /usr/share/doc/fzf/examples/fzf.vim
nnoremap <C-p> :FZF<CR>

call plug#begin()
    Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'lewis6991/gitsigns.nvim'
call plug#end()

highlight IndentBlanklineChar guifg=#555555
]]

vim.cmd [[ source ~/.config/nvim/coc.vim ]]

require('lualine').setup()
require("nvim-tree").setup()
require('gitsigns').setup()
