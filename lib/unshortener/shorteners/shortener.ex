defmodule Unshortener.Shorteners.Shortener do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shorteners" do
    field :domain, :string
    field :shortcode_alphabet, :string
    field :supports_https, :boolean, default: false
    field :url_pattern, :string

    timestamps()
  end

  @doc false
  def changeset(shortener, attrs) do
    shortener
    |> cast(attrs, [:domain, :url_pattern, :shortcode_alphabet, :supports_https])
    |> validate_required([:domain, :url_pattern, :shortcode_alphabet, :supports_https])
    |> unique_constraint(:domain)

    # this is significantly more permissive than the real domain name format
    |> validate_format(:domain, ~r/[a-zA-Z0-9_\-\.]+/)

    # the string "{shortcode}" must appear somewhere in the pattern
    |> validate_format(:url_pattern, ~r/\{shortcode\}/)
  end
end
