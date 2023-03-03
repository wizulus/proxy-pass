# proxy-pass

Dead simple NGINX server that builds location and proxy_pass directives from the command line.

```yaml
version: '3.0'
services:
  proxy-pass:
    image: proxy-pass
    ports:
      - 31080:80
    command: |
      / http://web-server-1
      /api http://web-server-2
  web-server-1:
    image: ealen/echo-server
  web-server-2:
    image: ealen/echo-server
```

Go nuts!