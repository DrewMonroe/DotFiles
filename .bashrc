# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Exports
# Use vim for editing things
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export SUDO_EDITOR="/usr/bin/vim"
export TERM=screen-256color

# User specific aliases
# Allow me to open multiple files at once in an inuitive way
alias vim="vim -p"
# Make sure that ls will display colors of files and such
alias ls='ls --color=auto'
# Not all systems have ll
alias ll="ls -alh"
# I do this more often than I like
alias pyton="python"
# sudo !!
alias fuck='sudo $(fc -ln -1)'
alias yolo='sudo'
# multiple ls aliases because I mistype these far too often
alias sl='ls'
alias s='ls'
alias l='ls'
# to make editing of these dot files easier
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
# Make life slightly easier when leaving
alias e='exit'
# The way it should be
alias emacs='vim'
# Clear alias since tmux uses ctrl+l
alias c='clear'

# Make a nice prompt
force_color_prompt=yes
export PS1="\[\033[38;5;27m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]@\h\[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;2m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
# Set the promptcommand to be nothing, as it casuses PS1 to be printed twice on some systems
export PROMPT_COMMAND=""
# Have GPG key password prompts be on the commandline
export GPG_TTY=$(tty)

source virtualenvwrapper.sh
