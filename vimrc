" ---------------------------------------
" ---- The perfect vim configuration ----
" ---------------------------------------

" be iMproved
set nocompatible

" required for vundle - will be set correctly after vundle settings
filetype off

" Do you want to use the colorscheme solarized? Thus, set to 1 else to 0
let use_cs_solarized = 1

" Do you want to use PEP8 for python files?
let use_pep8 = 0


" -----------------
" ---- Bundles ----
" -----------------

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle - required!
Bundle 'gmarik/vundle'

" vim-fugitive
Bundle 'tpope/vim-fugitive'

" vim-markdown
Bundle 'tpope/vim-markdown'

" nerdcommenter
Bundle 'scrooloose/nerdcommenter'

" nerdtree
Bundle 'scrooloose/nerdtree'

" ctrlp
Bundle 'kien/ctrlp.vim'

" omnicppcomplete
Bundle 'OmniCppComplete'

" taglist
Bundle 'taglist.vim'

" xmledit
Bundle 'xmledit'

" localvimrc
Bundle 'localvimrc'

" DoxygenToolKit
Bundle 'DoxygenToolkit.vim'

" shebang
Bundle 'Shebang'

" Align
Bundle 'Align'

" a.vim
Bundle 'a.vim'

" errormarker.vim
Bundle 'errormarker.vim'

" TaskList.vim
Bundle 'TaskList.vim'

" python indenting - http://www.vim.org/scripts/script.php?script_id=974
Bundle 'gg/python.vim'

" Conque Shell
Bundle 'alejandrogomez/Conque-Shell'

" eregex.vim
Bundle 'othree/eregex.vim'

" vim-pandoc
Bundle 'vim-pandoc/vim-pandoc'
"
" vim-less
Bundle 'groenewege/vim-less'

" colorscheme solarized
Bundle 'altercation/vim-colors-solarized'

" sudoku.vim
Bundle 'timofurrer/sudoku.vim'

" cscope.vim
Bundle 'brookhong/cscope.vim'

" vim-flake8
Bundle 'nvie/vim-flake8'

" vim-visual-increment
Bundle 'triglav/vim-visual-increment'

" --------------------------
" ---- General settings ----
" --------------------------

" syntax highlighting
syntax on

" clear highlighting
highlight clear

" get filetype automatically
filetype plugin indent on

" enable 256 colors
set t_Co=256

" map leader key to comma (,)
let mapleader=","

" tab settings
set expandtab
set shiftwidth=2
set softtabstop=2

" indenting
set cindent
set autoindent
set smartindent

" folding
set nofoldenable

" set clipboard to x-windows selection
set clipboard=unnamed

" set fileformat to unix
set fileformat=unix

" turn on incremental search with ignore case (except explicit caps) and
" highlighting
set hlsearch
set incsearch
set ignorecase
set smartcase

" disable backup files
set nobackup

" show list instead of just completing
set wildmenu

" complete options
set completeopt=menuone,menu,longest,preview

" set tag locations
set tags=tags;/
set tags+=~/.vim/tags/stl_tags

" copy up to 1000 lines from one file to another
set viminfo='1000,\"2000,s2000,h

" Set spell language
set spelllang=de_ch

" wildignore
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,*/.git/*

" status line settings
set laststatus=2 " Always show the statusline
set statusline=%4*---%1*\ %F%m%r%h%w\ %2*%{fugitive#statusline()}%1*\ %{&ff}\ %Y\ \[0x\%02.2B=\%03.3b]\ [%l,%v\ %p%%\ %Lb]\ %3*\[%F\]%1*

" set number formats for Ctrl+A and Ctrl+X
set nrformats=alpha,octal,hex

" ---------------------
" ---- Colorscheme ----
" ---------------------

if use_cs_solarized == 1
  "let g:solarized_termtrans                = 1

  " set termcolors to 256 instead of std 16
  let g:solarized_termcolors                = 256

  " set bold, underline and italic enable
  let g:solarized_bold                      = 1
  let g:solarized_underline                 = 1
  let g:solarized_italic                    = 1

  " set dark background
  set background=dark

  " use colorscheme solarized
  colorscheme solarized
endif


" ----------------------
" ---- Highlighting ----
" ----------------------

" diff highlighting
highlight DiffAdd          cterm=none ctermfg=Black     ctermbg=Green   gui=none guifg=Black guibg=Green
highlight DiffDelete       cterm=none ctermfg=Black     ctermbg=Red     gui=none guifg=Black guibg=Red
highlight DiffChange       cterm=none ctermfg=Black     ctermbg=Yellow  gui=none guifg=Black guibg=Yellow
highlight DiffText         cterm=none ctermfg=Black     ctermbg=Magenta gui=none guifg=Black guibg=Magenta

" status line highlighting
highlight! User1           cterm=bold ctermfg=LightGrey ctermbg=52               guifg=Black guibg=#665555
highlight! User2           cterm=bold ctermfg=DarkGreen ctermbg=52               guifg=Green guibg=#443333
highlight! User3           cterm=bold ctermfg=DarkCyan  ctermbg=52               guifg=Cyan  guibg=#443333
highlight! User4           cterm=bold ctermfg=DarkCyan  ctermbg=52               guifg=Cyan  guibg=#443333

" completion highlighting
highlight Pmenu                       ctermfg=0         ctermbg=2
highlight PmenuSel                    ctermfg=0         ctermbg=7
highlight PmenuSbar                   ctermfg=7         ctermbg=0
highlight PmenuThumb                  ctermfg=0         ctermbg=7


" ----------------------
" ---- Autocommands ----
" ----------------------

if has("autocmd")
  " set filetypes
  autocmd BufNewFile,BufRead *.gv set filetype=dot
  autocmd BufNewFile,BufRead *.feature set filetype=cucumber

  " open files at the last opened position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " delete fugitive buffer with git objects befor opening a new one
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " automatically open and close the popup menu / preview window
  autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

  " remove trailing whitespace on write
  autocmd BufWritePre * :%s/\s\+$//e

  " source the vimrc file after saving it
  autocmd BufWritePost .\=vimrc source $MYVIMRC

  " update taglist
  autocmd BufWritePost * :TlistUpdate

  " Delete .netrwhist ( netrw history file ) after leaving vim
  autocmd VimLeave * if filereadable(".netrwhist") | call delete(".netrwhist") | endif

  " set radish as makeprg
  autocmd FileType cucumber :call SetRadishAsMP()

  " --------
  "  mappings
  " --------

  " if FileType is c or cpp then execute make
  autocmd FileType c,cpp,cucumber  map  <F5> :w<CR>:make<CR>
  autocmd FileType c,cpp,cucumber  imap <F5> <ESC>:w<CR>:make<CR>

  " if FileType is python then start python
  autocmd FileType python          map  <F5> :w<CR>:!python "%"<CR>
  autocmd FileType python          imap <F5> <ESC>:w<CR>:!python "%"<CR>

  " if FileType is python then map Shift + F7 to vim-flake8
  autocmd FileType python          map  <S-F7> :call Flake8()<CR>
  autocmd FileType python          imap <S-F7> <ESC>:call Flake8()<CR>

  if use_pep8 == 1
    " if FileType is python then indent with 4 spaces instead of 2
    autocmd FileType python          setl tabstop=4 softtabstop=4 shiftwidth=4

    " call flake8 after writing a python file
    autocmd BufWritePost *.py call Flake8()
  endif

  " if FileType is shell script then start shell script
  autocmd FileType sh              map  <F5> :w<CR>:!$SHELL "%"<CR>
  autocmd FileType sh              imap <F5> <ESC>:w<CR>:!$SHELL "%"<CR>
endif

function! SetRadishAsMP()
  let l:basedir=system('find -name radish -type d')
  execute "setl mp=radish\\ -d\\ %\\ -b\\ ".l:basedir
endfunction


" ------------------
" ---- Mappings ----
" ------------------

" change window
nnoremap <leader>1 1
nnoremap <leader>2 2
nnoremap <leader>3 3
nnoremap <leader>4 4

" ctrlp.vim :CtrlPBuffer - show all open buffers
map  <F2>       :CtrlPBuffer<CR>
map  <leader>b  :CtrlPBuffer<CR>
imap <F2>       <ESC>:CtrlPBuffer<CR>

" clear search pattern
map  <S-F2>     :nohlsearch<CR>
imap <S-F2>     <ESC>:nohlsearch<CR>

" nerdtree
map  <F3>      :NERDTreeToggle<CR>
imap <F3>      <ESC>:NERDTreeToggle<CR>

" Taglist
map  <F4>      :TlistToggle<CR><C-W><a-right>
imap <F4>      <ESC>:TlistOpen<CR><C-W><a-right>

" Note: F5 is already mapped in autocmd section

" errormarker
map  <S-F5>    :ErrorAtCursor<CR>
imap <S-F5>    <ESC>:ErrorAtCursor<CR>

" a.vim
map  <F6>      :A<CR>
imap <F6>      <ESC>:A<CR>

" Shebang
map  <S-F6>    :call SetExecutable()<CR>
imap <S-F6>    <ESC>:call SetExecutable()<CR>

" Doxygen
map  <F7>      :Dox<CR>
imap <F7>      <ESC>:Dox<CR>

" Note: Shift + F7 is already mapped in autocmd section

" ctags
map  <F8>      :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>
imap <F8>      <ESC>:!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>

" taglist update
map  <S-F8>    :TlistUpdate<CR>
imap <S-F8>    <ESC>:TlistUpdate<CR>

" Spelling
map  <F9>      :set spell!<CR>
imap <F9>      <ESC>:set spell!<CR>

" Next error to F10
map  <F10>     :cn<CR>
imap <F10>     <ESC>:cn<CR>

" :Align =
map  <S-F10>   :Align =<CR>
imap <S-F10>   <ESC>:Align =<CR>

" shortcut to auto indent entire file
map  <F11>     1G=G''
imap <F11>     <ESC>1G=Ga''

" Conque shell horizontal split -> start ipython
map  <S-F11>   :ConqueTermSplit ipython<CR>
imap <S-F11>   <ESC>:ConqueTermSplit ipython<CR>

" Conque Shell horizontal split -> start bash
map  <S-F12>   :ConqueTermSplit bash<CR>
imap <S-F12>   <ESC>:ConqueTermSplit bash<CR>

" window changing
map  <a-left>       :bp<CR>
imap <a-left>  <ESC>:bp<CR>
map  <a-right>      :bn<CR>
imap <a-right> <ESC>:bn<CR>

" remap code completion to Ctrl+Space
inoremap <Nul> <C-x><C-o>

" smart home function
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>


" -----------------------
" ---- Plugin config ----
" -----------------------

" taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth         = 60
let Tlist_Close_On_Select  = 1

" OmniCompletion
let OmniCpp_NamespaceSearch   = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess        = 1
let OmniCpp_MayCompleteDot    = 1
let OmniCpp_MayCompleteArrow  = 1
let OmniCpp_MayCompleteScope  = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" support local vim config in .lvimrc
let g:localvimrc_ask = 0

" ignore some directories and files in ctrlp plugin
let g:ctrlp_custom_ignore = '\.git/*'

" open files in new hidden buffer in ctrlp plugin
let g:ctrlp_open_multiple_files = 'ijr'

" errormarker settings
let errormarker_errorgroup   = "ErrorMsg"
let errormarker_warninggroup = "Todo"

" errorformat for make and errormarker
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

" vim-flake8 max line length for PEP8
let g:flake8_max_line_length = 150

" smart home - if you press the home key it will jump to the first nonblank character
" on the line
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
