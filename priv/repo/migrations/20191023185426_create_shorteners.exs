defmodule Unshortener.Repo.Migrations.CreateShorteners do
  use Ecto.Migration

  def change do
    create table(:shorteners) do
      add :domain, :string
      add :url_pattern, :string
      add :shortcode_alphabet, :string
      add :supports_https, :boolean, default: false, null: false

      timestamps()
    end
  end
end
