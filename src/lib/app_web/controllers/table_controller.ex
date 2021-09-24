defmodule AppWeb.TableController do

  use AppWeb, :controller

  alias App.Car
  alias App.Car.Cars

  def cars(conn, _params) do
    cars = Car.list_cars()
    render(conn, "car.json", cars: cars)
  end

end
