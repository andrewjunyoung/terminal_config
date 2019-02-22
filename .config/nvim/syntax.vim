if &compatible
  set nocompatible
end

filetype off

" 244 Grey50 #808080 
hi Comment ctermfg=244
" 124 Red3 #af0000
hi Error ctermfg=124
" 0 black #000000
hi Todo ctermfg=0
" Bracket highlighting in 228 Khaki1 #ffff87
autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=228

" GREEN
" 107 DarkOliveGreen3 #87af5f
hi Character ctermfg=107
" 119 LightGreen #87ff5f
hi String ctermfg=119
" 35 SpringGreen3 #00af5f
hi Number ctermfg=35
" 2 Green (SYSTEM) #008000
hi Boolean ctermfg=2
" 48 SpringGreen1 #00ff87
hi Float ctermfg=48

" 73 CadetBlue #5fafaf
hi Identifier ctermfg=73
" 73 CadetBlue #5fafaf
hi Function ctermfg=73

" YELLOW-ORANGE-GOLD
" 179 LightGoldenrod3 #d7af5f
hi Statement ctermfg=179
" 221 LightGoldenrod2 #ffd75f
hi Conditional ctermfg=221
" 136 DarkGoldenrod #af8700
hi Repeat ctermfg=136
" 137 LightSalmon3 #af875f
hi Label ctermfg=137
" 179 LightGoldenrod3 #d7af5f
hi Keyword ctermfg=179
" 228 Khaki1 #ffff87
hi Exception ctermfg=228

" ORANGE
" 202 OrangeRed1 #ff5f00
hi PreProc ctermfg=202
" 202 OrangeRed1 #ff5f00
hi Include ctermfg=202
" 179 LightGoldenrod3 #d7af5f
hi Define ctermfg=179
" 221 LightGoldenrod2 #ffd75f
hi PreCondit ctermfg=221

" ORANGE-BROWN
" 202 OrangeRed1 #ff5f00
hi Type ctermfg=202
" 179 LightGoldenrod3 #d7af5f
hi Typedef ctermfg=179
" 179 LightGoldenrod3 #d7af5f
hi Structure ctermfg=179
" 202 OrangeRed1 #ff5f00
hi StorageClass ctermfg=202

filetype on
