#!/usr/bin/env bash

# readonly BASH_PROMPT="~/baruica/dotfiles/.bash_prompt"
# [[ -r $BASH_PROMPT ]] && [[ -f $BASH_PROMPT ]] && . $BASH_PROMPT

for file in ~/baruica/dotfiles/.{functions,aliases,exports}; do
    if [[ -r $file ]] && [[ -f $file ]]; then
        . "$file"
    fi
done
unset file

shopt -s cdspell        # Autocorrect typos in path names when using "cd"
shopt -s cmdhist        # Save multi-line commands as one command
shopt -s histverify
shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)

complete -cf sudo       # Autocomple with sudo

if [[ -d ~/.ssh ]]; then
    # Add tab completion for SSH hostnames based on ~/.ssh/config ignoring wildcards
    [[ -e ~/.ssh/config ]] && complete -o "default" \
        -o "nospace" \
        -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

    [ -e ~/baruica/dotfiles/ssh_config ] && cat ~/baruica/dotfiles/ssh_config > ~/.ssh/config

    if [[ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ]]; then
        for ssh_config_file in $(find ~/.ssh -name "config.*"); do
            cat "${ssh_config_file}" >> ~/.ssh/config
        done
    fi
fi

# # SSH + keychain (sudo apt install keychain)
# for key in $(find ~/.ssh -name "*.key" -type f); do
#     keychain "$key" &> /dev/null
# done
# if [[ -e ~/.keychain/"${HOSTNAME}"-sh ]]; then
#     . ~/.keychain/"${HOSTNAME}"-sh
# fi
