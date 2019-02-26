if &compatible
  set nocompatible
end

filetype off

autocmd FileType * setlocal formatoptions-=cro
hi CursorColumn ctermbg=235
hi CursorLine term=bold cterm=NONE ctermbg=235 " Highlight current line
"let g:tex_conceal="" " For latex, enforce WYSINWYG.
set autoindent
set backspace=2
"set conceallevel=0 " WYSINWYG.
set cursorcolumn
set cursorline
set expandtab
set exrc " Allow arbitrary code to executed in init.vim.
set hlsearch
set clipboard=unnamed " MacOS clipboard sharing.
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

filetype on
