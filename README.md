# gh-zsh-termux

A simple script to set an awesome shell environment for Termux:
* powerlevel10k theme (https://github.com/romkatv/powerlevel10k)
* zsh-completions (https://github.com/zsh-users/zsh-completions)
* zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions)
* fast-syntax-highlighting (https://github.com/zdharma-continuum/fast-syntax-highlighting/
* completion (https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh)
* history (https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh)
* key-bindings (https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/key-bindings.zsh)

Sets the following useful aliases:
* ..='cd ..'
* ...='cd ../..'
* ....='cd ../../..'
* grep='grep --color=auto'

For Linux
* bat='batcat --theme base16 -p'
* ls='ls -h --color=auto'
* la='ls -la --color=auto'

## Installation

``` bash
curl -fsSL https://raw.githubusercontent.com/shuhaibnc/gh-zsh-termux/main/gh-zsh-termux.sh | bash
```

## Notes
* •	If you already use zsh, your zsh config will be backed up to .zshrc-backup-date.
* •	If the text/icons look broken, ensure your terminal uses one of the Nerd fonts.
* Tested on:
  * Termux 0.119.0-beta.3 (1022)