export PATH=$PATH:~/bin
export PATH=$PATH:~/.composer/vendor/bin

export TERM=linux

shopt -s histverify
shopt -s checkwinsize

. ~/dotfiles/.bash_colors
. ~/dotfiles/git-prompt.sh
. ~/dotfiles/marks.sh

if [ -f ~/.bash_ps1 ]; then . ~/.bash_ps1; fi
