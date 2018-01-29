"           ██
"          ░░
"  ██  ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ░██ ░██ ░██░░██   ░░█████
"  ░░  ░░ ░░░  ░░  ░░ ░░░   ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ andrewjunyoung <andrewjunyoung@gmail.com>
" ░▓ code   ▓ http://github.com/andrewjunyoung/terminalConfig
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░

" vundle
  set nocompatible        " be improved, required
  filetype off          " required

  filetype plugin indent on


  " Change cursor shape
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" airline

  let g:airline_theme='angr'
  let g:airline#extensions#tabline#enabled = 1

" automatic comment insertion (disabled)
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" indentLine
   let g:indentLine_color_term = 10

" nerdtree
   " close vim if the only window left open is a nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" pathogen
  execute pathogen#infect()

" powerline
  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

  if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
    endif
  endif

" recolor background past right margin
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn=join(range(81,999),",")
  let &colorcolumn="80,".join(range(120,999),",")

" syntax highlighting, color scheme
  :set syntax=rustyard
  syntax on

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

" 'set'-commands (listed alphabetically)
  " B
    set backspace=2

  " C
    set cursorline
    hi CursorLine term=bold cterm=NONE ctermbg=235

    set cursorcolumn
    hi CursorColumn ctermbg=235

  " E
    set expandtab
    set exrc

  " H
    set hlsearch

  " I
    set incsearch

  " L
    set laststatus=2

  " N
    set number

  " R
    set ruler
    set relativenumber

  " S
    set secure
    set shiftwidth=2
    set softtabstop=2

  " T
    set tabstop=2

" syntax highlighting
  " TODO Move this to a new file
    " #afffff (pale_turquoise_1)
    hi Comment ctermfg=159
    " #87af5f (Dark olive green)
    hi String ctermfg=107
    " #87af5f (Dark olive green)
    hi Character ctermfg=107

    " Green
    hi Number ctermfg=48
    "
    hi Boolean ctermfg=Cyan
    "
    hi Float ctermfg=48
    "

	  hi Identifier	ctermfg=white
	  hi Function	ctermfg=white

    " ##ffd700 gold1
    hi Statement ctermfg=179
    " ##ffd700 gold1
    hi Conditional ctermfg=202
    " ##ffd700 gold1
    hi Repeat ctermfg=179
    " ##ffd700 gold1
    hi Label ctermfg=179
    "hi Operator	"sizeof", "+", "*", etc.
    "hi Keyword	any other keyword
    "hi Exception	try, catch, throw

    hi PreProc ctermfg=166
    "Include	preprocessor #include
    "Define		preprocessor #define
    "Macro		same as Define
    "PreCondit	preprocessor #if, #else, #endif, etc.

"	*Type		int, long, char, etc.
"	 StorageClass	static, register, volatile, etc.
"	 Structure	struct, union, enum, etc.
"	 Typedef	A typedef

"	*Special	any special symbol
"	 SpecialChar	special character in a constant
"	 Tag		you can use CTRL-] on this
"	 Delimiter	character that needs attention
"	 SpecialComment	special things inside a comment
"	 Debug		debugging statements

    "Underlined	text that stands out, HTML links

"	*Ignore		left blank, hidden  |hl-Ignore|

"	*Error		any erroneous construct

    " #afffff (pale_turquoise_1)
    hi Todo ctermfg=159

  " Bracket highlighting
  autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=yellow

" tab to complete words
  function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
    else
      return "\<Tab>"
    endif
  endfunction
  :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
  :set dictionary="/usr/dict/words"
