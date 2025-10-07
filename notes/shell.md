create own prompt:

autoload -U promptinit
promptinit
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats '%F{yellow} %F{007}%b%f'
setopt PROMPT_SUBST

get_git_status() {
	GIT_PROMPT_PREFIX=""
	
	# Is it a git repo?
	if [[ -n $vcs_info_msg_0_ ]]; then
		GIT_PROMPT_PREFIX+="${vcs_info_msg_0_}"

		# Stashed
		if [[ -n $(git stash list 2>/dev/null) ]]; then
			GIT_PROMPT_PREFIX+=" %F{245}󰷉 %f"
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
	fi

	echo $GIT_PROMPT_PREFIX	
}

PROMPT=' 
 %F{cyan}  ${PWD/#$HOME/~}%f $(get_git_status)
 %F{007} $f%{$reset_color%} '

