set nocompatible
filetype plugin indent on
syntax on

colorscheme ron
set backspace=indent,eol,start
set laststatus=2
set fileformat=unix
set encoding=utf-8
set number
set numberwidth=6
set colorcolumn=80
set hlsearch

set tabstop=4
set expandtab

set ttyfast
set mouse=a
set hidden
set nowrap
set undofile

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap q: <NOP>
noremap Q <NOP>
nmap <C-\> I/*<ESC>A*/<ESC>
nnoremap <Leader>b :buffers<CR>:buffer<Space>

function ToggleCopyMode()
  if !exists('b:copy_mode_on')
    set sessionoptions=buffers
    mksession! ~/.vim.session
    set sessionoptions&vim

    syntax off
    set nolist
    set nonumber
    only

    let b:copy_mode_on=1
  else
    source ~/.vim.session
    call delete(expand('~/.vim.session'))

    syntax on
    set list
    set number

    unlet b:copy_mode_on
  endif
endfunction

command CopyMode call ToggleCopyMode()
command Bd bp\|bd \#

set list
"set listchars=tab:→\ ,trail:•
set listchars=tab:¦\ ,trail:•,space:‧,extends:⟩,precedes:⟨

"autocmd BufNewFile,BufRead *.h setlocal filetype=c
"autocmd BufNewFile,BufRead *.m setlocal filetype=c
autocmd BufNewFile,BufRead *.h setlocal filetype=cpp

autocmd Syntax c syn match cType "\h\w*_t\w\@!"
autocmd Syntax c syn match cSpecial "\v(struct|union)@<=\s+[a-zA-Z0-9_]+"
autocmd Syntax c syn match cType "[uis]\(8\|16\|32\|64\|128\)"
autocmd Syntax c syn match cType "typedef"
autocmd Syntax c syn match cConstant "\v\w@<!(\u|_+[A-Z0-9])[A-Z0-9_]*\w@!"
autocmd Syntax c syn keyword cStatement sizeof

cscope add cscope.out

if 1
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    "python3 ./install.py --clangd-completer --go-completer --rust-completer --java-completer
    Plugin 'ycm-core/YouCompleteMe'
    Plugin 'vim-syntastic/syntastic'
  call vundle#end()

  let g:ycm_auto_hover=-1

  nnoremap <Leader>p :call youcompleteme#finder#FindSymbol('workspace')<CR>
  nnoremap <Leader>o :call youcompleteme#finder#FindSymbol('document')<CR>
  nnoremap <Leader>f :YcmCompleter FixIt<CR>
      nmap <Leader>g <Plug>(YCMHover)
  nnoremap <Leader>n :YcmCompleter GetDoc<CR>
  nnoremap <Leader>d :YcmCompleter GoTo<CR>
  nnoremap <Leader>D :YcmCompleter GoToImplementationElseDeclaration<CR>
  nnoremap <Leader>f :YcmCompleter GoToInclude<CR>
  nnoremap <Leader>r :YcmCompleter GoToReferences<CR>
endif
