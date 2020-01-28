defmodule UnshortenerWeb.HomePageController do
  use UnshortenerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
