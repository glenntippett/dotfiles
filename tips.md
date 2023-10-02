Add remote with gh cli
`git remote add origin $(gh repo view $repo --json sshUrl --jq .sshUrl)`

Postman
set env var:

```
var jsonData = JSON.parse(responseBody);
postman.setEnvironmentVariable("access_token_name", jsonData.accessToken);
```

or

```
pm.environment.set("access_token_name", pm.response.json().access_token)
```
