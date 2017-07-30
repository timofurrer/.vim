" General fugitive configuration {{{
" delete fugitive buffer with git objects befor opening a new one
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" Fugitive Key Bindings {{{
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>
" }}}
