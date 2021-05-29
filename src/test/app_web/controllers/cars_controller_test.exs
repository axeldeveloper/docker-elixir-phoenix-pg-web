defmodule AppWeb.CarsControllerTest do
  use AppWeb.ConnCase

  alias App.Car

  @create_attrs %{color: "some color", name: "some name", notes: "some notes", plaque: "some plaque", renavam: "some renavam", year: 42}
  @update_attrs %{color: "some updated color", name: "some updated name", notes: "some updated notes", plaque: "some updated plaque", renavam: "some updated renavam", year: 43}
  @invalid_attrs %{color: nil, name: nil, notes: nil, plaque: nil, renavam: nil, year: nil}

  def fixture(:cars) do
    {:ok, cars} = Car.create_cars(@create_attrs)
    cars
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      conn = get(conn, Routes.cars_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cars"
    end
  end

  describe "new cars" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cars_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cars"
    end
  end

  describe "create cars" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cars_path(conn, :create), cars: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cars_path(conn, :show, id)

      conn = get(conn, Routes.cars_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cars"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cars_path(conn, :create), cars: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cars"
    end
  end

  describe "edit cars" do
    setup [:create_cars]

    test "renders form for editing chosen cars", %{conn: conn, cars: cars} do
      conn = get(conn, Routes.cars_path(conn, :edit, cars))
      assert html_response(conn, 200) =~ "Edit Cars"
    end
  end

  describe "update cars" do
    setup [:create_cars]

    test "redirects when data is valid", %{conn: conn, cars: cars} do
      conn = put(conn, Routes.cars_path(conn, :update, cars), cars: @update_attrs)
      assert redirected_to(conn) == Routes.cars_path(conn, :show, cars)

      conn = get(conn, Routes.cars_path(conn, :show, cars))
      assert html_response(conn, 200) =~ "some updated color"
    end

    test "renders errors when data is invalid", %{conn: conn, cars: cars} do
      conn = put(conn, Routes.cars_path(conn, :update, cars), cars: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cars"
    end
  end

  describe "delete cars" do
    setup [:create_cars]

    test "deletes chosen cars", %{conn: conn, cars: cars} do
      conn = delete(conn, Routes.cars_path(conn, :delete, cars))
      assert redirected_to(conn) == Routes.cars_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cars_path(conn, :show, cars))
      end
    end
  end

  defp create_cars(_) do
    cars = fixture(:cars)
    %{cars: cars}
  end
end
