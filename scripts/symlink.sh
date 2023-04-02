#!/bin/bash

: '
    How to Symlink:
    https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/

    1. Move original file to dotfiles location:
        mv settings.json ~/dotfiles/codium
    2. Link from dotfiles to original location
        ln -s ~/dotfiles/codium/settings.json /Users/glenntippett/Library/Application\ Support/VSCodium/User/settings.json  
'
