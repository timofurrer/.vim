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
