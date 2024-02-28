source ~/dotfiles/variables.sh
source $DOTFILES_DIR/functions.sh

source $DOTFILES_DIR/macos/paths.sh
source $DOTFILES_DIR/macos/environment.sh

load_alias $DOTFILES_DIR/shared/zsh/zsh_alias
load_alias $DOTFILES_DIR/macos/zsh/zsh_alias

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/glenntippett/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OpenJdk FYI
# For the system Java wrappers to find this JDK, symlink it with
#   sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk  -->> already done

# If you need to have openjdk@11 first in your PATH, run:
# export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
# For compilers to find openjdk@11 you may need to set:
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"export PATH=~/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/glenntippett/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/glenntippett/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/glenntippett/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/glenntippett/google-cloud-sdk/completion.zsh.inc'; fi

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH=$HOME/.gem/ruby/3.2.0/bin:$PATH

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
chruby ruby-3.2.2

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
