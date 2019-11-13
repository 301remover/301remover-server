use Mix.Config

config :unshortener, UnshortenerWeb.Endpoint,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}, compress: true],
  url: [scheme: "http", host: System.get_env("HOST"), port: {:system, "PORT"}],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

config :unshortener, :amqp,
  host: System.get_env("RABBITMQ_HOST"),
  username: System.get_env("RABBITMQ_USER"),
  password: System.get_env("RABBITMQ_PASS"),
  virtual_host: System.get_env("RABBITMQ_VHOST")

config :unshortener, Unshortener.Repo,
  # ssl: true,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
