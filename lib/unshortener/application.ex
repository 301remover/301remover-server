defmodule Unshortener.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    opts = [strategy: :one_for_one, name: Unshortener.Supervisor]

    [
      UnshortenerWeb.Endpoint,
      worker(Unshortener.AmqpConnection, [])
    ]
    |> Supervisor.start_link(opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UnshortenerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
