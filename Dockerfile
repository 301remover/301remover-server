FROM elixir:latest

WORKDIR /app

ENV MIX_ENV prod

ENV PORT ${PORT:-4000}
EXPOSE $PORT

RUN mix local.hex --force

RUN mix local.rebar --force

COPY mix.* ./

RUN mix deps.get --only prod

RUN mix deps.compile

COPY . .

ENV SECRET_KEY_BASE "Close the world, Open the next"

RUN mix compile

CMD mix do ecto.migrate, phx.server
