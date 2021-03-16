defmodule NoDatabaseWeb.PageController do
  use NoDatabaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
