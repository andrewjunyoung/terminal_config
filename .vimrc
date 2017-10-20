" vundle
    set nocompatible              " be improved, required
    filetype off                  " required
    
    filetype plugin indent on
    
    " Change cursor shape
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" automatic comment insertion (disabled)
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
    
    syntax on

" recolor background past right margin
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    let &colorcolumn=join(range(81,999),",")
    let &colorcolumn="80,".join(range(120,999),",")
    
" noremaps

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




" 'set'-commands (listed alphabetically)
    " B
        set backspace=2
    
    " C
        set cursorline
        hi CursorLine term=bold cterm=bold ctermbg=235

        set cursorcolumn
        hi CursorColumn ctermbg=235
    
    " E
        set expandtab
        set exrc
    
    " H
        set hlsearch
    
    " I
        set incsearch
    
    " N
        set number
    
    " R
        set ruler
        " set relativenumber
    
    " S
        set secure
        set shiftwidth=4
        set softtabstop=4
    
    " T
        set tabstop=4

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
