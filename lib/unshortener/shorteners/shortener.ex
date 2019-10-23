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
  end
end
