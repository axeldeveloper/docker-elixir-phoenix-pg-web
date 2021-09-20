# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     App.Repo.insert!(%App.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias App.Repo
alias App.Car
alias App.Service
alias App.Car.Order

alias App.Car.Cars
alias App.Car.Category
alias App.Car.Services

now = DateTime.truncate(DateTime.utc_now(), :second)
now2 = String.replace("2021-09-01", ~r/\./, "-")
now1 = Date.from_iso8601!("2017-02-22")

IO.puts("Prepare Seeds" )
IO.puts("-------------------" )
IO.puts(now)
IO.puts(now1)
IO.puts(now2)

carr = Car.get_cars!(3)
IO.puts("Prepare Carro #{carr.id}" )

App.Repo.insert! %Order{
  ordered: "45888879",
  description: "Description",
  date_emission:  now1,
  value: 50.000,
  observation: "Produto Final",
  car: carr
}

IO.puts("Create Categories" )
IO.puts("-------------------" )

categories_data = [
  %{
    name: "Motociletas",
    description: "Motociletas 100"
  },
  %{
    name: "Motonetas",
    description: "Motonetas untitled"
  },
  %{
    name: "Bicicletas",
    description: "Bicicletas"
  }
]

Enum.each(categories_data, fn(data) ->
  IO.puts("data : #{data.name}")
  App.Car.create_category(data)
end)


IO.puts("Create Services" )
IO.puts("-------------------" )

services_data = [
  %{
    name: "Kit Embreagem",
    description: "Kit Embreagem",
    value: 10.5
  },
  %{
    name: "Kit amortecedor",
    description: "MotoKitnetas amortecedor",
    value: 11.5
  },
  %{
    name: "Troca de rolamento do coxim",
    description: "Bicicletas",
    value: 12.5
  }
]

Enum.each(services_data, fn(data) ->
  IO.puts("data : #{data.name}")
  App.Service.create_service(data)
end)


#for _ <- 1..5 do
  # Car.create_category(%{name: "Seeder", description: "Seeder" })
#end
