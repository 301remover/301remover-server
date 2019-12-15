defmodule UnshortenerWeb.RedirectController do
  use UnshortenerWeb, :controller

  def show(conn, %{"domain" => domain, "shortcode" => shortcode}) do
    [resolved_url] =
      [%{"domain" => domain, "shortcode" => shortcode}]
      |> Unshortener.Unshorten.unshorten()

    redirect(conn, external: resolved_url)
  end
end
