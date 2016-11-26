syntax on

set visualbell

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set cindent

set number

set laststatus=2
set backspace=2

if has("gui_running")
	color torte
else
	color desert
endif
set cursorline
hi CursorLine term=bold cterm=bold gui=bold,underline guibg=NONE

au BufRead,BufNewFile *.asm set filetype=nasm

au BufRead,BufNewFile *.c syn match cType "[a-zA-Z0-9_]*[a-zA-Z0-9]_t"
au BufRead,BufNewFile *.c syn keyword cStructure struct nextgroup=cStructName skipwhite
au BufRead,BufNewFile *.c syn match cStructName "\h+" contained
au BufRead,BufNewFile *.c hi link cStructName cType

au BufRead,BufNewFile *.h syn match cType "[a-zA-Z0-9_]*[a-zA-Z0-9]_t"
au BufRead,BufNewFile *.h syn keyword cStructure struct nextgroup=cStructName skipwhite
au BufRead,BufNewFile *.h syn match cStructName "\h+" contained
au BufRead,BufNewFile *.h hi link cStructName cType

set nobackup
set nowb
set noswapfile

set guifont=Lucida_Console:h11
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

