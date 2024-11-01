" +----------------------------------------------------------+
" | .vimrc                                                   |
" +----------------------------------------------------------+
" | author : andrewjunyoung (andrewjunyoung1@gmail.com)      |
" | code   : http://github.com/andrewjunyoung/terminalConfig |
" +----------------------------------------------------------+

let mapleader = ","

"" Begin plug-vim """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Install plug-vim if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" {

Plug 'airblade/vim-gitgutter' " Show git line changes on the left.
Plug 'cespare/vim-toml' " Syntax highlighting for .toml files
Plug 'cskeeters/vim-calutil' " Visual increment with calendar
Plug 'dhruvasagar/vim-table-mode' " Fast commands for table editing.
Plug 'morhetz/gruvbox' " Color theme.
Plug 'mzlogin/vim-markdown-toc' " Auto generates tables of contents in markdown.
Plug 'scrooloose/nerdtree' " Directory navigation in vim.
Plug 'tpope/vim-fugitive' " Git functions in vim.
Plug 'tpope/vim-surround' " Functions to surround text.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/VisIncr' " Visual increment
" Programming
Plug 'ntpeters/vim-better-whitespace' " Tools to clean whitespace.
Plug 'tpope/vim-commentary' " Better commenting
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale' " Async linter
" JS / TS
Plug 'prettier/vim-prettier' " ES style linting
" Terraform (TF)
Plug 'hashivim/vim-terraform' " Terraform highlighting
" Kotlin
Plug 'udalov/kotlin-vim' " Vim syntax highlighting.

" }
call plug#end()

" Possible future plugins to add:
" None yet!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End plug-vim ""
"" Python auto snippets """"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Trigger configuration. Do not use <tab> if you use Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End auto snippets ##
"" Begin vim-airline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End vim-airline ""
"" Begin nerdtree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command Tree NERDTree

"" indentLine
  let g:indentLine_char = '│'
  let g:indentLine_color_term = 244 " 10

"" nerdtree
  " close vim if the only window left open is a nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Open nerdtree automatically when vim starts
  autocmd vimenter * NERDTree
  " Jump to the main window.
  autocmd VimEnter * wincmd p
  " So vsplit makes two 80 char windows.
  :let g:NERDTreeWinSize=27

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End NERDTree ""
"" Begin coloring """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mark line 81 in grey 235.
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn=join(range(81,81),",")

" syntax highlighting on.
  syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End coloring ""
"" Begin misc """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab to complete words.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Auto compile latex on changes
autocmd BufReadPre,BufNewFile *.texexecute 'silent !evince %:r.pdf > /dev/null &'
autocmd BufReadPre,BufNewFile *.tex set spell
autocmd BufWritePost *.tex execute 'silent !xelatex % > %:r.texoutput &'


autocmd BufReadPre,BufNewFile *.texexecute 'silent !evince %:r.pdf > /dev/null &'
autocmd BufWritePost *.tex execute 'silent !xelatex % > %:r.texoutput &'


" mouse doesn't copy line numbers
:se mouse+=a

" Change the appearance of the cursor depending on the input mode.
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Git gutter
hi GitGutterAdd    ctermfg=2
hi GitGutterChange ctermfg=3
hi GitGutterDelete ctermfg=1
hi clear SignColumn

"" Begin gruvbox """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use gruvbox as your color scheme
colorscheme gruvbox

let g:gruvbox_italic = '1'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_contrast_dark = 'hard' " Must be one of {soft, medium, hard}.
let g:gruvbox_contrast_light = 'hard' " Must be one of {soft, medium, hard}.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End gruvbox ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End misc ""
"" Begin imports """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.config/nvim/mappings.vim"))
  source ~/.config/nvim/mappings.vim
endif

if filereadable(expand("~/.config/nvim/settings.vim"))
  source ~/.config/nvim/settings.vim
endif

if filereadable(expand("~/.config/nvim/syntax.vim"))
  source ~/.config/nvim/syntax.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End imports ""

