defmodule Unshortener.Repo.Migrations.AddUniqueIndexToShorteners do
  use Ecto.Migration

  def change do
    alter table(:shorteners) do
      modify(:domain, :string, null: false)
    end

    create(unique_index(:shorteners, [:domain]))
  end
end
