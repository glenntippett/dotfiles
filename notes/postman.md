script to save token into environment variables

Postman

```javascript
pm.environment.set("access_token", pm.response.json().access_token);
```

Insomnia

```javascript
const jsonBody = insomnia.response.json();
insomnia.environment.set("access_token", jsonBody.access_token);
```
