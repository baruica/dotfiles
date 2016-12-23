[ -r ~/.composer/vendor/bin ] && export PATH=$PATH:~/.composer/vendor/bin

for file in ~/workspace/baruica/dotfiles/.{aliases,bash_prompt,exports,functions}; do
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

hash symfony-autocomplete >/dev/null 2>&1 && eval "$(symfony-autocomplete --aliases=sf)"

[ -d ~/.ssh ] && [ $(find ~/.ssh -name "config.*" | wc -l) -gt 0 ] && cat ~/workspace/baruica/dotfiles/ssh_config ~/.ssh/config.* > ~/.ssh/config

hash composer >/dev/null 2>&1 && composer self-update

# SSH + keychain (sudo apt-get install keychain)
for key in $(find ~/.ssh -name "*.key" -type f)
do
    keychain $key &> /dev/null
done
[ -e ~/.keychain/${HOSTNAME}-sh ] && source ~/.keychain/${HOSTNAME}-sh
