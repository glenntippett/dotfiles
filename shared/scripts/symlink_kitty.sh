#!/usr/bin/env bash

KITTY_DIR=~/.config/kitty/

if [ -d "$KITTY_DIR" ]; then
  echo "Clearing local Kitty..."
  rm -rf $KITTY_DIR
else
  echo "No local Kitty exists"
fi

echo "Recreating directory"
mkdir ~/.config/kitty/

echo "Symlinking..."

ln -s ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/dotfiles/kitty/theme.conf ~/.config/kitty/theme.conf

echo "All done"

