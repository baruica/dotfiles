[ -r ~/.composer/vendor/bin ] && export PATH=$PATH:~/.composer/vendor/bin

for file in ~/workspace/baruica/dotfiles/.{functions,aliases,bash_prompt,exports}; do
    [ -r "$file" ] && source "$file"
done

shopt -s cdspell        # Correct spelling errors in arguments supplied to cd
shopt -s checkwinsize   # Update window size after every command
shopt -s cmdhist        # Save multi-line commands as one command
shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

# If possible, add tab completion for many more commands
[ -r /etc/bash_completion ] && source /etc/bash_completion 2> /dev/null

complete -cf sudo       # Autocomple with sudo

cmd_exists symfony-autocomplete && eval "$(symfony-autocomplete --aliases=sf)"

if [ -d ~/.ssh ]; then
    cat ~/workspace/baruica/dotfiles/ssh_config > ~/.ssh/config

    if [ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ]; then
        for ssh_config_file in $(find ~/.ssh -name "config.*"); do
            cat "${ssh_config_file}" >> ~/.ssh/config
        done
    fi
fi

exec_if_cmd_exists composer self-update

# SSH + keychain (sudo apt-get install keychain)
for key in $(find ~/.ssh -name "*.key" -type f); do
    keychain $key &> /dev/null
done
[ -e ~/.keychain/${HOSTNAME}-sh ] && source ~/.keychain/${HOSTNAME}-sh
