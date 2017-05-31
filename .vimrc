"VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" POWERLINE
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

if has("gui_running")
           let s:uname = system("uname")
              if s:uname == "Darwin\n"
                            set guifont=Meslo\ LG\ S\ for\ Powerline
                               endif
                       endif

syntax on

" 'SET'-COMMANDS (LISTED ALPHABETICALLY)
" C
set cursorline

" E
set expandtab
set exrc

" H
set hlsearch

" I
set incsearch

" N
set number

" S
set softtabstop=4
set secure

" T
set tabstop=4
