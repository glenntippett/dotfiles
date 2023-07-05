Add remote with gh cli
`git remote add origin $(gh repo view $repo --json sshUrl --jq .sshUrl)`
