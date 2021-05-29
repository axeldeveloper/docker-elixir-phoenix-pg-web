defmodule App.Car.Cars do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :color, :string
    field :name, :string
    field :notes, :string
    field :plaque, :string
    field :renavam, :string
    field :year, :integer
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(cars, attrs) do
    cars
    |> cast(attrs, [:name, :color, :plaque, :renavam, :year, :notes])
    |> validate_required([:name, :color, :plaque, :renavam, :year, :notes])
  end
end
