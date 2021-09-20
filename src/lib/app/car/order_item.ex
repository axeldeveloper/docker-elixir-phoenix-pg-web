defmodule App.Car.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_items" do
    field :discount_value, :decimal
    field :name, :string
    field :order_number, :string
    field :quantity, :integer
    field :total_value, :decimal
    field :unit_cost_value, :decimal
    field :service_id, :id

    timestamps()
  end

  @doc false
  def changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [:name, :order_number, :quantity, :discount_value, :unit_cost_value, :total_value])
    |> validate_required([:name, :order_number, :quantity, :discount_value, :unit_cost_value, :total_value])
  end
end
