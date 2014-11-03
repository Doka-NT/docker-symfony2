# docker-symfony2

Docker for symfony2 application.

Based on Debian Wheezy.

## How to use (pre-build image)

You must have docker installed.

```bash
docker pull lepiaf/docker-symfony2
```

Then

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -d lepiaf/docker-symfony2
```

The Symfony app is now accessible on http://localhost:8080/app.php

If you want to debug your application you can set the DEBUG environment variable:

```bash
docker run -e DEBUG=1 -v /home/user/symfony2:/var/www -p 8080:80 -p 2222:22 -d lepiaf/docker-symfony2
```

The PHP debugger will then auto-connect to port 9000 of the host that sent the request if remote debugging was indicated (e.g. with 'Xdebug helper').

## Build your own image

```bash
git clone https://github.com/lepiaf/docker-symfony2.git
```

```bash
docker build docker-symfony2
```

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -d lepiaf/docker-symfony2
```

## Package included
* curl
* nginx
* php5-fpm
* php5-cli
* php5-xdebug

## Exposed port
* 80 : http
* 443: https

## Exposed volumes
* /var/www: web content
* /var/log/nginx: nginx logs
