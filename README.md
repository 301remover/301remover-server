# 301remover Server

Part of the 301remover project.

This component is the server that takes requests from the browser extension. It handles them by delegating the requests to a cluster of RPC servers

## Setup

To setup a Postgres DB using Docker:

```bash
docker run -d --name 301remover-psql -p 5432:5432 postgres
```

Setup a RabbitMQ instance using Docker:

```bash
USER=301remover
PASS=your_password_here

docker run -d --name rabbitmq \
-e RABBITMQ_DEFAULT_USER=$USER \
-e RABBITMQ_DEFAULT_PASS=$PASS \
--hostname $HOSTNAME \
-p 5671:5671 \
-p 5672:5672 \
-p 8002:15672 \
rabbitmq:3.7.16-management
```
RabbitMQ will then be accessible via http from localhost:8002

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit <http://localhost:4000> from your browser.

## Running Prod
Build using the docker file:

```bash
docker build .
```

Then run using docker with:
```
docker run --net=host -e DATABASE_URL'postgres://postgres:postgres@0.0.0.0:5432/unshortener_dev' <container>
```

It is assumed that the postgresql and rabbitmq docker images are running.
