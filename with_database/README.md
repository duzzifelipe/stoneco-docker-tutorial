# WithDatabase

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

#### Create the app

```
mix phx.new with_database --no-webpack --no-gettext --no-dashboard
```

#### Initialize release

```
mix release.init
```

#### Build and run the image (without database to see errors)

```
docker build -t stone/with_database -f Dockerfile .

docker run --env DATABASE_URL=pgsql://postgres:postgres@localhost/with_database_dev --env DATABASE_SSL=false --env SECRET_KEY_BASE=vzzGohHerW48zQLOSFXsegdBh5GgGhcEsHyhYb+F4kfMBgmTrU6Gpud30k+7fRTb --network host stone/with_database
```

#### Startup the docker-compose environment

```
docker-compose up
```

#### Startup the docker-compose environment with only database

```
docker-compose -f docker-compose.db-only.yml up
```

**Starting up dev:**
```
iex -S mix phx.server
```

**Running tests:**
```
MIX_ENV=test mix ecto.create
mix test
```

**Shutting down:**
```
docker-compose down
```