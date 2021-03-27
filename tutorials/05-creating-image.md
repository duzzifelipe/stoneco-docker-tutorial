# Criando uma própria imagem

Lista completa de comandos: https://docs.docker.com/engine/reference/builder/

Os principais comandos usados:

### FROM

Imagem base

```dockerfile
FROM ubuntu:latest
```

### ENV

Variáveis de ambiente para o container.

```dockerfile
ENV key=value
```

Também é possível passar env vars em runtime com `docker run --env KEY=value`.

### ARG

Parâmetros para receber no build através de `--build-arg key=value`

```dockerfile
ARG key=default_value
```

### WORKDIR

Define o diretório atual para os próximos comandos (run, cmd, entrypoint, copy e add)

```dockerfile
WORKDIR /home
```
> se não existir, será criado automaticamente

### COPY

Copia arquivo/pasta da origem para o destino. É possível user fileMatch do Go (hom?.txt, *.txt ...). Usamos para copiar o 

```dockerfile
COPY [--chown=user:group] src dest
```

### ADD

Igual ao COPY, mas permite copiar, além de arquivo e pasta, URLS e arquivos tar (que são extraídos)

```dockerfile
ADD [--chown=user:group] src dest
```

### RUN

Roda um comando no container, como, por exemplo, para adicionar pacotes

```dockerfile
RUN apk add -U --no-cache git 
```

### EXPOSE

Define a porta do container que será aberta ao rodar:

```dockerfile
EXPOSE 4000
```

### ENTRYPOINT

Comando que executará por padrão ao iniciar o container (o padrão é /bin/sh -c)

### CMD

São os argumentos passados para o entrypoint em forma de lista. Basicamente, se o entrypoint não for definido, esse é o comando que será executado (ex: `/bin/sh -c ls`)

```dockerfile
CMD ["/app/bin/app", "start"]
```
