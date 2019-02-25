defmodule UnshortenerWeb.UnshortenController do
  use UnshortenerWeb, :controller

  def index(conn, %{"shortlinks" => shortlinks}) do
    resolved_urls = Unshortener.Unshorten.unshorten(shortlinks)
    render(conn, "bulk.json", resolved_urls: resolved_urls)
  end
end
