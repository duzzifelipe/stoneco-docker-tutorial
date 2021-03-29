defmodule ElixirAppWeb.PageController do
  use ElixirAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
