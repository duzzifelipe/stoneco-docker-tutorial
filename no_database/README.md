# NoDatabase

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Commands used

#### Create the app

```
mix phx.new no_database --no-webpack --no-ecto --no-gettext --no-dashboard
```

#### Initialize release

```
mix release.init
```

#### Build and run the image

```
docker build -t stone/no_database -f Dockerfile .

docker run --env SECRET_KEY_BASE=vzzGohHerW48zQLOSFXsegdBh5GgGhcEsHyhYb+F4kfMBgmTrU6Gpud30k+7fRTb --network host stone/no_database
```