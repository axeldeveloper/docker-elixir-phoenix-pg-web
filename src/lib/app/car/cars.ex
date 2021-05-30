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
    # field :category_id, :id

    belongs_to :category, App.Car.Category

    timestamps()
  end

  @doc false
  def changeset(cars, attrs) do
    cars
    |> cast(attrs, [:name, :color, :plaque, :renavam, :year, :notes, :category_id])
    |> cast_assoc(:category, reload: true)
    |> validate_required([:name, :color, :plaque, :renavam, :year, :notes, :category_id])
  end
end