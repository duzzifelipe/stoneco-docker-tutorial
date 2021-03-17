defmodule WithDatabase.Repo do
  use Ecto.Repo,
    otp_app: :with_database,
    adapter: Ecto.Adapters.Postgres
end
