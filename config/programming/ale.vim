" General ale configuration {{{
" Show warnings and errors in airline
let g:airline#extensions#ale#enabled = 1

" Use the following format to display errors
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" lint always
let g:ale_lint_on_text_changed = "always"
let g:ale_lint_on_insert_leave = 1
" }}}

" Ale Key Bindings {{{
    map  <F8> :ALENext<CR>
    imap <F8> <ESC>:ALENext<CR>
    map  <S-F8> :ALEPrevious<CR>
    imap <S-F8> <ESC>:ALEPrevious<CR>
    map  <C-F8> :ALEDetail<CR>
    imap <C-F8> <ESC>:ALEDetail<CR>
" }}}
