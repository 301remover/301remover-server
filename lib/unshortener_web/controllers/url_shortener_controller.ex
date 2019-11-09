defmodule UnshortenerWeb.UrlShortenerController do
  alias Unshortener.UrlShortener
  use UnshortenerWeb, :controller

  def index(conn, %{"shortlinks" => shortlinks}) do
    IO.inspect(shortlinks)
    resolved_urls = Unshortener.Unshorten.unshorten(shortlinks)
    render(conn, "bulk.json", resolved_urls: resolved_urls)
  end

  def show(conn, %{"domain" => domain}) do
    shortener = UrlShortener.get_url_shortener!(domain)
    render(conn, "show.json", shortener: shortener)
  end
end
