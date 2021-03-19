# Docker Compose

Lista completa de comandos: https://docs.docker.com/compose/reference/

### Subir o ambiente

```
docker-compose up
```
> -d para rodar em background
> -f para especificar arquivo

### Atualizar o ambiente

Algumas vezes podemos alterar o nosso projeto e, caso esteja iniciando com Docker, não vai atualizar sozinho - dado que está compilado.
Precisamos rodar o fluxo de build de novo e fazer recreate no container.

```
docker-compose build with_database_application
```
> aceita opção --no-cache

```
docker-compose up --force-recreate --no-deps -d with_database_application
```

### Desligar

```d
docker-compose down
```

# Rodando o app
 - Tentar fazer build e rodar, assim como no primeiro app;
 - Subir o docker compose com a aplicação inteira;
 - Exemplo com recreate;
 - Subir o docker compose somente com o banco de dados.
