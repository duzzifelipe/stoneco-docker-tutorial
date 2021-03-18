# Rodando o primeiro App

Comandos principais do docker:

## Comandos de Imagens

### Exibir as imagens baixadas na máquina
```
docker image list
```

### Para baixar uma nova imagem
```
docker pull [IMG]
```
> exemplo: hexpm/elixir:1.10.4-erlang-23.2.2-alpine-3.12.1

### Remover uma imagem
```
docker image rm [IMG]
docker rmi [IMG]
```

### Enviando imagem para o registry
```
docker image tag [IMG] host:port/path/IMG:version
docker push [new-tag]
```
> Usaremos pouco isso, dado que nossas imagens são construídas no CI

## Comandos de Container

### [ps](https://docs.docker.com/engine/reference/commandline/ps/)

```
docker ps
```
> -a para listar também os containers parados


### [start](https://docs.docker.com/engine/reference/commandline/start/)

```
docker start|stop|restart
```
> existem também o stop e restart

### [Build](https://docs.docker.com/engine/reference/commandline/build/)

```
docker build .
```
> -t para adicionar uma tag


### [Run](https://docs.docker.com/engine/reference/run/)

```
docker run [IMAGE]
```
> --env para passar variáveis
> -d para rodar "detached"
> -p expor portas


# Vantagens

- mesmas dependências em ambientes diferentes;
- facilidade de configuração do ambiente;
- modularização