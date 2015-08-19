" ---------------------------------------
" ---- The perfect vim configuration ----
" ---------------------------------------

" be iMproved
set nocompatible

" required for vundle - will be set correctly after vundle settings
filetype off

" Do you want to use the colorscheme solarized? Thus, set to 1 else to 0
let use_cs_solarized = 1

" -----------------
" ---- Plugins ----
" -----------------

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle - required!
Plugin 'gmarik/Vundle.vim'

" colorschemes
Plugin 'altercation/vim-colors-solarized'

" status line, CtrlP and menus
"Plugin 'bling/vim-bufferline'
Plugin 'timofurrer/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'localvimrc'

" complete and syntax
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'gg/python.vim'
Plugin 'timofurrer/xmledit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'errormarker.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ekalinin/Dockerfile.vim'

" external tool integration
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'tpope/vim-fugitive'
Plugin 'DoxygenToolkit.vim'
"Plugin 'realtimeprojects/vim-radish'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
" online compiler
Plugin 'rhysd/wandbox-vim'

" mappings to improve moving etc
Plugin 'Lokaltog/vim-easymotion'
Plugin 'triglav/vim-visual-increment'
Plugin 'kshenoy/vim-signature'
Plugin 'Align'
Plugin 'a.vim'
Plugin 'SyntaxAttr.vim'
"Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'aklt/plantuml-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bogado/file-line'

call vundle#end()

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

" disbale background color erase (BCE)
set t_ut=

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
"set clipboard=unnamed
" Note: in vim 7.3.74 and higher you can set clipboard=unnamedplus to alias
" unnamed register to the + register, which is the X Window clipboard.
set clipboard=unnamedplus

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
set wildmode=longest,list

" complete options
set completeopt=menuone,menu,longest,preview

" set tag locations
set tags=tags;/
set tags+=~/.vim/tags/stl_tags

" copy up to 1000 lines from one file to another
set viminfo='1000,\"2000,s2000,h

" Set spell language
set spelllang=en_us
"set spelllang=de

" wildignore
set wildignore+=*.o,*.lo,*.la,*.obj,.git,*.pyc,*.so,*/.git/*

" Don't show currect mode
set noshowmode

" status line settings
set laststatus=2 " Always show the statusline

" set number formats for Ctrl+A and Ctrl+X
set nrformats=alpha,octal,hex

" undo files
if version >= 703
  set undodir=~/.vim/undodir
  set undofile
endif

set number
set relativenumber

" ---------------------
" ---- Colorscheme ----
" ---------------------

if use_cs_solarized == 1
  let g:solarized_termtrans = 1

  " set termcolors to 256 instead of std 16
  let g:solarized_termcolors = 256

  " set bold, underline and italic enable
  let g:solarized_bold = 1
  let g:solarized_underline = 1
  let g:solarized_italic = 1

  let g:solarized_contrast="high"

  " set dark background
  set background=dark

  " use colorscheme solarized
  colorscheme solarized
endif

"colorscheme pojoaque


" ----------------------
" ---- Autocommands ----
" ----------------------

if has("autocmd")
  " set filetypes
  autocmd BufNewFile,BufRead *.gv set filetype=dot

  " open files at the last opened position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " delete fugitive buffer with git objects befor opening a new one
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " automatically open and close the popup menu / preview window
  autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

  " remove trailing whitespace on write
  autocmd BufWritePre * :%s/\s\+$//e

  " update taglist
  autocmd BufWritePost * :TlistUpdate

  " Delete .netrwhist ( netrw history file ) after leaving vim
  autocmd VimLeave * if filereadable(".netrwhist") | call delete(".netrwhist") | endif

  " --------
  "  mappings
  " --------

  " if FileType is c, cpp then execute make
  autocmd FileType c,cpp map  <F5> :w<CR>:make<CR>
  autocmd FileType c,cpp imap <F5> <ESC>:w<CR>:make<CR>

  " if FileType is python then start python
  autocmd FileType python map  <F5> :w<CR>:!python "%"<CR>
  autocmd FileType python imap <F5> <ESC>:w<CR>:!python "%"<CR>

  " if FileType is python then indent with 4 spaces instead of 2
  autocmd FileType python setl tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType html,javascript,html* setl tabstop=4 softtabstop=4 shiftwidth=4

  " if FileType is shell script then start shell script
  autocmd FileType sh map  <F5> :w<CR>:!$SHELL "%"<CR>
  autocmd FileType sh imap <F5> <ESC>:w<CR>:!$SHELL "%"<CR>

  " if FileType tex then enable spell checking by default
  autocmd FileType tex set spell

  "if use_syntastic_with_python != 1
    "autocmd FileType python :SyntasticToggleMode
  "endif

  autocmd FileType tex set cursorline

  " if FileType is plantuml,plant,uml,pu then execute make
  autocmd FileType plantuml,plant,uml,pu map <F5> :w<CR>:make<CR>
  let g:plantuml_executable_script='java -jar /usr/share/plantuml/plantuml.jar'
endif


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

" signatures
map  <S-F3>    :SignatureToggle<CR>
map  <leader>m :SignatureToggle<CR>
imap <S-F3>    <ESC>:SignatureToggle<CR>

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

" toggle paste mode
map  <C-F6>     :set paste!<CR>i
imap <C-F6>     <ESC>:set paste!<CR>i

" Syntastic error window
"map  <F7>       :call ToggleErrors()<CR>
"imap <F7>       <ESC>:call ToggleErrors()<CR>
map  <F7>       :Wandbox --compiler=gcc-head --options=warnings<CR>
imap <F7>       <ESC>::Wandbox --compiler=gcc-head --options=warnings<CR>

" Doxygen
"map  <S-F7>      :Dox<CR>
"imap <S-F7>      <ESC>:Dox<CR>
map  <S-F7>      :Wandbox --compiler=clang-head --options=warnings<CR>
imap <S-F7>      <ESC>::Wandbox --compiler=clang-head --options=warnings<CR>

" toggle numbering
map  <F8>        :set number! relativenumber!<CR>
imap <F8>        :set number! relativenumber!<CR>

" ctags
"map  <F8>      :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>
"imap <F8>      <ESC>:!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>

" taglist update
map  <S-F8>    :TlistUpdate<CR>
imap <S-F8>    <ESC>:TlistUpdate<CR>

" Spelling
map  <S-F9>      :set spell!<CR>
imap <S-F9>      <ESC>:set spell!<CR>

" Next error to F10
map  <F10>     :cn<CR>
imap <F10>     <ESC>:cn<CR>

" :Align =
map  <S-F10>   :Align =<CR>
imap <S-F10>   <ESC>:Align =<CR>

" shortcut to auto indent entire file
map  <F11>     1G=G''
imap <F11>     <ESC>1G=Ga''

" shortcut to replace word under cursor
nnoremap <leader>*   :%s/<c-r><c-w>/<c-r><c-w>/gc<Left><Left><Left>
vnoremap <leader>*   :s/<c-r><c-w>/<c-r><c-w>/gc<Left><Left><Left>

" window changing
map  <a-left>       :bp<CR>
imap <a-left>  <ESC>:bp<CR>
map  <a-right>      :bn<CR>
imap <a-right> <ESC>:bn<CR>

" remap code completion to Ctrl+Space
inoremap <Nul> <C-x><C-o>
"inoremap <C-@> <C-R>=SuperCleverTab()<CR>

" smart home function
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

" map highlighting group under cursor
map <C-S-H> :call <SID>SynStack()<CR>

" resource vimrc
"map <C-S-R> :source $MYVIMRC<cR>

map <C-]> :YcmCompleter GoToDeclaration<CR>
map <C-}> :YcmCompleter GoToDefinition<CR>

" fugitive mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>

" add git sign-off
map <leader>gS :call SignOff()<CR>


" -----------------------
" ---- Plugin config ----
" -----------------------

" taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
let Tlist_Close_On_Select = 1

" support local vim config in .lvimrc
let g:localvimrc_ask = 0

" ignore some directories and files in ctrlp plugin
let g:ctrlp_custom_ignore = '\.git/*'

" open files in new hidden buffer in ctrlp plugin
let g:ctrlp_open_multiple_files = 'ijr'
let g:ctrlp_open_new_file = 'ijr'

" bufferline
let g:bufferline_show_bufnr = 0

" errormarker settings
let errormarker_errorgroup = "ErrorMsg"
let errormarker_warninggroup = "Todo"

" errorformat for make and errormarker
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

" Jedi automatically starts the completion, if you type a dot, e.g. str., if
" you don't want this, set it to "0"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_config.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_semantic_triggers =  {
      \ 'cucumber': ['re!.'],
      \}
"let g:ycm_server_use_vim_stdout = 1

" syntastic config
let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" spell check in tex files
let g:tex_verbspell = 1

let g:bufferline_echo = 0

" UltiSnips Trigger configuration
let g:UltiSnipsExpandTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-y>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" -----------------------
" --- Useful functions --
" -----------------------

" smart home - if you press the home key it will jump to the first nonblank character
" on the line
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction

" What this function does is that if there is no completion that could happen
" it will insert a tab. Otherwise it checks to see if there is an
" omnifunction available and, if so, uses it. Otherwise it falls back to
" Dictionary completion if there is a dictionary defined.  Finally it resorts
" to simple known word completion.  In general, hitting the Tab key will just
" do the right thing for you in any given situation.
" (see: http://blogs.gnome.org/lharris/2008/07/20/code-completion-with-vim-7/)
function! SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  else
    if &omnifunc != ''
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      return "\<C-K>"
    else
      return "\<C-N>"
    endif
  endif
endfunction

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    Errors
  endif
endfunction

function! SignOff()
  call append(line('.'), 'Signed-off-by: Timo Furrer <timo.furrer@roche.com>')
endfunction
