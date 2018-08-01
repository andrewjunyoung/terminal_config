"           ██
"          ░░
" ░██     ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ░██ ░██ ░██░░██   ░░█████
"  ░░  ░░ ░░░  ░░  ░░ ░░░   ░░░░░
"
" ▓▓▓▓▓▓▓▓▓▓
" ▓ author: andrewjunyoung <andrewjunyoung@gmail.com>
" ▓ code: http://github.com/andrewjunyoung/terminalConfig
" ▓▓▓▓▓▓▓▓▓▓

"""" vundle """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  call vundle#begin('~/.vim/bundle/vundle_list.vim')

  " All Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

"""" change cursor shape """"""""""""""""""""""""""""""""""""""""""""""""""""""

  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"""" airline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:airline_theme='angr'
  let g:airline#extensions#tabline#enabled = 1

"""" NERDTree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  command Tree NERDTree

" indentLine
   let g:indentLine_color_term = 10

" nerdtree
   " close vim if the only window left open is a nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""" NERDTree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Todo: Is this still used?
  execute pathogen#infect()

"""" Powerline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

  if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
    endif
  endif

"""" recolor background past right margin """""""""""""""""""""""""""""""""""""

  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn=join(range(81,999),",")
  let &colorcolumn="80,".join(range(101,999),",")

" syntax highlighting, color scheme
  set syntax=rustyard
  syntax on

"""" latex auto compile """""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufReadPre,BufNewFile *.texexecute 'silent !evince %:r.pdf > /dev/null &'
autocmd BufReadPre,BufNewFile *.tex set spell
autocmd BufWritePost *.tex execute 'silent !xelatex % > %:r.texoutput &'

" mouse properties
  " mouse doesn't copy line numbers
  :se mouse+=a

" char maps

  " swap char with next
    :nnoremap <silent> gc xph
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

"""" settings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " A
    "
    set autoindent

  " B
    "
    set backspace=2

  " C
    " Display the line the cursor is on in a different format.
    set cursorline
    hi CursorLine term=bold cterm=NONE ctermbg=235

    " What you see is not what you get
    set conceallevel=0
    " For latex, enforce what you see is not what you get.
    let g:tex_conceal=""

    " Display the column the cursor is on in a different format.
    set cursorcolumn
    hi CursorColumn ctermbg=235

  " E
    " Use spaces instead of tabs.
    set expandtab
    "
    set exrc

  " F
    " Disable auto commenting for all files and sessions.
    autocmd FileType * setlocal formatoptions-=cro

  " H
    " Highlights all search results from a query.
    set hlsearch

  " I
    set incsearch

  " L
    set laststatus=2

  " N
    " Display column numbers in the left margin.
    set number

  " R
    set ruler
    " Use a relative numbering sstem for showing column numbers.
    set relativenumber

  " S
    set secure
    set shiftwidth=2
    set softtabstop=2

  " T
    set tabstop=2
    " Display a line demarcating the n th character in a line.
    set textwidth=79

"""" syntax highlighting """"""""""""""""""""""""""""""""""""""""""""""""""""""
  " TODO Move this to a new file
    " pale_turquoise_1 #afffff
    hi Comment ctermfg=159

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

    " 130
    hi Statement ctermfg=179
    " ##ffd700 gold1
    hi Conditional ctermfg=179
    " ##ffd700 gold1
    hi Repeat ctermfg=202
    " ##ffd700 gold1
    hi Label ctermfg=179
    "hi Operator "sizeof", "+", "*", etc.
    "hi Keyword any other keyword
    "red3	#d70000
    hi Exception ctermfg=160

    hi PreProc ctermfg=166
    "Include	preprocessor #include
    "Define		preprocessor #define
    "PreCondit	preprocessor #if, #else, #endif, etc.

    hi Type ctermfg=166
    "StorageClass	static, register, volatile, etc.
    "Structure	struct, union, enum, etc.
    "Typedef	A typedef

    "*Special	any special symbol
    " SpecialChar	special character in a constant
    " Tag		you can use CTRL-] on this

    hi Error ctermfg=124

    " 0 black #000000
    hi Todo ctermfg=0

    " Bracket highlighting
    autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=yellow

"""" Tab to complete words """"""""""""""""""""""""""""""""""""""""""""""""""""

  function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
    else
      return "\<Tab>"
    endif
  endfunction
  :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
  :set dictionary="/usr/dict/words"
