syntax on               " enable syntax highlighting
set encoding=utf-8

" Leader
let mapleader = " "

set backspace=2         " Backspace deletes like most programs in insert mode
set cursorline          " highlight the current line
set nobackup            " don't create pointless backup files; Use VCS instead
set nowritebackup
set noswapfile
set ruler
set number relativenumber
set autoread            " watch for file changes
set number              " show line numbers
set showcmd             " show selection metadata
set showmode            " show INSERT, VISUAL, etc. mode
set showmatch           " show matching brackets
set autoindent smartindent  " auto/smart indent
set smarttab            " better backspace and tab functionality
set scrolloff=5         " show at least 5 lines above/below
set termguicolors
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

" set whitespace characters to be visible
set list
set listchars=
set listchars+=tab:\│\
set listchars+=trail:·
set listchars+=space:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿
set listchars+=eol:↲
set showbreak=↪\

highlight Whitespace ctermfg=Grey guifg=Grey
highlight NonText ctermfg=Grey guifg=Grey
highlight SpecialKey ctermfg=Grey guifg=Grey
highlight Todo ctermbg=DarkYellow guibg=DarkYellow
highlight Conceal ctermfg=Grey guifg=Grey ctermbg=none guibg=none

" column-width visual indication
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#001D2F

" tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell

" search
set hlsearch            " highlighted search results
set showmatch           " show matching bracket

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with clipboard

" split
set splitbelow
set splitright

" key mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader><Leader> <C-^> " Switch between the last two files
nnoremap <C-P> :Files<CR>


call plug#begin()

Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" indentLine
" Disable override of colors
let g:indentLine_char = "│"
let g:indentLine_setColors = 0
