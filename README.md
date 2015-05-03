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
$ docker-compose up -d
```
