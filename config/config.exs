# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :unshortener,
  ecto_repos: [Unshortener.Repo]

# Configures the endpoint
config :unshortener, UnshortenerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8sr7Bu+QXF++7g5Sam/CIOD8cwaD+1Uk1oXzhAwehHqjpv8QzDyWgHvN244s/5AM",
  render_errors: [view: UnshortenerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Unshortener.PubSub, adapter: Phoenix.PubSub.PG2],
  instrumenters: [Unshortener.PhoenixInstrumenter]

config :prometheus, Unsortener.PhoenixInstrumenter,
  controller_call_labels: [:controller, :action],
  duration_buckets: [
    10,
    25,
    50,
    100,
    250,
    500,
    1000,
    2500,
    5000,
    10_000,
    25_000,
    50_000,
    100_000,
    250_000,
    500_000,
    1_000_000,
    2_500_000,
    5_000_000,
    10_000_000
  ],
  registry: :default,
  duration_unit: :microseconds

config :prometheus, Unshortener.PipelineInstrumenter,
  labels: [:status_class, :method, :host, :scheme, :request_path],
  duration_buckets: [
    10,
    100,
    1_000,
    10_000,
    100_000,
    300_000,
    500_000,
    750_000,
    1_000_000,
    1_500_000,
    2_000_000,
    3_000_000
  ],
  registry: :default,
  duration_unit: :microseconds

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
