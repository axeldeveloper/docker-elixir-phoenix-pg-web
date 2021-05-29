defmodule AppWeb.CarsController do
  use AppWeb, :controller

  alias App.Car
  alias App.Car.Cars

  def index(conn, _params) do
    cars = Car.list_cars()
    render(conn, "index.html", cars: cars)
  end

  def new(conn, _params) do
    changeset = Car.change_cars(%Cars{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cars" => cars_params}) do
    case Car.create_cars(cars_params) do
      {:ok, cars} ->
        conn
        |> put_flash(:info, "Cars created successfully.")
        |> redirect(to: Routes.cars_path(conn, :show, cars))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cars = Car.get_cars!(id)
    render(conn, "show.html", cars: cars)
  end

  def edit(conn, %{"id" => id}) do
    cars = Car.get_cars!(id)
    changeset = Car.change_cars(cars)
    render(conn, "edit.html", cars: cars, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cars" => cars_params}) do
    cars = Car.get_cars!(id)

    case Car.update_cars(cars, cars_params) do
      {:ok, cars} ->
        conn
        |> put_flash(:info, "Cars updated successfully.")
        |> redirect(to: Routes.cars_path(conn, :show, cars))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cars: cars, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cars = Car.get_cars!(id)
    {:ok, _cars} = Car.delete_cars(cars)

    conn
    |> put_flash(:info, "Cars deleted successfully.")
    |> redirect(to: Routes.cars_path(conn, :index))
  end
end
