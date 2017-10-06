let g:goyo_width = '50%'
let g:goyo_height = '85%'

" Goyo Key Bindings {{{
    map  <F10> :Goyo<CR> :Limelight!!<CR>
    imap <F10> <ESC>:Goyo :LimeLight!!<CR>
    map  <S-F10> :Goyo 50%x85%<CR>
    imap <S-F10> <ESC>:Goyo 50%x85%<CR>
" }}}


" Goyo ensure quit event when Goyo is active {{{
    function! s:goyo_enter()
      let b:quitting = 0
      let b:quitting_bang = 0
      autocmd QuitPre <buffer> let b:quitting = 1
      cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    endfunction

    function! s:goyo_leave()
      " Quit Vim if this is the only remaining buffer
      if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
          qa!
        else
          qa
        endif
      endif
    endfunction

    autocmd! User GoyoEnter call <SID>goyo_enter()
    autocmd! User GoyoLeave call <SID>goyo_leave()
" }}}
