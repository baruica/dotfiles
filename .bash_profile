[ -r ~/.composer/vendor/bin ] && export PATH=$PATH:~/.composer/vendor/bin

for file in ~/dotfiles/.{aliases,bash_profile_local,bash_prompt,exports,functions}; do
    [ -r "$file" ] && source "$file"
done

shopt -s cdspell        # corrects typos (eg: cd /ect becomes cd /etc)
shopt -s checkwinsize   # resize ouput to fit window
shopt -s cmdhist        # combine multiline commands in history
shopt -s histappend     # merge session histories
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

[ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ] && cat ~/dotfiles/ssh_config ~/.ssh/config.* > ~/.ssh/config

# If possible, add tab completion for many more commands
# curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion 2> /dev/null
fi

# Autocomple with sudo
complete -cf sudo

# https://github.com/KnpLabs/symfony2-autocomplete
[ -e ~/dotfiles/symfony2-autocomplete.bash ] && source ~/dotfiles/symfony2-autocomplete.bash

[ -x ~/bin/z/z.sh ] && source ~/bin/z/z.sh

command -v composer >/dev/null 2>&1 && composer self-update && composer global update
