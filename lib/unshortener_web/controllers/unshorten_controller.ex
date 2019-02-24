defmodule UnshortenerWeb.UnshortenController do
  use UnshortenerWeb, :controller

  def index(conn, params) do
    conn |> text("200\n")
  end
end
