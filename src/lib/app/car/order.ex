defmodule App.Car.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :description, :string
    field :ordered, :string
    field :date_emission, :date
    field :value, :float
    #field :car_id, :id
    has_one :cars, App.Car.Cars

    has_many :items, App.Car.OrderItem

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:ordered, :description, :value])
    |> validate_required([:ordered, :description, :value])
  end
end
