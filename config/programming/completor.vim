" Use TAB to select suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" jedi has to be installed so that python3 can find it.
let g:completor_python_binary = 'python3'

" path to racer installation
let g:completer_racer_binary = '$HOME/.cargo/bin/racer'
