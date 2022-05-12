defmodule App.Sales.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :age, :integer
    field :name, :string
    field :cpf, :integer
    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :age, :cpf])
    |> validate_required([:name, :age, :cpf])
  end
end
