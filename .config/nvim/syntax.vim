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
hi Character ctermfg=green
" 119 LightGreen #87ff5f
hi String ctermfg=green
" 35 SpringGreen3 #00af5f
hi Number ctermfg=darkgreen
" 119 LightGreen #87ff5f
hi Float ctermfg=green
" 35 SpringGreen3 #00af5f
hi Boolean ctermfg=darkgreen

" 73 CadetBlue #5fafaf
hi Identifier ctermfg=73
" 73 CadetBlue #5fafaf
hi Function ctermfg=73

" YELLOW-ORANGE-GOLD
" 179 LightGoldenrod3 #d7af5f
hi Statement ctermfg=yellow
" 221 LightGoldenrod2 #ffd75f
hi Conditional ctermfg=221
" 136 DarkGoldenrod #af8700
hi Repeat ctermfg=yellow
" 137 LightSalmon3 #af875f
hi Label ctermfg=137
" 179 LightGoldenrod3 #d7af5f
hi Keyword ctermfg=yellow
" 228 Khaki1 #ffff87
hi Exception ctermfg=228

" ORANGE
" 202 OrangeRed1 #ff5f00
hi PreProc ctermfg=202
" 202 OrangeRed1 #ff5f00
hi Include ctermfg=202
" 179 LightGoldenrod3 #d7af5f
hi Define ctermfg=yellow
" 221 LightGoldenrod2 #ffd75f
hi PreCondit ctermfg=221

" ORANGE-BROWN
" 202 OrangeRed1 #ff5f00
hi Type ctermfg=202
" 179 LightGoldenrod3 #d7af5f
hi Typedef ctermfg=yellow
" 179 LightGoldenrod3 #d7af5f
hi Structure ctermfg=yellow
" 202 OrangeRed1 #ff5f00
hi StorageClass ctermfg=202

filetype on

" At the end to overwrite prior syntax highlighting.
" Bracket highlighting in 228 Khaki1 #ffff87.
autocmd BufRead,BufNewFile * syn match parens /[(){}[]]/ | hi parens ctermfg=228
