# 301remover Server

Part of the 301remover project.

This component is the server that takes requests from the browser extension. It handles them by delegating the requests to a cluster of RPC servers

## Setup

To setup a Postgres DB using Docker:

```bash
docker run -d --name 301remover-psql -p 5432:5432 postgres
```

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit <http://localhost:4000> from your browser.
