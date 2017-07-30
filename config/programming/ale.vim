" General ale configuration {{{
" Show warnings and errors in airline
let g:airline#extensions#ale#enabled = 1

" Use the following format to display errors
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" }}}
