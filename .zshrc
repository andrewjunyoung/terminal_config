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
alias "docs"="Documents"
alias "l"="ls"
alias "list"="ls -Ap"
alias "show"="ls -ApR | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias "whatsup"="cd ..; list"
alias "goto"="cd ~/Documents; cd"

##
# prompt
#

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '>'
}

PROMPT='[%B%h%b %D %* | %F{yellow}%m%f.%F{green}%n%f %B%U%2c%u%b]
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

# powerline-status
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
