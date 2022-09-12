if &compatible
  set nocompatible
end

filetype off " Turn off filetype detection.

" Indentline makes conceallevel > 2. So disable it for markdown files.
autocmd FileType markdown let g:indentLine_enabled=0

autocmd FileType * setlocal formatoptions-=cro
hi CursorColumn ctermbg=235
hi CursorLine term=bold cterm=NONE ctermbg=235 " Highlight current line
let g:tex_conceal="" " For latex, enforce WYSINWYG.
set autoindent
set backspace=2 " Make backspace work in vim.
set conceallevel=0 " WYSINWYG. Prevent neovim from hiding symbols.
set cursorcolumn " Highlight the current column.
set cursorline " Highlight the current line.
set expandtab " Make tab input spaces instead.
set exrc " Allow arbitrary code to executed in init.vim.
set hlsearch
set clipboard=unnamed " MacOS clipboard sharing.
set incsearch
set laststatus=2
set number " Precede each line with its line number.
set relativenumber " Relative line numbers on the left of the page.
set ruler
set secure
set shiftwidth=2
set softtabstop=2
set tabstop=2 " Tabs := 2 spaces.
set tags=./tags,tags;$HOME

" Set the textwidth to wrap, unless the file is one of the specified types.
set textwidth=80
autocmd BufNew,BufRead *.txt  set textwidth=0
autocmd BufNew,BufRead *.wiki set textwidth=0
autocmd BufNew,BufRead *.md   set textwidth=0

filetype on
