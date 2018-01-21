" Vim syntax support file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Sep 12

" This file sets up the default methods for highlighting.
" It is loaded from "synload.vim" and from Vim for ":syntax reset".
" Also used from init_highlight().

if !exists("syntax_cmd") || syntax_cmd == "on"
  " ":syntax on" works like in Vim 5.7: set colors but keep links
  command -nargs=* SynColor hi <args>
  command -nargs=* SynLink hi link <args>
else
  if syntax_cmd == "enable"
    " ":syntax enable" keeps any existing colors
    command -nargs=* SynColor hi def <args>
    command -nargs=* SynLink hi def link <args>
  elseif syntax_cmd == "reset"
    " ":syntax reset" resets all colors to the default
    command -nargs=* SynColor hi <args>
    command -nargs=* SynLink hi! link <args>
  else
    " User defined syncolor file has already set the colors.
    finish
  endif
endif

" Many terminals can only use six different colors (plus black and white).
" Therefore the number of colors used is kept low. It doesn't look nice with
" too many colors anyway.
" Careful with "cterm=bold", it changes the color to bright for some terminals.
" There are two sets of defaults: for a dark and a light background.
if &background == "dark"
  SynColor Comment	term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE

  SynColor Special	term=bold cterm=NONE ctermfg=Green ctermbg=NONE gui=NONE guifg=Orange guibg=NONE
  SynColor Stat	    term=bold cterm=NONE ctermfg=Green ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE

  SynColor Fn	    term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=bg guibg=NONE
  SynColor PreProc	term=underline cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=#ff80ff guibg=NONE

  SynColor Type		term=underline cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE
  SynColor PrimType term=underline cterm=NONE ctermfg=Green ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
  SynColor HLType	term=underline cterm=NONE ctermfg=Green ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE

  SynColor Underlin	term=underline cterm=underline ctermfg=LightCyan gui=underline guifg=#80a0ff

  SynColor Ignore	term=NONE cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=bg guibg=NONE

else

  SynColor Comment	term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=Blue guibg=NONE
  SynColor Special	term=bold cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=SlateBlue guibg=NONE
  SynColor Ident	term=underline cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=DarkCyan guibg=NONE
  SynColor Stat	    term=bold cterm=NONE ctermfg=Brown ctermbg=NONE gui=bold guifg=Brown guibg=NONE
  SynColor PreProc	term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=Purple guibg=NONE
  SynColor Type		term=underline cterm=NONE ctermfg=DarkGreen ctermbg=NONE gui=bold guifg=SeaGreen guibg=NONE

  SynColor Underlin	term=underline cterm=underline ctermfg=DarkMagenta gui=underline guifg=SlateBlue

  SynColor Ignore	term=NONE cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=bg guibg=NONE

endif

SynColor Error		term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
SynColor Todo		term=standout cterm=underline ctermfg=Cyan ctermbg=NONE gui=NONE guifg=Blue guibg=Yellow

" TODO
" Common groups that link to default highlighting.
" You can specify other highlighting easily.
SynLink StorageClass	Type
SynLink Structure	    Type
SynLink Typedef		    Type
SynLink Boolean		    PrimType
SynLink Character	    PrimType
SynLink Number		    PrimType
SynLink Float		    HLType
SynLink String		    HLType

SynLink Conditional	    Stat
SynLink Exception	    Stat
SynLink Keyword		    Stat
SynLink Label		    Stat
SynLink Repeat		    Stat
SynLink Function	    Fn
SynLink Operator	    Fn
SynLink Include		    PreProc
SynLink Define		    PreProc
SynLink Macro		    PreProc " Includes \"#define\" in C
SynLink PreCondit	    PreProc
SynLink Debug		    Special
SynLink Delimiter	    Special
SynLink SpecialChar	    Special
SynLink SpecialComment	Special
SynLink Tag		        Special

delcommand SynColor
delcommand SynLink
