defmodule App.Car do
  @moduledoc """
  The Car context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Car.Cars

  @doc """
  Returns the list of cars.

  ## Examples

      iex> list_cars()
      [%Cars{}, ...]

  """
  def list_cars do
    Repo.all(Cars) |> Repo.preload(:category)

    #teams_users =
    #  from(t in Team, where: t.owner_id == ^user_id)
    #  |> Repo.all()
    #  |> Repo.preload(team_users: :user)

  end

  @doc """
  Gets a single cars.

  Raises `Ecto.NoResultsError` if the Cars does not exist.

  ## Examples

      iex> get_cars!(123)
      %Cars{}

      iex> get_cars!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cars!(id) do
    Repo.get!(Cars, id) |> Repo.preload(:category)
  end

  @doc """
  Creates a cars.

  ## Examples

      iex> create_cars(%{field: value})
      {:ok, %Cars{}}

      iex> create_cars(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cars(attrs \\ %{}) do
    %Cars{}
    |> Cars.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cars.

  ## Examples

      iex> update_cars(cars, %{field: new_value})
      {:ok, %Cars{}}

      iex> update_cars(cars, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cars(%Cars{} = cars, attrs) do
    cars
    |> Cars.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cars.

  ## Examples

      iex> delete_cars(cars)
      {:ok, %Cars{}}

      iex> delete_cars(cars)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cars(%Cars{} = cars) do
    Repo.delete(cars)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cars changes.

  ## Examples

      iex> change_cars(cars)
      %Ecto.Changeset{data: %Cars{}}

  """
  def change_cars(%Cars{} = cars, attrs \\ %{}) do
    Cars.changeset(cars, attrs)
  end

  # colar service alias App.Car.Service

  # colar alias App.Car.Order

  # alias App.Car.Category

end
