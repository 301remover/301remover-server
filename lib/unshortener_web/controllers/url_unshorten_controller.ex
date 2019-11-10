defmodule UnshortenerWeb.UrlUnshortenController do
  use UnshortenerWeb, :controller

  def index(conn, %{"shortlinks" => shortlinks}) do
    resolved_urls = ["http://example.com", "https://example.com/2"]
    render(conn, "bulk.json", resolved_urls: resolved_urls)
  end
end
