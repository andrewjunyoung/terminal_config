if &compatible
  set nocompatible
end

filetype off

" 244 Grey50 #808080
hi Comment ctermfg=244

" 124 Red3 #af0000
hi Error ctermfg=red

" 0 black #000000
hi Todo ctermfg=0

" GREEN
" 35 SpringGreen3 #00af5f
hi Character ctermfg=106
" 119 LightGreen #87ff5f
hi String ctermfg=green
" 35 SpringGreen3 #00af5f
hi Number ctermfg=106
" 119 LightGreen #87ff5f
hi Float ctermfg=green
" 35 SpringGreen3 #00af5f
hi Boolean ctermfg=106

" 73 CadetBlue #5fafaf
hi Identifier ctermfg=blue
" 73 CadetBlue #5fafaf
hi Function ctermfg=blue

" YELLOW-ORANGE-GOLD
" 179 LightGoldenrod3 #d7af5f
hi Statement ctermfg=yellow
" 221 LightGoldenrod2 #ffd75f
hi Conditional ctermfg=172
" 136 DarkGoldenrod #af8700
hi Repeat ctermfg=172
" 137 LightSalmon3 #af875f
hi Label ctermfg=yellow
" 179 LightGoldenrod3 #d7af5f
hi Keyword ctermfg=yellow
" 228 Khaki1 #ffff87
hi Exception ctermfg=172

" ORANGE
" 202 OrangeRed1 #ff5f00
hi PreProc ctermfg=72
" 202 OrangeRed1 #ff5f00
hi Include ctermfg=72
" 179 LightGoldenrod3 #d7af5f
hi Define ctermfg=108
" 221 LightGoldenrod2 #ffd75f
hi PreCondit ctermfg=108

" ORANGE-BROWN
" 202 OrangeRed1 #ff5f00
hi Type ctermfg=208
" 179 LightGoldenrod3 #d7af5f
hi Structure ctermfg=208
" 179 LightGoldenrod3 #d7af5f
hi Typedef ctermfg=208
" 202 OrangeRed1 #ff5f00
hi StorageClass ctermfg=208

filetype on

" At the end to overwrite prior syntax highlighting.
" Bracket highlighting in 228 Khaki1 #ffff87.
autocmd BufRead,BufNewFile * syn match parens /[(){}[]]/ | hi parens ctermfg=228

"" Begin nerdtree syntax highlighting """"""""""""""""""""""""""""""""""""""""""

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" ¿Red for files without extensions?

" Magenta for executables (including code).
call NERDTreeHighlightFile('java', 'magenta', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'magenta', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('js', 'magenta', 'none', '#ffa500', '#151515')

" Yellow for data storage and markup files.
call NERDTreeHighlightFile('md', 'yellow', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'yellow', 'none', 'cyan', '#151515')

" Blue for files not in human readable format.
call NERDTreeHighlightFile('pdf', 'blue', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('png', 'blue', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jpg', 'blue', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jpeg', 'blue', 'none', '#ffa500', '#151515')


"""""""""""""""""""""""""""""""""""""""""""" End nerdtree syntax highlighting ""

