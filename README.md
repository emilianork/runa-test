# Runa test

## Project models documentation

https://gitlab.com/jemiliano.cabrera/runa-test/blob/master/docs/models.org

## Install steps

## Dependencies

- Ruby 2.4
- MySQL 5.7

## Install Docker

```https://www.docker.com```

Install Jet

```sh
$ brew cask install jet
```

## Testing

Run

```sh
$ jet steps
```

## Development

Run docker container

```sh
$ docker-compose -f codeship-services.yml up
```

Enter main service using

```sh
$ docker-compose -f codeship-services.yml exec ruby /bin/bash
```

The first time the container is up, run:

```sh
$ cd /app
$ bundle install
$ rake db:setup
```

Run tests using:

```sh
$ rspec
```

