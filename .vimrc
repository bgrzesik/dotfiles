set nocompatible
filetype plugin indent on
syntax on

colorscheme ron
set visualbell
set backspace=indent,eol,start
set laststatus=2
set fileformat=unix
set encoding=utf-8
set number
set numberwidth=6
set colorcolumn=80
set hlsearch

set shiftwidth=4
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
autocmd BufNewFile,BufRead *.inc setlocal filetype=cpp

autocmd Syntax c syn match cType "\h\w*_t\w\@!"
autocmd Syntax c syn match cSpecial "\v(struct|union)@<=\s+[a-zA-Z0-9_]+"
autocmd Syntax c syn match cType "[uis]\(8\|16\|32\|64\|128\)"
autocmd Syntax c syn match cType "typedef"
autocmd Syntax c syn match cConstant "\v\w@<!(\u|_+[A-Z0-9])[A-Z0-9_]*\w@!"
autocmd Syntax c syn keyword cStatement sizeof

autocmd Syntax cpp syn match cCustomParen "(" contains=cParen,cCppParen
autocmd Syntax cpp syn match cCustomFunc "\w\+\s*(" contains=cCustomParen
autocmd Syntax cpp syn match cCustomScope "::"
autocmd Syntax cpp syn match cCustomClass "\w\+\s*::" contains=cCustomScope
autocmd Syntax cpp syn match cCustomClassName "\(^class\s\)\@<=\w\+"

autocmd Syntax cpp hi def link cCustomFunc Function
autocmd Syntax cpp hi def link cCustomClass Function
autocmd Syntax cpp hi def link cCustomClassName Function
autocmd Syntax cpp set colorcolumn=120
autocmd Syntax rust set colorcolumn=100
autocmd FileType gitcommit setlocal spell

autocmd VimEnter,WinEnter * hi SpecialKey ctermfg=236

cscope add cscope.out

if 1
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
        "python3 ./install.py --clangd-completer --go-completer --rust-completer --java-completer
        "Plugin 'ycm-core/YouCompleteMe'
        Plugin 'neoclide/coc.nvim'
    call vundle#end()

    let g:ycm_auto_hover=-1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1

    " nnoremap <Leader>p :call youcompleteme#finder#FindSymbol('workspace')<CR>
    " nnoremap <Leader>o :call youcompleteme#finder#FindSymbol('document')<CR>
    " nnoremap <Leader>F :YcmCompleter FixIt<CR>
    "   nmap <Leader>g <Plug>(YCMHover)
    " nnoremap <Leader>n :YcmCompleter GetDoc<CR>
    " nnoremap <Leader>d :YcmCompleter GoTo<CR>
    " nnoremap <Leader>i :YcmCompleter GoToImplementation<CR>
    " nnoremap <Leader>D :YcmCompleter GoToDeclaration<CR>
    " nnoremap <Leader>f :YcmCompleter GoToInclude<CR>
    " nnoremap <Leader>r :YcmCompleter GoToReferences<CR>
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    autocmd CursorHold * silent call CocActionAsync('highlight')

endif
