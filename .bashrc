# x relative settings
bash ~/.xinitrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias yolo='sudo pacman -Syu'
alias ls='ls --color=auto'
alias godot='~/Dev/godot/bin/godot.x11.tools.64;'
alias lockit="/home/nitzanel/.config/i3/lock.sh --lock"
alias caps="xmodmap ~/.speedswapper;"
alias jsdoc="~/node_modules/jsdoc/jsdoc.js"
# oh boi
PS1='[\u@\h \W]\$ '
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
