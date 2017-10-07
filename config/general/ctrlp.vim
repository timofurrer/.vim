" General CtrlP configuration {{{
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](.git|tmp|node_modules)',
  \ 'file': '\v\.(blg|bbl|aux|bcf|pdf|out|toc|log|run\.xml)$',
  \ }

let g:ctrlp_open_multiple_files = 'ijr'
let g:ctrlp_open_new_file = 'ijr'
" }}}

" CtrlP Key Bindings {{{
map  <F2>      :CtrlPBuffer<CR>
map  <leader>b :CtrlPBuffer<CR>
imap <F2>      <ESC>:CtrlPBuffer<CR>
" }}}
