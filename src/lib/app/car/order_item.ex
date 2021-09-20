defmodule App.Car.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_items" do
    field :name, :string
    field :order_number, :string
    field :another_value, :decimal
    field :cbenef,        :string
    field :discount_value, :decimal
    field :freight_value,  :decimal
    field :quantity, :integer
    field :total_value, :decimal
    field :unit_cost_value, :decimal
    field :unit_value, :decimal
    field :value_freight, :decimal
    field :service_id, :id
    field :order_id, :id

    timestamps()
  end

  @doc false
  def changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [:name, :order_number, :quantity, :discount_value, :unit_cost_value, :total_value])
    |> validate_required([:name, :order_number, :quantity, :discount_value, :unit_cost_value, :total_value])
  end
end
