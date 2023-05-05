source ~/dotfiles/variables.sh
source $DOTFILES_DIR/functions.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(git zsh-autosuggestions ssh-agent)

source $ZSH/oh-my-zsh.sh

# Workaround for zsh-autosuggestions colour not visible when using Solarized terminal theme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

load_alias $DOTFILES_DIR/shared/zsh/zsh_alias
load_alias $DOTFILES_DIR/ubuntu/zsh/zsh_alias

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Dev exports: 
export AWS_DEFAULT_REGION=ap-southeast-2

# FYI 
# Ovo Dev Node Version - v16.17.0

source ~/powerlevel10k/powerlevel10k.zsh-theme
source /home/glenn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(~/.rbenv/bin/rbenv init - zsh)"
