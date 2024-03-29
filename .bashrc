#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

alias ls='ls --color'
alias neofetch="sudo neofetch --ascii_distro nixos_old"
alias gitconfigs='git clone https://github.com/shammyshanks/configs'
alias gitemacs='git clone https://github.com/shammyshanks/emacs-current'
alias gitstump='git clone https://github.com/shammyshanks/stumpwm'
alias githerb='git clone https://github.com/shammyshanks/herbstluftwm'
alias gitpoly='git clone https://github.com/shammyshanks/polybar'
alias gitgruv='git clone https://github.com/shammyshanks/gruvbox'
alias gitkeys='git clone https://github.com/shammyshanks/sxhkd'

# for zsh PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
