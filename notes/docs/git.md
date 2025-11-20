# Git releases

Help:

```zsh
git tag --help
```

Show last release version:

```zsh
git describe --abbrev=0 --tags
```

Show all tags:

```zsh
git tag --list
```

Create a tag:

```zsh
git tag {tagName}
```

Push tags:

```zsh
git push --tags
```

Release latest tag:

```zsh
gh release create {{tag}} --generate-notes --draft
```

Delete all local branches except master/main

```zsh
git branch | grep -v "main" | xargs git branch -D
```
