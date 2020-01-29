Creates a self-signed certificate and uses nginx to proxy_pass to a desired location.

This was created for the purpose of using with Cloudflare **Full** encryption mode.

Made following https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04 as a guide

# Usage

Specify the target to `proxy_pass` to with the first argument. 

With docker run:

```
docker run -d -p 443:443 olicoad/self-sign-nginx-proxy-pass http://example.com
```

The target defaults to `http://dockerhost` for use with [qoomon/docker-host](https://github.com/qoomon/docker-host) to add self signed https to any existing http server on the host

With docker-compose:

```
version: '3'
services:
  dockerhost:
    image: qoomon/docker-host
    cap_add: [ 'NET_ADMIN', 'NET_RAW' ]
    restart: always
  nginx:
    image: olicoad/self-sign-nginx-proxy-pass
    restart: always
    ports:
      - '443:443'
```