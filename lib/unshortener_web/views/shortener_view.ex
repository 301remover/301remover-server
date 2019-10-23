defmodule UnshortenerWeb.ShortenerView do
  use UnshortenerWeb, :view
  alias UnshortenerWeb.ShortenerView

  def render("index.json", %{shorteners: shorteners}) do
    %{data: render_many(shorteners, ShortenerView, "shortener.json")}
  end

  def render("show.json", %{shortener: shortener}) do
    %{data: render_one(shortener, ShortenerView, "shortener.json")}
  end

  def render("shortener.json", %{shortener: shortener}) do
    %{id: shortener.id,
      domain: shortener.domain,
      url_pattern: shortener.url_pattern,
      shortcode_alphabet: shortener.shortcode_alphabet,
      supports_https: shortener.supports_https}
  end
end
