defmodule App.CarTest do
  use App.DataCase

  alias App.Car

  describe "categories" do
    alias App.Car.Category

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Car.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Car.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Car.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Car.create_category(@valid_attrs)
      assert category.description == "some description"
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Car.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Car.update_category(category, @update_attrs)
      assert category.description == "some updated description"
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Car.update_category(category, @invalid_attrs)
      assert category == Car.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Car.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Car.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Car.change_category(category)
    end
  end

  describe "cars" do
    alias App.Car.Cars

    @valid_attrs %{color: "some color", name: "some name", notes: "some notes", plaque: "some plaque", renavam: "some renavam", year: 42}
    @update_attrs %{color: "some updated color", name: "some updated name", notes: "some updated notes", plaque: "some updated plaque", renavam: "some updated renavam", year: 43}
    @invalid_attrs %{color: nil, name: nil, notes: nil, plaque: nil, renavam: nil, year: nil}

    def cars_fixture(attrs \\ %{}) do
      {:ok, cars} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Car.create_cars()

      cars
    end

    test "list_cars/0 returns all cars" do
      cars = cars_fixture()
      assert Car.list_cars() == [cars]
    end

    test "get_cars!/1 returns the cars with given id" do
      cars = cars_fixture()
      assert Car.get_cars!(cars.id) == cars
    end

    test "create_cars/1 with valid data creates a cars" do
      assert {:ok, %Cars{} = cars} = Car.create_cars(@valid_attrs)
      assert cars.color == "some color"
      assert cars.name == "some name"
      assert cars.notes == "some notes"
      assert cars.plaque == "some plaque"
      assert cars.renavam == "some renavam"
      assert cars.year == 42
    end

    test "create_cars/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Car.create_cars(@invalid_attrs)
    end

    test "update_cars/2 with valid data updates the cars" do
      cars = cars_fixture()
      assert {:ok, %Cars{} = cars} = Car.update_cars(cars, @update_attrs)
      assert cars.color == "some updated color"
      assert cars.name == "some updated name"
      assert cars.notes == "some updated notes"
      assert cars.plaque == "some updated plaque"
      assert cars.renavam == "some updated renavam"
      assert cars.year == 43
    end

    test "update_cars/2 with invalid data returns error changeset" do
      cars = cars_fixture()
      assert {:error, %Ecto.Changeset{}} = Car.update_cars(cars, @invalid_attrs)
      assert cars == Car.get_cars!(cars.id)
    end

    test "delete_cars/1 deletes the cars" do
      cars = cars_fixture()
      assert {:ok, %Cars{}} = Car.delete_cars(cars)
      assert_raise Ecto.NoResultsError, fn -> Car.get_cars!(cars.id) end
    end

    test "change_cars/1 returns a cars changeset" do
      cars = cars_fixture()
      assert %Ecto.Changeset{} = Car.change_cars(cars)
    end
  end
end
