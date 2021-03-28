defmodule WithDatabase.ReleaseTask do
  @moduledoc false

  require Logger

  def create_database do
    {:ok, _} = Application.ensure_all_started(:with_database)

    case WithDatabase.Repo.__adapter__().storage_up(WithDatabase.Repo.config()) do
      :ok ->
        Logger.info("OK")

      {:error, :already_up} ->
        Logger.info("Already up")

      {:error, term} ->
        Logger.error("Failed #{inspect(term)}")
    end

    :init.stop()
  end

  @doc """
  Starts the app and executes Ecto's pending migrations
  """
  def migrate do
    {:ok, _} = Application.ensure_all_started(:with_database)

    path = Application.app_dir(:with_database, "priv/repo/migrations")

    Ecto.Migrator.run(WithDatabase.Repo, path, :up, all: true)

    :init.stop()
  end
end
