## Zsh

Aliases are added to `~/.oh-my-zsh/custom/alias.zsh`
PATHs can be added to `~/.zprofile` if required to be loaded each time

## Git

### Add remote with gh cli

`git remote add origin $(gh repo view $repo --json sshUrl --jq .sshUrl)`

### Update from upstream (forked) repository:

```sh
git pull upstream master -X ours
```

[Explain Shell](https://explainshell.com/explain?cmd=git+pull+upstream+master+-X+ours)  
[Git docs](https://git-scm.com/docs/merge-strategies)

## Postman set env var

```js
var jsonData = JSON.parse(responseBody);
postman.setEnvironmentVariable("access_token_name", jsonData.accessToken);
```

or

```js
pm.environment.set("access_token_name", pm.response.json().access_token);
```

## Shell

#### FYI:

Add scripts to `/usr/local/bin/` to run from anywhere

#### Get aliases on different OS

https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

### Get os name via uname

```sh
_myos="$(uname)"
```

### Add alias as per os using $\_myos

```sh
case $_myos in
   Linux) alias foo='/path/to/linux/bin/foo';;
   FreeBSD|OpenBSD) alias foo='/path/to/bsd/bin/foo' ;;
   SunOS) alias foo='/path/to/sunos/bin/foo' ;;
   *) ;;
esac
```

### How to Symlink

[sync-vscode-settings-and-snippets](https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/)

1. Move original file to dotfiles location:

```sh
mv settings.json ~/dotfiles/codium
```

2. Link from dotfiles to original location

```sh
ln -s ~/dotfiles/codium/settings.json /Users/glenntippett/Library/Application\ Support/VSCodium/User/settings.json
```

#### Extensions/programs for bash scripting

[shell formatter](https://github.com/mvdan/sh#shfmt)
[shell formatter extension](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format)
[shellcheck](https://github.com/vscode-shellcheck/vscode-shellcheck)
[shellman - for snippets](https://marketplace.visualstudio.com/items?itemName=Remisa.shellman)
