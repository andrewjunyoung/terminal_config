" +-------------------------------------------------------+
" | .vimrc                                                |
" +-------------------------------------------------------+
" | author: andrewjunyoung <andrewjunyoung@gmail.com>     |
" | code: http://github.com/andrewjunyoung/terminalConfig |
" +-------------------------------------------------------+

"" Begin plug-vim """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install plug-vim if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" {

"Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround' " Functions to surround text.
Plug 'ntpeters/vim-better-whitespace' " (1B) Choose between this and (1A)
Plug 'derekwyatt/vim-scala'
Plug 'elixir-editors/vim-elixir'
Plug 'ensime/ensime-vim'
Plug 'scrooloose/nerdcommenter' " Comment functions.
Plug 'scrooloose/nerdtree' " Nerd tree directory navigation.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mzlogin/vim-markdown-toc'
Plug 'SirVer/ultisnips' " Engine for python auto snippets.
Plug 'honza/vim-snippets' " Python auto snippets.

" }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End plug-vim ""
"" Python auto snippets """""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End auto snippets ##
"" Begin vim-airline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End vim-airline ""
"" Begin NERDTree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  command Tree NERDTree

"" indentLine
   let g:indentLine_color_term = 10

"" nerdtree
   " close vim if the only window left open is a nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End NERDTree ""
"" Begin coloring """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn=join(range(81,999),",")
  let &colorcolumn="81,".join(range(101,999),",")

" syntax highlighting, color scheme
  set syntax=rustyard
  syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End coloring ""
"" Begin misc """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tab to complete words
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


" Auto compile latex on changes
autocmd BufReadPre,BufNewFile *.texexecute 'silent !evince %:r.pdf > /dev/null &'
autocmd BufReadPre,BufNewFile *.tex set spell
autocmd BufWritePost *.tex execute 'silent !xelatex % > %:r.texoutput &'

" mouse doesn't copy line numbers
:se mouse+=a

" Change the appearance of the cursor depending on the input mode.
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End misc ""
"" Begin mappings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.config/nvim/mappings.vim"))
  source ~/.config/nvim/mappings.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End mappings ""
"" Begin settings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.config/nvim/mappings.vim"))
  source ~/.config/nvim/settings.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End settings ""
"" Begin syntax """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.config/nvim/mappings.vim"))
  source ~/.config/nvim/syntax.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End syntax ""
