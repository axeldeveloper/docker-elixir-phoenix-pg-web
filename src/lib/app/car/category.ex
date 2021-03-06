defmodule App.Car.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :description, :string
    has_many :cars, App.Car.Cars
    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])

    #|> validate_format(:email, ~r/@/)
    #|> validate_inclusion(:age, 18..100)
  end
end
