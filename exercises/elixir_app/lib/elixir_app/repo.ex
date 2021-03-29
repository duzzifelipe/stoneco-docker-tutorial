defmodule ElixirApp.Repo do
  use Ecto.Repo,
    otp_app: :elixir_app,
    adapter: Ecto.Adapters.MyXQL
end
