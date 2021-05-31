defmodule AppWeb.ServiceController do
  use AppWeb, :controller

  #alias App.Car
  alias App.Service
  alias App.Car.Services

  def index(conn, _params) do
    services = Service.list_services()
    render(conn, "index.html", services: services)
  end

  def new(conn, _params) do
    changeset = Service.change_service(%Services{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"services" => service_params}) do
    case Service.create_service(service_params) do
      {:ok, service} ->
        conn
        |> put_flash(:info, "Service created successfully.")
        |> redirect(to: Routes.service_path(conn, :show, service))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    service = Service.get_service!(id)
    render(conn, "show.html", service: service)
  end

  def edit(conn, %{"id" => id}) do
    service = Service.get_service!(id)
    changeset = Service.change_service(service)
    render(conn, "edit.html", service: service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "services" => service_params}) do
    service = Service.get_service!(id)

    case Service.update_service(service, service_params) do
      {:ok, service} ->
        conn
        |> put_flash(:info, "Service updated successfully.")
        |> redirect(to: Routes.service_path(conn, :show, service))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", service: service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    services = Service.get_service!(id)
    {:ok, _service} = Service.delete_service(services)

    conn
    |> put_flash(:info, "Service deleted successfully.")
    |> redirect(to: Routes.service_path(conn, :index))
  end
end
