defmodule App.Car.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :description, :string
    field :ordered, :string
    field :date_emission, :date
    field :value, :float
    field :observation, :string

    belongs_to :car, App.Car.Cars
    # has_one :car, App.Car.Cars
    has_many :items, App.Car.OrderItem
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:ordered, :description, :date_emission, :value, :car_id])
    |> validate_required([:ordered, :description, :value])
  end
end
