"
"   _   _                  __                           __      _
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

" Use comma as the leader key
let mapleader=","

" enable modeline for in-file vim configurations
set modeline

" use 256 ANSI color palette
set t_Co=256

" enable syntax highlighting
syntax on

" clear all highlighting
highlight clear

" detect filetypes
filetype plugin indent on

" indentation settings {{{
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent
set smartindent
" }}}

" enable folding
set foldmethod=marker
set foldenable

" clipboard settings {{{
set clipboard=unnamedplus
" }}}

" use UNIX fileformat
set fileformat=unix

" use utf-8 encoding
set encoding=utf-8

" search settings {{{
set hlsearch  " highlight search matches
set incsearch  " incremental search
set ignorecase  " ignore case by default
set smartcase  " if upper carachters are used the search becomes case sensitive
" }}}

" disable backup files
set nobackup

" wild menu and completion settings {{{
set wildmenu
set wildmode=longest,list
set completeopt=menuone,menu,longest,preview
" }}}

" language settings
set spelllang=en_us

" ignore some file endings for various searches
set wildignore+=*.o,*.lo,*.la,*.obj,.git,*.pyc,*.so,*/.git/*,*.zip,*.tar.gz,*__pycache__/*,

" set correct number formats for Ctrl+A and Ctrl+X
set nrformats=alpha,octal,hex

" configure undo files {{{
set undofile
set undodir=~/.vim/undodir
" }}}

" configure tags {{{
set tags=~/.vim/tags/
" }}}

" enable line numbering
set number

" disable to show mode (airline does it)
set noshowmode

" match opening and closing angle brackets
set matchpairs+=<:>

" Colorscheme {{{
    let g:solarized_termtrans = 1
    let g:solarized_termcolors = 256
    let g:solarized_bold = 1
    let g:solarized_underline = 1
    let g:solarized_italic = 1
    let g:solarized_contrast="high"
    set background=dark
    "colorscheme solarized
    colorscheme gruvbox
" }}}

" general Key Bindings {{{
    " Navigate buffers {{{
        map  <a-left>  :bp<CR>
        imap <a-left>  <ESC>:bp<CR>
        map  <a-right> :bn<CR>
        imap <a-right> <ESC>:bn<CR>
    " }}}

    " Line numbering {{{
        map  <S-F2> :set number! relativenumber!<CR>
        imap <S-F2> <ESC>:set number! relativenumber!<CR>
    " }}}

    " Spelling {{{
        map  <S-F9> :set spell!<CR>
        imap <S-F9> <ESC>:set spell!<CR>
    " }}}

    " Search and Replace {{{
        " Search and Replace word under cursor
        nnoremap <leader>* :%s/<c-r><c-w>/<c-r><c-w>/gc<Left><Left><Left>
        vnoremap <leader>* :s/<c-r><c-w>/<c-r><c-w>/gc<Left><Left><Left>
    " }}}

    " Code Completion {{{
        " completion to Ctrl+Space
        inoremap <Nul> <C-x><C-o>
    " }}}
" }}}

" general autocmd commands {{{
    " set otherwise unsupported filetypes
    autocmd BufNewFile,BufRead *.gv set filetype=dot

    " open files at last opened position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " automatically open and close the popup menu
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

    " remove trailing whitespaces on write
    autocmd BufWritePre * :%s/\s\+$//e

    " set <F5> filetype to proper tool {{{
    autocmd FileType c,cpp map  <F5> :w<CR>:make<CR>
    autocmd FileType c,cpp imap <F5> <ESC>:w<CR>:make<CR>

    autocmd FileType python map  <F5> :w<CR>:!python "%"<CR>
    autocmd FileType python imap <F5> <ESC>:w<CR>:!python "%"<CR>

    autocmd FileType sh map  <F5> :w<CR>:!$SHELL "%"<CR>
    autocmd FileType sh imap <F5> <ESC>:w<CR>:!$SHELL "%"<CR>
    " }}}

    " configure options for tex files {{{
    autocmd FileType tex setl spell cursorline
    " }}}

    " enable spell check for rst and markdown {{{
    autocmd FileType markdown,rst set spell
    " }}}
" }}}

" load config modules {{{
runtime! config/**/*.vim
" }}}

" Load all plugins {{{
packloadall
" generate all helptag documentation
silent! helptags ALL
" }}}
