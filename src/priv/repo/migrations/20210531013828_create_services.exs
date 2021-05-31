defmodule App.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :description, :string
      add :value, :decimal

      timestamps()
    end

  end
end
