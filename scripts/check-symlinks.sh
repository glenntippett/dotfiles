#!/bin/zsh

export XDG_CONFIG_HOME=$XDG_CONFIG_HOME

# ~~~~~ Zsh ~~~~~

# Check if ~/.zshrc exists and is symlinked, if not, create the symlink

if [ ! -h $HOME/.zshrc ]; then
	echo "zshrc is not symlinked"

	if [ -f $HOME/.zshrc ]; then
		rm $HOME/.zshrc
	fi

	echo "Symlinking .zshrc..."
	ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
fi

# ~~~~~ Neovim ~~~~~

if [ ! -h $XDG_CONFIG_HOME/nvim ]; then
	echo "nvim configuration is not symlinked"

	if [ -f $XDG_CONFIG_HOME/nvim ]; then
		rm -rf $XDG_CONFIG_HOME/nvim/
	fi

	echo "Symlinking nvim..."
	ln -s $HOME/dotfiles/nvim $XDG_CONFIG_HOME/nvim
fi

# Check if ~/.tmux.conf exists and is symlinked, if not, create the symlink

if [ ! -h $XDG_CONFIG_HOME/tmux/tmux.conf ]; then
	echo "tmux.conf is not symlinked"

	if [ -f $XDG_CONFIG_HOME/tmux/tmux.conf ]; then
		rm $XDG_CONFIG_HOME/tmux.conf
	fi

	echo "Symlinking .tmux.conf..."
	ln -s $HOME/dotfiles/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
fi
