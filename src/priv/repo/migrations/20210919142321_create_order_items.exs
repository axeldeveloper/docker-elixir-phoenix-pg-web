defmodule App.Repo.Migrations.CreateOrderItem do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :name, :string
      add :order_number, :string
      add :another_value, :decimal
      add :cbenef,        :string
      add :discount_value, :decimal
      add :freight_value,  :decimal
      add :quantity, :integer
      add :total_value, :decimal
      add :unit_cost_value, :decimal
      add :unit_value, :decimal
      add :value_freight, :decimal
      add :service_id, references(:services, on_delete: :nothing)
      add :order_id, references(:orders, on_delete: :nothing)
            #  item_number                  :string
      #  discount_percentage_value    :decimal(, )
      #  quantity_reservation         :decimal(, )
      #  quantity_stock               :integer
      #  quantity_text                :string
      #  tax_approximate              :decimal(, )
      #  tax_approximate_percentage   :decimal(, )
      #  total_cost_value             :decimal(, )
      #  total_without_discount_value :decimal(, )
      #  cest_id                      :integer
      #  nature_operation_id          :bigint
      #  ncm_id                       :integer
      #  order_sale_id                :bigint
      #  product_id                   :bigint
      #  stock_id                     :bigint
      #  unity_id
      timestamps()
    end

    create index(:order_items, [:service_id])
  end
end
