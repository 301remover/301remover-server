defmodule Unshortener.AmqpConnection do
  def start_link() do
    params = Application.get_env(:unshortener, :amqp)

    {:ok, conn} = Freddy.Connection.start_link(params)
    {:ok, _client} = Unshortener.RpcClient.start_link(conn)
  end
end
