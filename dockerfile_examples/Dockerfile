FROM hexpm/elixir:1.10.4-erlang-23.2.2-alpine-3.12.1

ENV HELLO=world

ARG NAME=felipe

ENV NAME=${NAME}

RUN echo "Hello ${NAME}"

ENTRYPOINT ["elixir"]

CMD ["--eval", "IO.puts(\"Hello #{System.fetch_env!(\"NAME\")}, from Elixir\")"]
