# Script for populating the database. You can run it with:
# mix run priv/repo/seeds.exs

alias Unshortener.Shorteners

Shorteners.create_shortener!(%{
  "domain" => "0rz.tw",
  "url_pattern" => "0rz\\.tw\\/{shortcode}",
  "shortcode_alphabet" => "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  "supports_https" => true
})

Shorteners.create_shortener!(%{
  "domain" => "bit.ly",
  "url_pattern" => "bit\\.ly\\/{shortcode}",
  "shortcode_alphabet" => "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_",
  "supports_https" => true
})

Shorteners.create_shortener!(%{
  "domain" => "tinyurl.com",
  "url_pattern" => "tinyurl\\.com\\/{shortcode}",
  "shortcode_alphabet" => "0123456789abcdefghijklmnopqrstuvwxyz",
  "supports_https" => true
})
