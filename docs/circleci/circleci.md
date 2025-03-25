View which organisations have access to:
`https://circleci.com/api/v2/me/collaborations`

View private orbs in config:

```zsh
circleci orb list ovoenergyau --private
```

Validate a config file from a private org:

```zsh
circleci config validate --org-slug gh/ovoenergyau .circleci/config.yml
```
