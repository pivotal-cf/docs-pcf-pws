## Authentication

You must pass a token to each API endpoint. Refer to the right to get an access token. The access
 token is expected as-is on the `Authorization` header of each request.

> Log in to your CF api

```shell
cf api http://api.MY-INSTALLATION.com
```

> Get an access token

```shell
cf oauth-token
```
