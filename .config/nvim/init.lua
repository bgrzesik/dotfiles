vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[ source ~/.vimrc ]]

vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:█"

vim.cmd [[

call plug#begin()
    Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'cherrry/soong.vim'
call plug#end()

highlight IndentBlanklineChar guifg=#555555

]]

vim.cmd [[ source ~/.config/nvim/coc.vim ]]

require('lualine').setup()
require("nvim-tree").setup()
require('gitsigns').setup()
