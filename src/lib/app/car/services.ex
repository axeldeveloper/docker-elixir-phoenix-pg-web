defmodule App.Car.Services do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :description, :string
    field :name, :string
    field :value, :decimal

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :description, :value])
    |> validate_required([:name, :description, :value])
  end
end
