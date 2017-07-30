"
"  _   _                  __                           __      _           
"  | |_(_)_ __ ___   ___  / _|_   _ _ __ _ __ ___ _ __ / /_   _(_)_ __ ___  
"  | __| | '_ ` _ \ / _ \| |_| | | | '__| '__/ _ \ '__/ /\ \ / / | '_ ` _ \ 
"  | |_| | | | | | | (_) |  _| |_| | |  | | |  __/ | / /_ \ V /| | | | | | |
"   \__|_|_| |_| |_|\___/|_|  \__,_|_|  |_|  \___|_|/_/(_) \_/ |_|_| |_| |_|
"
"
"                       Timo Furrer's vim configuration. 
"                      https://github.com/timofurrer/.vim
"                                                                            
"

" disable compatibility mode to improve vim experience
set nocompatible

" use 256 ANSI color palette
set t_Co=256

" enable syntax highlighting
syntax on

" clear all highlighting
highlight clear

" detect filetypes
filetype plugin indent on

" indentation settings
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent
set smartindent

" enable folding
set foldmethod=marker
set foldenable

" clipboard settings
set clipboard=unnamedplus

" use UNIX fileformat
set fileformat=unix

" search settings
set hlsearch  " highlight search matches
set incsearch  " incremental search 
set ignorecase  " ignore case by default
set smartcase  " if upper carachters are used the search becomes case sensitive

" disable backup files
set nobackup

" wild menu and completion settings
set wildmenu
set wildmode=longest,list
set completeopt=menuone,menu,longest,preview

" language settings
set spelllang=en_US

" ignore some file endings for various searches
set wildignore+=*.o,*.lo,*.la,*.obj,.git,*.pyc,*.so,*/.git/*

" set correct number formats for Ctrl+A and Ctrl+X
set nrformats=alpha,octal,hex

" configure undo files
set undodir=~/.vim/undodir
set undofile

" enable line numbering
set number

" Colorscheme {{{
    let g:solarized_termtrans = 1
    let g:solarized_termcolors = 256
    let g:solarized_bold = 1
    let g:solarized_underline = 1
    let g:solarized_italic = 1
    let g:solarized_contrast="high"
    set background=dark
    colorscheme solarized
" }}}
