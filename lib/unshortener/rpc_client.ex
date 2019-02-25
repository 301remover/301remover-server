defmodule Unshortener.RpcClient do
  use Freddy.RPC.Client

  require Logger

  alias Freddy.RPC.Request

  @exchange %Freddy.Core.Exchange{
    name: "301remover",
    type: :direct,
    opts: [durable: false]
  }
  @config [exchange: @exchange]

  def start_link(conn, opts \\ []) do
    Freddy.RPC.Client.start_link(__MODULE__, conn, @config, nil, name: __MODULE__)
  end

  def request(client, routing_key, payload) do
    Freddy.RPC.Client.request(client, routing_key, payload)
  end

  @impl true
  def on_timeout(request, state) do
    Logger.warn(
      "Request to server #{request.routing_key} timed out after #{Request.duration(request)} ms"
    )

    {:reply, {:error, :timeout}, state}
  end

  @impl true
  def on_return(request, state) do
    Logger.warn("Request to server #{request.routing_key} couldn't be routed")
    {:reply, {:error, :no_route}, state}
  end

  @impl true
  def on_response(response, request, state) do
    {:reply, response, state}
  end
end
