source ~/dotfiles/variables.sh

source $DOTFILES_DIR/functions.sh
source $DOTFILES_DIR/ubuntu/paths.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Default theme
ZSH_THEME="frisk"

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
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        
export PATH=/usr/local/bin/shfmt:$PATH

