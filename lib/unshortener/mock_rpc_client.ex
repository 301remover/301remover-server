defmodule MockClient do
  use Freddy.RPC.Client

  def start_link(conn) do
    Freddy.RPC.Client.start_link(__MODULE__, conn, [], [])
  end

  def flush(client) do
    Freddy.RPC.Client.call(client, :flush)
  end

  def before_request(request, sink) do
    {:reply, :ok, [request | sink]}
  end

  def handle_call(:flush, sink) do
    {:reply, Enum.reverse(sink), []}
  end
end
