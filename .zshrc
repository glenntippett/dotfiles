export PATH="$PATH:$HOME/bin"
export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/dotfiles
export EDITOR='nvim'

source $DOTFILES/scripts/helpers/*

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'

# Add ~/bin to PATH if it exists
# Use the ~/bin directory for user-specific scripts
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

# ~~~~~ Homebrew ~~~~~

if [ ! -x /opt/homebrew/bin/brew ]; then
	echo -e "${RED}Homebrew is not installed"
	echo -e "${YELLOW}Do you want to install Homebrew? (y/n)"
	read -r install_homebrew

	if [[ $install_homebrew == "y" || $install_homebrew == "Y" ]]; then
		echo -e "${YELLOW}Installing Homebrew..."
		/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		if [ ! -x /opt/homebrew/bin/brew ]; then
			echo -e "${RED}Failed to install Homebrew"
		fi

		echo -e "${GREEN}Homebrew installed successfully"
		echo -e "Restarting shell to apply changes..."
		exec zsh
	else
		echo -e "${RED}Skipping Homebrew installation"
	fi
else
	# https://docs.brew.sh/Installation#post-installation-steps
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ~~~~~~~ Prompt ~~~~~~~

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit
promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

# ~~~~~ Antigen (package manager) ~~~~~

if [ ! -f $XDG_CONFIG_HOME/antigen/antigen.zsh ]; then
	echo -e "${RED}Antigen is not installed"
	echo -e "${YELLOW}Do you want to install Antigen? (y/n)"
	read -r install_antigen
	if [[ $install_antigen == "y" || $install_antigen == "Y" ]]; then
		echo -e "${YELLOW}Installing Antigen..."
		mkdir -p $XDG_CONFIG_HOME/antigen
		curl -L git.io/antigen >$XDG_CONFIG_HOME/antigen/antigen.zsh

		if [ ! -f $XDG_CONFIG_HOME/antigen/antigen.zsh ]; then
			echo -e "${RED}Failed to install Antigen"
		else
			echo -e "${GREEN}Antigen installed successfully"
		fi
	else
		echo -e "${RED}Skipping Antigen installation"
	fi
else
	source $XDG_CONFIG_HOME/antigen/antigen.zsh

	# If there is a problem with packages working, trying removing ~/.antigen
	# This directory will get re-created on the next load
	antigen bundle 'zsh-users/zsh-syntax-highlighting' # Syntax highlighting for ZSH
	antigen bundle 'zsh-users/zsh-autosuggestions'     # Autosuggestions for ZSH based on history
	antigen bundle "Aloxaf/fzf-tab"                    # Tab completion using fzf

	antigen apply
fi

# ~~~~~ Tmux ~~~~~

if [ ! -x /opt/homebrew/bin/tmux ]; then
	echo -e "${RED}Tmux is not installed"
	echo -e "${YELLOW}Do you want to install Tmux? (y/n)"
	read -r install_tmux
	if [[ $install_tmux == "y" || $install_tmux == "Y" ]]; then
		echo -e "${YELLOW}Installing Tmux..."
		brew install tmux

		if [ ! -x /opt/homebrew/bin/tmux ]; then
			echo -e "${RED}Failed to install Tmux"
		else
			echo -e "${GREEN}Tmux installed successfully"
		fi
	else
		echo -e "${RED}Skipping Tmux installation"
	fi
fi

# ~~~~~ Lazygit ~~~~~

if [ ! -x /opt/homebrew/bin/lazygit ]; then
	echo -e "${RED}Lazygit is not installed"
	echo -e "${YELLOW}Do you want to install Lazygit? (y/n)"
	read -r install_lazygit
	if [[ $install_lazygit == "y" || $install_lazygit == "Y" ]]; then
		echo -e "${YELLOW}Installing Lazygit..."
		brew install jesseduffield/lazygit/lazygit

		if [ ! -x /opt/homebrew/bin/lazygit ]; then
			echo -e "${RED}Failed to install Lazygit"
		else
			echo -e "${GREEN}Lazygit installed successfully"
		fi
	else
		echo -e "${RED}Skipping Lazygit installation"
	fi
fi

# ~~~~~ Htop ~~~~~

if [ ! -x /opt/homebrew/bin/htop ]; then
	echo -e "${RED}Htop is not installed"
	echo -e "${YELLOW}Do you want to install Htop? (y/n)"
	read -r install_htop
	if [[ $install_htop == "y" || $install_htop == "Y" ]]; then
		echo -e "${YELLOW}Installing Htop..."
		brew install htop

		if [ ! -x /opt/homebrew/bin/htop ]; then
			echo -e "${RED}Failed to install Htop"
		else
			echo -e "${GREEN}Htop installed successfully"
		fi
	else
		echo -e "${RED}Skipping Htop installation"
	fi
fi

# ~~~~~ Python ~~~~~

# Stopping py initialisation for now as there is some error occuring

# Python environment manager
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# ~~~~~ FZF ~~~~~

if [ ! -x /opt/homebrew/bin/fzf ]; then
	echo -e "${RED}FZF is not installed"
	echo -e "${YELLOW}Do you want to install FZF? (y/n)"
	read -r install_fzf
	if [[ $install_fzf == "y" || $install_fzf == "Y" ]]; then
		echo -e "${YELLOW}Installing FZF..."
		brew install fzf

		if [ ! -x /opt/homebrew/bin/fzf ]; then
			echo -e "${RED}Failed to install FZF"
		else
			echo -e "${GREEN}FZF installed successfully"

			# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
			source <(fzf --zsh)
			export FZF_DEFAULT_OPTS='
			  --style default
			  --preview "fzf-preview.sh {}" --bind "focus:transform-header:file --brief {}"
			  '
		fi
	else
		echo -e "${RED}Skipping FZF installation"
	fi
fi

# ~~~~~~~ Aliases ~~~~~~~

# Vim/Tmux
alias vim="nvim"
alias tm="tmux"

# Searching
alias ff="fzf | xargs -o nvim"

# General helper shortcuts
alias cl="clear"
alias dot="cd ~/dotfiles/"
alias config="cd ~/.config/"
alias ls="ls -G"
alias ll="ls -1FAG"
alias l="ls -lFaHG"
# List available scripts in package.json
alias scripts="bat package.json | jq -r '.scripts | to_entries[] | \"\(.key): \(.value)\"' | fzf --preview 'echo {}' | awk -F': ' '{print \$1}' | xargs -o yarn run"

# Git
alias lg="lazygit"

# Other random things
alias myip="curl https://ipinfo.io/json"                                     # or /ip for plain-text ip - Print IP information
alias random-password='openssl rand -base64 256 | tr -d '\n' | cut -c 1-256' # Generate a random password of 256 characters
# Quickly serve the current directory as HTTP
alias serve='ruby -run -e httpd . -p 8001' # Or python -m SimpleHTTPServer
# Toggle darkmode on/off (Mac)
alias darkmode="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
# Open Slack in developer mode
alias slack="export SLACK_DEVELOPER_MENU=true && open -a /Applications/Slack.app"
alias timestamp="date +%s" # Print current timestamp in seconds
alias matrix="cmatrix"     # brew install cmatrix

# ~~~~~ Specific computer setups ~~~~~

if [[ $(hostname) == "Glenns-MacBook-Air.local" ]]; then
	return
# work
elif [[ $(hostname) == "AMS-MAC-037-c.local" ]]; then
	load_file $XDG_CONFIG_HOME/computer-setup/init
else
  echo -e "${YELLOW} Hostname not found, load work config?"
	read -r load_work_config

	if [[ $load_work_config == "y" || $load_work_config == "Y" ]]; then
	  load_file $XDG_CONFIG_HOME/computer-setup/init
  fi
fi

