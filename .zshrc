# on startup
#   neofetch 
command neofetch

# hist lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
setopt appendhistory beep extendedglob nomatch
bindkey -v
# end of lines configured by zsh-newuser-install
# the following lines were added by compinstall

# theme
ZSH_THEME="powerlevel9k/powerlevel9k"

autoload -Uz compinit
compinit
# end of lines added by compinstall

##
# alias
##
alias "cl"="clear; l"
alias "l"="ls -Ap"
alias "list"="l"
alias "refresh"="clear; list"
alias "show"="ls -ApR | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias "up"="cd .."
alias "upl"="cd ..; l"

##
# export
##
docs=~/Documents
export docs
dl=~/Downloads
export dl
pics=~/Pictures
export pics
code=~/Documents/biancheng
export code

##
# prompt
#

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '>'
}

PROMPT='[%B%h%b | %D %* | %F{yellow}%m%f.%F{green}%n%f | %B%U%2c%u%b]
> '
TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

# RPROMPT='[%D %*]'

##
# colors
##
# Set clicolor if you want ansi colors in iterm
export CLICOLOR=1
# set colors for iterm2
export TERM=xterm-256color
# ls colors
LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
# stderr
exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )


##
# setopt and unsetopt configs
##
#

# path to your oh-my-zsh configuration.
    ZSH=$HOME/.oh-my-zsh

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
# enable highlighters
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Override highlighter colors
# ZSH_HIGHLIGHT_STYLES[default]=none
# ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
# ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
# ZSH_HIGHLIGHT_STYLES[commandseparator]=none
# ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
# ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
# ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
# ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
# ZSH_HIGHLIGHT_STYLES[assign]=none

# powerline-status
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# source /Users/admin/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-syntax-highlighting
source ./.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
