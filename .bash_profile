[ -r ~/.composer/vendor/bin ] && export PATH=$PATH:~/.composer/vendor/bin
[ -r ~/git-radar ] && export PATH=$PATH:~/git-radar

for file in ~/dotfiles/.{aliases,bash_prompt,exports,functions}; do
    [ -r "$file" ] && . "$file"
done

shopt -s cdspell        # corrects typos (eg: cd /ect becomes cd /etc)
shopt -s checkwinsize   # resize ouput to fit window
shopt -s cmdhist        # combine multiline commands in history
shopt -s histappend     # merge session histories
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

# If possible, add tab completion for many more commands
# curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -r /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion 2> /dev/null
fi

complete -cf sudo       # Autocomple with sudo

eval "$(symfony-autocomplete --aliases=sf)"

[ -r ~/.bash_profile_local ] && . ~/.bash_profile_local

[ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ] && cat ~/dotfiles/ssh_config ~/.ssh/config.* > ~/.ssh/config

command -v composer >/dev/null 2>&1 && composer self-update && composer global update
