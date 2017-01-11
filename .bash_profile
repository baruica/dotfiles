#!/usr/bin/env bash

for file in ~/workspace/baruica/dotfiles/.{functions,aliases,bash_prompt,exports}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file

shopt -s cdspell        # Autocorrect typos in path names when using `cd`
shopt -s cmdhist        # Save multi-line commands as one command
shopt -s histappend     # Append to the history file, don't overwrite it
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

complete -cf sudo       # Autocomple with sudo

if [[ -d "${HOME}/.ssh" ]]; then
    # Add tab completion for SSH hostnames based on ~/.ssh/config ignoring wildcards
    [[ -e "${HOME}/.ssh/config" ]] && complete -o "default" \
        -o "nospace" \
        -W "$(grep "^Host" ~/.ssh/config | \
        grep -v "[?*]" | cut -d " " -f2 | \
        tr ' ' '\n')" scp sftp ssh

    cat ~/workspace/baruica/dotfiles/ssh_config > ~/.ssh/config

    if [ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ]; then
        for ssh_config_file in $(find ~/.ssh -name "config.*"); do
            cat "${ssh_config_file}" >> ~/.ssh/config
        done
    fi
fi

# SSH + keychain (sudo apt-get install keychain)
for key in $(find ~/.ssh -name "*.key" -type f); do
    keychain "$key" &> /dev/null
done
if [ -e "${HOME}/.keychain/${HOSTNAME}-sh" ]; then
        # shellcheck source=/dev/null
    source ~/.keychain/${HOSTNAME}-sh
fi

cmd_exists symfony-autocomplete && eval "$(symfony-autocomplete --aliases=sf)"
