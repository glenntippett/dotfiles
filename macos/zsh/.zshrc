# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dotfiles/variables.sh
source $DOTFILES_DIR/functions.sh

source $DOTFILES_DIR/macos/paths.sh
source $DOTFILES_DIR/macos/environment.sh

load_alias $DOTFILES_DIR/shared/zsh/zsh_alias
load_alias $DOTFILES_DIR/macos/zsh/zsh_alias

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

# Workaround for zsh-autosuggestions colour not visible when using Solarized terminal theme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/glenntippett/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /opt/homebrew/bin/terraform terraform

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Suppress p10k warning about zsh I/O on startup
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
