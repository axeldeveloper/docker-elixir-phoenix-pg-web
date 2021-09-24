defmodule AppWeb.TableView do

  #use Web, :view
  use AppWeb, :view

  #alias AppWeb.TableView

  def render("car.json", %{cars: cars}) do
    # %{ data: render_many(cars, AppWeb.TableView, "car.json") }
    %{data: render_many(cars, __MODULE__, "car.json" , as: :car)}
  end

  def render("show.json", %{item: item}) do
    render_one(item, AppWeb.TableView, "item.json")
  end


  def render("car.json", %{car: car}) do
    %{
      id: car.id,
      name: car.name,
      color: car.color,
      plaque: car.plaque,
      renavam: car.renavam,
      year: car.year,
      notes: car.notes,
      updated_at: car.updated_at,
      inserted_at: car.inserted_at
    }
  end

end
