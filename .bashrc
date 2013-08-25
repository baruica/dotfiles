shopt -s histverify
shopt -s checkwinsize

. ~/dotfiles/.aliases
. ~/dotfiles/.git-completion.bash
. ~/dotfiles/marks.sh

if [[ $SSH_CLIENT == '' ]]; then
    PS1GLOBALCOLOR="\[\033[0;36m\]"
else
    PS1GLOBALCOLOR="\[\033[0;32m\]"
fi
if [[ $SUDO_USER != '' ]]; then
    PS1USERCOLOR="\[\033[0;31m\]"
    PS1="\[\033]0;\u@\h:\w\007\]$PS1USERCOLOR\u$PS1GLOBALCOLOR@\h:\w\n$PS1GLOBALCOLOR\#>\[\033[0m\] "
else
    PS1USERCOLOR=$PS1GLOBALCOLOR
    PS1="\w\n$PS1GLOBALCOLOR\$(__git_ps1 \"(%s)\")>\[\033[0m\] "
fi

if [ -n "$PS1" -a -f ~/.bash_ps1 ]; then
    . ~/.bash_ps1
fi
