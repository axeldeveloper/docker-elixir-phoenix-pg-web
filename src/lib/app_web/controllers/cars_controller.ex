defmodule AppWeb.CarsController do
  use AppWeb, :controller

  alias App.Car
  alias App.Car.Cars
  alias App.Car.Category
  # alias App.Repo

  def index(conn, _params) do
    cars = Car.list_cars()

    # IO.puts cars

    render(conn, "index.html", cars: cars)
  end

  def new(conn, _params) do
    changeset = Car.change_cars(%Cars{})
    # categories  = Repo.all(Parent) |> Enum.map(&{&1.id, &1.name})
    categories  = Car.list_categories() |> Enum.map(&{&1.name, &1.id})

    # categories = Repo.all from p in Category, select: {p.name, p.id}
    render(conn, "new.html", changeset: changeset, categories: categories)
  end

  def create(conn, %{"cars" => cars_params}) do
    case Car.create_cars(cars_params) do
      {:ok, cars} ->
        conn
        |> put_flash(:info, "Cars created successfully.")
        |> redirect(to: Routes.cars_path(conn, :show, cars))

      {:error, %Ecto.Changeset{} = changeset} ->
        categories  = Car.list_categories() |> Enum.map(&{&1.name, &1.id})
        render(conn, "new.html", changeset: changeset, categories: categories)
    end
  end

  def show(conn, %{"id" => id}) do
    cars = Car.get_cars!(id)
    render(conn, "show.html", cars: cars)
  end

  def edit(conn, %{"id" => id}) do
    cars = Car.get_cars!(id)
    changeset = Car.change_cars(cars)
    categories  = Car.list_categories() |> Enum.map(&{&1.name, &1.id})
    render(conn, "edit.html", cars: cars, changeset: changeset, categories: categories)
  end

  def update(conn, %{"id" => id, "cars" => cars_params}) do
    cars = Car.get_cars!(id)

    case Car.update_cars(cars, cars_params) do
      {:ok, cars} ->
        conn
        |> put_flash(:info, "Cars updated successfully.")
        |> redirect(to: Routes.cars_path(conn, :show, cars))

      {:error, %Ecto.Changeset{} = changeset} ->
        categories  = Car.list_categories() |> Enum.map(&{&1.name, &1.id})
        render(conn, "edit.html", cars: cars, changeset: changeset, categories: categories)
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
