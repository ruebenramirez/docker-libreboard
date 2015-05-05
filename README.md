docker-libreboard
============

Run libreboard on Docker.

## Build docker image

```
$ git clone https://github.com/miurahr/docker-libreboard.git
$ cd docker-libreboard
$ docker build -t libreboard .
```

## Usage

Provisionings are placed in docker-compose.yml.
Please edit it before start.

```
$ cp docker-compose.yml.example docker-compose.yml
$ vi docker-compose.yml
$ chmod +777 logs
$ docker-compose up -d
```

## FAQ

- I've got EACCESS error when invoke ```docker-compose up -d```

   It is because you may forget adding write permission to logs directory on host.
   Please check your volumes configuration in docker-compose.yml and directory
   permission.

- Why it is so different Dockerfile than the way Libreboard official document?

   Libreboard developers may aim to simplify a procedure to use libreboard.
   It is basically good, but it hide a procedure under the hood.
   I love an explainable way that users and developers can understand and reproduce a way
   if they want.
   That is because my Dockerfile is made from distribution base.
