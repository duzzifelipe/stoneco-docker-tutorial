# ---------------------------------------------------------
# Build Release
# ---------------------------------------------------------
FROM hexpm/elixir:1.10.4-erlang-23.2.2-alpine-3.12.1 as build

ENV MIX_ENV=prod

RUN apk add -U --no-cache git bash openssh-client build-base gcc tzdata ca-certificates

ARG PUID=1000
ARG PGID=1000
ARG HOME="/app"

RUN addgroup -g ${PGID} example && \
    adduser -S -h ${HOME} -G example -u ${PUID} example

USER example

RUN mkdir -p ${HOME}/src
WORKDIR ${HOME}/src

COPY --chown=example:example mix.exs mix.lock ${HOME}/src/
COPY --chown=example:example config/ ${HOME}/src/config

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix deps.get && \
    mix deps.compile

COPY --chown=example:example priv/static/ ${HOME}/priv/static

COPY --chown=example:example lib/ ${HOME}/src/lib
COPY --chown=example:example priv/ ${HOME}/src/priv

RUN mix compile && \
    mix phx.digest && \
    mix release

# ---------------------------------------------------------
# Run Release
# ---------------------------------------------------------
FROM alpine:3.12.0

ARG PUID=1000
ARG PGID=1000
ARG HOME="/app"
ARG PORT=4000

RUN apk add -U --no-cache bash openssl tzdata

RUN addgroup -g ${PGID} example && \
    adduser -S -h ${HOME} -G example -u ${PUID} example

COPY --from=build --chown=example:example /app/src/_build/prod/rel/no_database /app/.

EXPOSE ${PORT}

USER example

ENV MIX_ENV=prod

CMD ["/app/bin/no_database", "start"]
