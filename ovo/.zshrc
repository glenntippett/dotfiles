# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme