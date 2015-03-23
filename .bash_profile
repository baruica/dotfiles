export PATH=$PATH:~/.composer/vendor/bin

for file in ~/dotfiles/.{aliases,bash_prompt,exports,functions}; do
    [ -r "$file" ] && source "$file"
done

shopt -s cdspell        # corrects typos (eg: cd /ect becomes cd /etc)
shopt -s checkwinsize   # resize ouput to fit window
shopt -s cmdhist        # combine multiline commands in history
shopt -s histappend     # merge session histories
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

[ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ] && cat ~/dotfiles/ssh/config ~/.ssh/config.* > ~/.ssh/config

# If possible, add tab completion for many more commands
# curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
[ -f /etc/bash_completion ] && source /etc/bash_completion

# https://github.com/KnpLabs/symfony2-autocomplete
[ -e ~/dotfiles/symfony2-autocomplete.bash ] && source ~/dotfiles/symfony2-autocomplete.bash

[ -x ~/bin/z/z.sh ] && source ~/bin/z/z.sh

command -v composer >/dev/null 2>&1 && composer self-update
command -v composer >/dev/null 2>&1 && composer global update
command -v mailcatcher >/dev/null 2>&1 && mailcatcher
