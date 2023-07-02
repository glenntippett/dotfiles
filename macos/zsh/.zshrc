source ~/dotfiles/variables.sh
source $DOTFILES_DIR/functions.sh

source $DOTFILES_DIR/macos/paths.sh
source $DOTFILES_DIR/macos/environment.sh

load_alias $DOTFILES_DIR/shared/zsh/zsh_alias
load_alias $DOTFILES_DIR/macos/zsh/zsh_alias

ZSH_THEME="frisk"
plugins=(git zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/glenntippett/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

