export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/dotfiles
export EDITOR='nvim'

source $DOTFILES/scripts/helpers/*

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'

# ~~~~~~~ Prompt ~~~~~~~

autoload -U promptinit
promptinit
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats '%F{green} %b%f'
setopt PROMPT_SUBST

get_git_status() {
	GIT_PROMPT_PREFIX=""

	if [[ -n $vcs_info_msg_0_ ]]; then
		GIT_PROMPT_PREFIX+="${vcs_info_msg_0_}"
	fi

	# Clean
	if [[ -z $(git status --porcelain 2>/dev/null) ]]; then
		GIT_PROMPT_PREFIX+=""
	# Staged
	elif [[ -n $(git diff --cached --name-status 2>/dev/null) ]]; then
		GIT_PROMPT_PREFIX+=" %F{011}✓%f"
	# Dirty
	elif [[ -n $(git status --porcelain 2>/dev/null) ]]; then
		GIT_PROMPT_PREFIX+=" %F{red}*%f"
	fi

	echo $GIT_PROMPT_PREFIX	
}

PROMPT=' 
 %F{blue}  ${PWD/#$HOME/~}%f $(get_git_status)
%{$fg_bold[green]%}  %{$reset_color%} '

# ~~~~~ Homebrew ~~~~~

if [ ! -x /opt/homebrew/bin/brew ]; then
	echo -e "${RED}Homebrew is not installed"
	echo -e "${YELLOW}Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	if [ ! -x /opt/homebrew/bin/brew ]; then
		echo -e "${RED}Failed to install Homebrew"
	fi
else
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ~~~~~ Packages ~~~~~

if [ ! -f $XDG_CONFIG_HOME/antigen/antigen.zsh ]; then
	echo -e "${RED}Antigen is not installed"
	echo -e "${YELLOW}Installing antigen..."

	mkdir -p $XDG_CONFIG_HOME/antigen
	curl -L git.io/antigen >$XDG_CONFIG_HOME/antigen/antigen.zsh
fi

source $XDG_CONFIG_HOME/antigen/antigen.zsh

# If there is a problem with packages working, trying removing ~/.antigen
# This directory will get re-created on the next load
antigen bundle 'zsh-users/zsh-syntax-highlighting'
antigen bundle 'zsh-users/zsh-autosuggestions'
antigen bundle "Aloxaf/fzf-tab"

antigen apply

# ~~~~~ Tmux ~~~~~

if [ ! -x /opt/homebrew/bin/tmux ]; then
	echo -e "${RED}Tmux is not installed"
	echo -e "${YELLOW}Installing tmux via brew..."

	brew install tmux
fi

if [ ! -x /opt/homebrew/bin/tmux ]; then
	echo -e "${RED} Failed to install tmux"
fi

# ~~~~~ Node ~~~~~

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# ~~~~~ Python ~~~~~

# Stopping py initialisation for now as there is some error occuring

# Python environment manager
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# ~~~~~ Specific computer setups ~~~~~

# Work
if [[ $(hostname) == "Glenns-MacBook-Pro.local" || $(hostname) == "MacBookPro.lan" ]]; then
	load_file $XDG_CONFIG_HOME/ovo/init
fi

# Personal
if [[ $(hostname) == "Glenns-MacBook-Air.local" ]]; then
	load_file $DOTFILES/ruby/init
	load_file $DOTFILES/java/init
fi

# ~~~~~ Bun ~~~~~

if [ -d "$HOME/.bun" ]; then
	# bun completions
	[ -s "/Users/glenntippett/.bun/_bun" ] && source "/Users/glenntippett/.bun/_bun"

	# bun
	export BUN_INSTALL="$HOME/.bun"
	export PATH="$BUN_INSTALL/bin:$PATH"
fi

# ~~~~~ FZF ~~~~~

export FZF_DEFAULT_OPTS='
  --style full
  --height 40%
  --layout=reverse
  --inline-info
  --layout=reverse-list
  --info=inline
  --header="CTRL-c or ESC to quit"
  --tmux 80%
  --border
  --padding 1,2
  --border-label " Demo "
  --input-label " Input "
  --header-label " File Type "
  --preview "fzf-preview.sh {}"
  --bind "result:transform-list-label:
    if [[ -z $FZF_QUERY ]]; then
      echo \" $FZF_MATCH_COUNT items \"
    else
      echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
    fi
    "
  --bind "focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}"
  --bind "focus:+transform-header:file --brief {} || echo \"No file selected\""
  --bind "ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)"
  --color "border:#aaaaaa,label:#cccccc"
  --color "preview-border:#9999cc,preview-label:#ccccff"
  --color "list-border:#669966,list-label:#99cc99"
  --color "input-border:#996666,input-label:#ffcccc"
  --color "header-border:#6699cc,header-label:#99ccff"'

# ~~~~~~~ Aliases ~~~~~~~

alias vim="nvim"
alias tm="tmux"

alias cl="clear"
alias dot="cd ~/dotfiles"

alias ls="ls -G"
alias ll="ls -1FAG"
alias l="ls -lFaHG"

alias gacp="zsh $DOTFILES/scripts/git/git-add-commit-push"

alias myip="curl https://ipinfo.io/json" # or /ip for plain-text ip
alias random-password='openssl rand -base64 256 | tr -d '\n' | cut -c 1-256'

# Search files in current directory and open in selected editor
alias fd="fd-find"

# Quickly serve the current directory as HTTP
alias serve='ruby -run -e httpd . -p 8000' # Or python -m SimpleHTTPServer

# Toggle darkmode on/off (Mac)
alias darkmode="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

# Slack
alias slack="export SLACK_DEVELOPER_MENU=true && open -a /Applications/Slack.app"

# Other
alias timestamp="date +%s"
alias matrix="cmatrix"

alias ff="fzf | xargs -o nvim"
