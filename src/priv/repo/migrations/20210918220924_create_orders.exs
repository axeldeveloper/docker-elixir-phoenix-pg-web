defmodule App.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :ordered, :string
      add :description, :string
      add :date_emission, :date
      add :value, :float
      add :observation, :text
      add :car_id, references(:cars, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:car_id])
  end
end
