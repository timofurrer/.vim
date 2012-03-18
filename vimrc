" Be iMproved
set nocompatible

" Required for vundle - will be set correctly at the end
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle - required!
Bundle 'gmarik/vundle'

" vim-fugitive
Bundle 'tpope/vim-fugitive'

" nerdcommenter
Bundle 'scrooloose/nerdcommenter'

" nerdtree
Bundle 'scrooloose/nerdtree'

" omnicppcomplete
Bundle 'vim-scripts/OmniCppComplete'

" taglist
Bundle 'vim-scripts/taglist.vim'

" xmledit
Bundle 'vim-scripts/xmledit'

" localvimrc
Bundle 'vim-scripts/localvimrc'

" DoxygenToolKit
Bundle 'DoxygenToolkit.vim'

" shebang
Bundle 'Shebang'

" ctrlp
Bundle 'kien/ctrlp.vim'

" Align
Bundle 'Align'

" A.vim - Alternate Files quickly (.c --> .h etc)
Bundle 'a.vim'

" enable 256 colors
set t_Co=256

" Map leader key to comma (,)
let mapleader = ","

" Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2

" Indenting
set autoindent
set smartindent

" Set c1ipboard to x-windows selection
set clipboard=unnamed

" Shortcut to auto indent entire file
nmap <F11> 1G=G''
imap <F11> <ESC>1G=Ga''

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Change window
nnoremap <leader>1 1
nnoremap <leader>2 2
nnoremap <leader>3 3
nnoremap <leader>4 4

" Set tag locations
set tags=tags;/
set tags+=~/.vim/stl_tags

" ctags
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>
imap <F8> <ESC>:!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>

" Doxygen
map <F7> :Dox<CR>
imap <F7> <ESC>:Dox<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'

" make
map <F5> :make<CR>
imap <F5> <ESC>:make<CR>

" nerdtree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

" shebang
map <F6> :call SetExecutable()<CR>

" A.vim
map <F2> :A<CR>

" Taglist
map <F4> :TlistToggle<CR><C-W><a-right>
imap <F4> <ESC>:TlistOpen<CR><C-W><a-right>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
let Tlist_Close_On_Select = 1

" Window changing
map <a-left> :bp<CR>
map <a-right> :bn<CR>
imap <a-left> <ESC>:bp<CR>
imap <a-right> <ESC>:bn<CR>

" OmniCompletion
let OmniCpp_NamespaceSearch   = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess        = 1
let OmniCpp_MayCompleteDot    = 1
let OmniCpp_MayCompleteArrow  = 1
let OmniCpp_MayCompleteScope  = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

highlight clear
highlight Pmenu         ctermfg=0 ctermbg=2
highlight PmenuSel      ctermfg=0 ctermbg=7
highlight PmenuSbar     ctermfg=7 ctermbg=0
highlight PmenuThumb    ctermfg=0 ctermbg=7

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"inoremap <Nul> <C-n>
inoremap <Nul> <C-x><C-o>

" Smart home
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

" remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" copy up to 500 lines from one file to another
set viminfo='100,<500,s10,h

map <F9> :set spell!<CR>
imap <F9> <ESC>:set spell!<CR>
set spelllang=de_ch

" support local vim config in .lvimrc
let g:localvimrc_ask=0 "dont ask

" Open files at the last opened position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" set statusline=%1*%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
" highlight User1 ctermfg=White ctermbg=LightGrey
hi! User1 ctermfg=LightGrey cterm=bold  ctermbg=52 guifg=Black guibg=#665555
hi! User2 ctermfg=DarkGreen cterm=bold  ctermbg=52 guifg=Green guibg=#443333
hi! User3 ctermfg=DarkCyan  cterm=bold  ctermbg=52 guifg=Cyan  guibg=#443333
hi! User4 ctermfg=DarkCyan  cterm=bold  ctermbg=52 guifg=Cyan  guibg=#443333

" Informative status line
set laststatus=2
set statusline=%4*---%1*\ %F%m%r%h%w\ %2*%{fugitive#statusline()}%1*\ %{&ff}\ %Y\ \[0x\%02.2B=\%03.3b]\ [%l,%v\ %p%%\ %Lb]\ %3*\[%F\]%1*

" Syntax highlighting
syntax on

" Get filetype automatically
filetype plugin indent on
