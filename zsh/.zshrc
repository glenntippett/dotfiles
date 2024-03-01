# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/dotfiles/bin/init
source $HOME/dotfiles/bin/load_alias
source $HOME/dotfiles/zsh/nvm

# Theme / Plugins / Oh My Zsh Framework
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(git zsh-autosuggestions)

load_alias $HOME/dotfiles/zsh/alias
load_alias $HOME/dotfiles/ovo/zsh/alias

autoload -U +X bashcompinit && bashcompinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
