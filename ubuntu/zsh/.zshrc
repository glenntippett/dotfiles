# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dotfiles/variables.sh

source $DOTFILES_DIR/functions.sh
source $DOTFILES_DIR/ubuntu/paths.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

load_alias $DOTFILES_DIR/shared/zsh/zsh_alias
load_alias $DOTFILES_DIR/ubuntu/zsh/zsh_alias

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


autoload -U +X bashcompinit && bashcompinit

source /home/glenn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(~/.rbenv/bin/rbenv init - zsh)"

export PATH=$HOME/.local/bin:$PATH
        
export PATH=/usr/local/bin/shfmt:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/glenn/.bun/_bun" ] && source "/home/glenn/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
