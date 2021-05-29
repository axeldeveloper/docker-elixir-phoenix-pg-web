defmodule App.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :name, :string
      add :color, :string
      add :plaque, :string
      add :renavam, :string
      add :year, :integer
      add :notes, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:cars, [:category_id])
  end
end
