" \fr: reverse the order of lines (vertical mirror)
nmap \fr :set lz<CR>o<Esc>mz'aO<Esc>ma:'a+1,'z-1g/^/m 'a<CR>'addma'zdd:set nolz<CR>

" \fR: mirror image the lines (horizontal mirror)
nmap \fR :set lz<CR>o<Esc>mzkO<Esc>maj:s/./&\r/g<CR>:'a+1,'z-1g/^/m 'a<CR>:'a+1,'z-1j!<CR>'add'zddk:set nolz<CR>

nmap \fR :Mirror<CR>
command! -bar -range Mirror <line1>,<line2>call setline('.', join(reverse(split(getline('.'), '\zs')), ''))

map \fr :Reverse<CR>
sunmap \fr
ounmap \fr
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1
