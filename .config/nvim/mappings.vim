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

"" Begin shortcuts for table mode """"""""""""""""""""""""""""""""""""""""""""""

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"""""""""""""""""""""""""""""""""""""""""""""""" End shortcuts for table mode ""
"" Begin typos """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! E e
command! W w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End typos ""
