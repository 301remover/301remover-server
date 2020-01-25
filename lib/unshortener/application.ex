defmodule Unshortener.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    Unshortener.MetricsExporter.setup()
    Unshortener.PhoenixInstrumenter.setup()

    # List all child processes to be supervised
    children = [
      # Start ecto repo
      Unshortener.Repo,
      # Start endpoint when application starts
      UnshortenerWeb.Endpoint,

      # Start message queue 
      worker(Unshortener.AmqpConnection, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Unshortener.Supervisor]

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UnshortenerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
