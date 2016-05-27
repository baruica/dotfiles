[ -r ~/.composer/vendor/bin ] && export PATH=$PATH:~/.composer/vendor/bin

for file in ~/workspace/baruica/dotfiles/.{aliases,bash_prompt,exports,functions}; do
    [ -r "$file" ] && source "$file"
done

shopt -s cdspell        # corrects typos (eg: cd /ect becomes cd /etc)
shopt -s checkwinsize   # resize ouput to fit window
shopt -s cmdhist        # combine multiline commands in history
shopt -s histappend     # merge session histories
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

# If possible, add tab completion for many more commands
[ -r /etc/bash_completion ] && source /etc/bash_completion 2> /dev/null

complete -cf sudo       # Autocomple with sudo

bind "set show-all-if-ambiguous on"

hash symfony-autocomplete >/dev/null 2>&1 && eval "$(symfony-autocomplete --aliases=sf)"

[ -d ~/.ssh ] && [ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ] && cat ~/workspace/baruica/dotfiles/ssh_config ~/.ssh/config.* > ~/.ssh/config

hash composer >/dev/null 2>&1 && composer self-update && composer global update
hash symfony >/dev/null 2>&1 && symfony self-update
hash melody >/dev/null 2>&1 && melody self-update
