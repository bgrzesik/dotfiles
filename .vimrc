syntax on

set visualbell

set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set cindent

set number
set relativenumber

set laststatus=2
set backspace=2

set nobackup
set nowb
set noswapfile

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

if has("gui_running")
    color torte
else
    color desert
endif

set cursorline
hi CursorLine term=bold cterm=bold gui=bold,underline guibg=NONE

au BufRead,BufNewFile *.asm set filetype=nasm

au BufRead,BufNewFile *.c syn match cType "[a-zA-Z0-9_]*[a-zA-Z0-9]_t[^a-zA-Z0-9_]"
au BufRead,BufNewFile *.c syn match cType "\vstruct\s+[a-zA-Z0-9_]+"
au BufRead,BufNewFile *.c syn clear cStructure
au BufRead,BufNewFile *.h syn match cType "\vstruct\s*\{"

au BufRead,BufNewFile *.h syn match cType "[a-zA-Z0-9_]*[a-zA-Z0-9]_t[^a-zA-Z0-9_]"
au BufRead,BufNewFile *.h syn match cType "\vstruct\s+[a-zA-Z0-9_]+"
au BufRead,BufNewFile *.h syn clear cStructure
au BufRead,BufNewFile *.h syn match cType "\vstruct\s*\{" contained

set guifont=Lucida_Console:h11
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

if 1
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
        Plugin 'rust-lang/rust.vim'
        Plugin 'cespare/vim-toml'
        if has('python')
            Plugin 'Valloric/YouCompleteMe'
        endif
    call vundle#end()

    filetype plugin indent on
endif 

