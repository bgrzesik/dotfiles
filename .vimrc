set nocompatible
filetype plugin indent on
syntax on

colorscheme koehler
set termguicolors

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

set list
set listchars="trail:█"

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap q: <NOP>
noremap Q <NOP>
nmap <C-\> I/*<ESC>A*/<ESC>

autocmd FileType gitcommit setlocal spell

if 1
    if filereadable("/usr/share/doc/fzf/examples/fzf.vim")
        source /usr/share/doc/fzf/examples/fzf.vim
        set rtp+=/usr/local/opt/fzf
    elseif filereadable("/opt/homebrew/opt/fzf/plugin/fzf.vim")
        source /opt/homebrew/opt/fzf/plugin/fzf.vim
        set rtp+=/opt/homebrew/opt/fzf
    endif
    nnoremap <C-p> :FZF<CR>
endif
