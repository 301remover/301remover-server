# Script for populating the database. You can run it with:
# mix run priv/repo/seeds.exs

alias Unshortener.Shorteners

{:ok, body} = File.read("urlteam.json")
json = Jason.decode!(body)

Enum.each(json, fn service ->
  name = Map.fetch!(service, "name")
  shortcode_alphabet = Map.fetch!(service, "shortcode_alphabet")
  url_pattern = Map.fetch!(service, "url_pattern")

  Shorteners.create_shortener!(%{
    "domain" => name,
    "url_pattern" => url_pattern,
    "shortcode_alphabet" => shortcode_alphabet,
    "supports_https" => false
  })
end)
