## Git
Add remote with gh cli
`git remote add origin $(gh repo view $repo --json sshUrl --jq .sshUrl)`

## Postman set env var
```js
var jsonData = JSON.parse(responseBody);
postman.setEnvironmentVariable("access_token_name", jsonData.accessToken);
```

or

```
pm.environment.set("access_token_name", pm.response.json().access_token)
```

## How to Symlink 
https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
1. Move original file to dotfiles location: `v settings.json ~/dotfiles/codium`
2. Link from dotfiles to original location `ln -s ~/dotfiles/codium/settings.json /Users/glenntippett/Library/Application\ Support/VSCodium/User/settings.json`
