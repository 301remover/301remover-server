defmodule Unshortener.AmqpConnection do
  def start_link() do
    params = Application.get_env(:unshortener, :amqp)

    unless "#{Mix.env()}" === "test" do
      {:ok, conn} = Freddy.Connection.start_link(params)
      {:ok, _client} = Unshortener.RpcClient.start_link(conn)
    else
      {:ok, conn} = Freddy.Connection.start_link(adapter: :sandbox)
      {:ok, client} = MockClient.start_link(conn)
    end
  end
end
