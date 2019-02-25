defmodule UnshortenerWeb.UnshortenView do
  use UnshortenerWeb, :view

  def render("bulk.json", %{resolved_urls: resolved_urls}) do
    resolved_urls
  end
end
