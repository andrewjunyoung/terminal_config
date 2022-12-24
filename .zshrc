# Path to your oh-my-zsh installation.
export ZSH=/Users/ajy/.oh-my-zsh

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# How often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions  #zsh-users/zsh-autosuggestions/
  zsh-syntax-highlighting  #zsh-users/zsh-users/zsh-syntax-highlighting
  history-substring-search
  git-prompt
  jira
  colored-man-pages
  autojump
)

source $ZSH/oh-my-zsh.sh

################################################################################

# Hist lines
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory beep extendedglob nomatch
bindkey -v

# Theme. See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="powerlevel9k/powerlevel9k"
LSCOLORS="gxfxcxdxbxegedabagacad"

autoload -Uz compinit
compinit

# Aliases

function up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}

function screenie() {
  screencapture -o -l $(osascript -e 'tell app "iTerm" to id of window 1') $2
}

alias "c"="clear"
alias "d"="du -hd 3 | sort -rh | awk '{print NR "\t" $0}'"
alias "g"="git"
alias "l"="ls -ApG --color=auto" # With dotfiles
alias "la"="ls -pG --color=auto" # Without dotfiles
alias "lock"="source \$scripts/lock"
alias "n"="nvim"
alias "o"="open"
alias "pip"="pip3"
alias "python"="python3"
alias "rds"="rm .DS_Store"
alias "refresh"="clear; list"
alias "restart"="exec zsh"
# An alternative to «tree» if your shell doesn't have it set up.
alias "show"="ls -ApR | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
# Useful with latex compilation.
alias "pdf"="o *.pdf"

# Git aliases

alias "gst"="git status"
alias "gp"="git push"
alias "gsm"="git submodule"
alias "ga"="git add"
alias "gl"="git pull"
alias "gc"="git commit"
alias "gd"="git diff"
alias "gco"="git checkout"
alias "gpsu"="git rev-parse --abbrev-ref HEAD | xargs git push --set-upstream origin"

# Exports

music=~/Music/Music
dl=~/Downloads
docs=~/Documents

# github
github=$docs/github
# dynamic
dynamic=$docs/dynamic
scripts=$dynamic/scripts
rand=$code/scripts/rand
lock=$code/scripts/lock
# archive
archive=$docs/archive
pics=$archive/pics
aia=$pics/art/AI
# static
static=$docs/static
me=$docs/local/me
todo=$me/org/todo.md
work=$me/work
# projects
github=$docs/github
projects=$work/projects
code=$projects/code
writing=$work/writing

# Vim config file locations.
vim=~/.config/nvim/init.vim
mappings=~/.config/nvim/mappings.vim
syntax=~/.config/nvim/syntax.vim
settings=~/.config/nvim/settings.vim

# Zsh config file locations.
zsh=~/.zshrc

# Functions

# TODO: I have no idea what this does.
function cl {
  cd "$@" && l;
}

# Prompt

RPROMPT='' # Don't show anything to the right of the prompt.
PROMPT='[ %F{202}%m%f.%F{35}%n%f | %D %* | %F{159}%B%U%3c%u%b%f]
> '

# No idea what this does.
TRAPALRM() {
    zle reset-prompt
}

# Colors

# Set clicolor if you want ansi colors in iterm
export CLICOLOR=1
# set colors for iterm2
export TERM=xterm-256color
# stderr
exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ajy/.sdkman"
[[ -s "/Users/ajy/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ajy/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Autojump

[[ -s /Users/ajy/.autojump/etc/profile.d/autojump.sh ]] && source /Users/ajy/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Set up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
