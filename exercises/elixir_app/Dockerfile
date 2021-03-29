# sair da imagem hexpm/elixir:1.10.4-erlang-23.2.2-alpine-3.12.1
# copiar lib, priv, mix.exs, mix.lock, config
# rodar "mix local.hex --force" e "mix local.rebar --force"
# rodar "mix deps.get", "mix deps.compile", "mix compile"
# por ultimo, o comando a executar é "mix phx.server"

FROM hexpm/elixir:1.10.4-erlang-23.2.2-alpine-3.12.1

WORKDIR /app

COPY ./mix.exs ./mix.lock ./
COPY lib/ lib/
COPY priv/ priv/
COPY config/ config/

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix deps.compile && \
    mix compile

CMD ["mix", "phx.server"]
