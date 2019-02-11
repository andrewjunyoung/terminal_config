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

Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-editors/vim-elixir'
Plug 'ensime/ensime-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End plug-vim ""
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
  let &colorcolumn="80,".join(range(101,999),",")

" syntax highlighting, color scheme
  set syntax=rustyard
  syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End coloring ""
"" Begin char maps """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " swap word with next
    :nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
  " push word left
    :nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
  " push word right
    :nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
  " swap lines (Alt-j, Alt-k for up/down)
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==

  " jump by 10
    :noremap K 10k
    :noremap J 10j

  " end highlighting
    :noremap ty :let @/=""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" End char maps ""
"" Begin settings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    autocmd FileType * setlocal formatoptions-=cro
    hi CursorColumn ctermbg=235
    hi CursorLine term=bold cterm=NONE ctermbg=235
    let g:tex_conceal="" " For latex, enforce WYSINWYG.
    set autoindent
    set backspace=2
    set conceallevel=0 " WYSINWYG.
    set cursorcolumn
    set cursorline
    set expandtab
    set exrc " Allow arbitrary code to executed in init.vim.
    set hlsearch
    set incsearch
    set laststatus=2
    set number
    set relativenumber " Relative line numbers on the left of the page.
    set ruler
    set secure
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2 " Tabs := 2 spaces.
    set textwidth=79 " Display a line demarcating the n th character in a line.

"" Begin settings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Begin syntax highlighting """"""""""""""""""""""""""""""""""""""""""""""""""

  " TODO Move this to a new file
    " BLUE
    " pale_turquoise_1 #afffff
    hi Comment ctermfg=159

    " GREEN
    " dark olive green #87af5f
    hi Character ctermfg=107
    " dark olive green #87af5f
    hi String ctermfg=119
    " spring green 3
    hi Number ctermfg=35
    " green
    hi Boolean ctermfg=2
    " spring green 1
    hi Float ctermfg=48

    "
	  hi Identifier	ctermfg=white
    " #eeeeee
	  hi Function	ctermfg=255

    " YELLOW-ORANGE-GOLD
    " #d7af5f light goldenrod 3. Same as Keyword.
    hi Statement ctermfg=179
    " #af875f light salmon 3. Same as PreProc PreCondit.
    hi Conditional ctermfg=221
    " #af8700 dark goldenrod
    hi Repeat ctermfg=136
    " ##ffd700 gold1
    hi Label ctermfg=137
    " #d7af5f light goldenrod 3. Same as Statement.
    hi Keyword ctermfg=179
    "red3	#d70000
    hi Exception ctermfg=160

    " ORANGE
    " #d75f00 dark orange
    hi PreProc ctermfg=202
    hi Include ctermfg=202
    " #d75f00 dark orange. Same as Type Typedef.
    hi Define ctermfg=179
    " #af875f light salmon 3. Same as Statement Conditional and Structure.
    hi PreCondit ctermfg=221

    " ORANGE-BROWN
    " #d75f00 dark orange
    hi Type ctermfg=202
    " #d75f00 dark orange. Same as Structure and PreProc Define.
    hi Typedef ctermfg=179
    " #d75f00 dark orange. Same as Typedef and PreProc Define.
    hi Structure ctermfg=179
    " #d75f00 dark orange
    hi StorageClass	ctermfg=202

    " RED
    " red3
    hi Error ctermfg=124

    " 0 black #000000
    hi Todo ctermfg=0

    " Bracket highlighting
    autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=yellow

"""""""""""""""""""""""""""""""""""""""""""""""""""" End syntax highlighting ""
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

