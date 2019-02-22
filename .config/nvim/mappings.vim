" push word left
:nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
" push word right
:nnoremap <silent> gh "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
" swap lines (Alt-j, Alt-k for up/down)
:nnoremap gj :m .+1<CR>==
:nnoremap gk :m .-2<CR>==

" jump by 10
:noremap K 10k
:noremap J 10j

" end highlighting
:noremap ty :let @/=""

"" Begin typos """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! E e
command! W w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End typos ""
