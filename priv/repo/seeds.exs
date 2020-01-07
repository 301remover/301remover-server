# Script for populating the database. You can run it with:
# mix run priv/repo/seeds.exs

alias Unshortener.Shorteners

{:ok, body} = File.read("priv/repo/shorteners.json")
json = Jason.decode!(body)

Enum.each(json, fn service ->
  Shorteners.create_shortener!(service)
end)
