script to save token into environment variables

```javascript
pm.environment.set("access_token", pm.response.json().access_token);
```
