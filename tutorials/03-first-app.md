# Principais comandos do docker:

Lista completa de comandos: https://docs.docker.com/engine/reference/commandline/docker/

## Comandos de Imagens

### Exibir as imagens baixadas na máquina

```sh
docker image list
```
### Para baixar uma nova imagem

```sh
docker pull [IMG]
```
> exemplo: hexpm/elixir:1.10.4-erlang-23.2.2-alpine-3.12.1

### Remover uma imagem

```sh
docker image rm [IMG]
docker rmi [IMG]
```

### Enviando imagem para o registry
```sh
docker image tag [IMG] host:port/path/IMG:version
docker push [new-tag]
```
> Usaremos pouco isso, dado que nossas imagens são construídas no CI

## Comandos de Container

### [ps](https://docs.docker.com/engine/reference/commandline/ps/)

```sh
docker ps
```
> -a para listar também os containers parados

### [start](https://docs.docker.com/engine/reference/commandline/start/)

```sh
docker start|stop|restart
```
> existem também o stop e restart

### [Build](https://docs.docker.com/engine/reference/commandline/build/)

```sh
docker build .
```
> -t para adicionar uma tag

### [Run](https://docs.docker.com/engine/reference/run/)

```sh
docker run [IMAGE]
```
> --env para passar variáveis
> -d para rodar "detached"
> -p expor portas

# Rodando o primeiro App

Entre na pasta `./no_database` e siga com as instruções do `README.md`.

 - faremos o build da imagem a partir do Dockerfile presente na pasta;
 - rodaremos a aplicação com o docker-run;
 - um "projeto base" de elixir + phoenix será iniciado em `http://127.0.0.1:4000`.

### Vantagens

- mesmas dependências em ambientes diferentes;
- facilidade de configuração do ambiente;
- modularização
