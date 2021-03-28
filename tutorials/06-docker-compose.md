# Docker Compose

#### O que é

- Ferramenta para definir e rodar aplicações que necessitem de mais de um container Docker.

- É escrito um arquivo no formato YAML para configurar (https://www.json2yaml.com/).

- Embora não usamos em produção/homolog, na documentação é indicado para todos os ambientes, inclusive CI.

- O arquivo do docker compose nos dá uma maneira de documentar e configurar todas as dependências, como banco de dados, serviço de fila, cache e etc.

Lista completa de comandos: https://docs.docker.com/compose/reference/

### Subir o ambiente

```sh
docker-compose up
```
> -d para rodar em background
> -f para especificar arquivo

### Atualizar o ambiente

Algumas vezes podemos alterar o nosso projeto e, caso esteja iniciando com Docker, não vai atualizar sozinho - dado que está compilado.
Precisamos rodar o fluxo de build de novo e fazer recreate no container.

```sh
docker-compose build with_database_application
```
> aceita opção --no-cache

```sh
docker-compose up --force-recreate --no-deps -d with_database_application
```

### Desligar

```sh
docker-compose down
```

# Rodando o app
 - Tentar fazer build e rodar, assim como no primeiro app;
 - Subir o docker compose com a aplicação inteira;
 - Rodar criação do banco e migração manualmente com um exec/run:
   - `docker-compose run with_database_application /app/bin/with_database eval "WithDatabase.ReleaseTask.create_database()"`
   - `docker-compose run with_database_application /app/bin/with_database eval "WithDatabase.ReleaseTask.migrate()"`
 - Exemplo com recreate;
 - Subir o docker compose somente com o banco de dados (`docker-compose up with_database_postgres`);
 - Configurar volume para ler um arquivo do host (./custom_folder);
   - rodar o segundo dockerfile
   - `docker-compose exec with_database_application /app/bin/with_database eval "\"/tmp/custom_folder/file.txt\" |> File.read!() |> IO.puts()"`
   - rodar o mesmo comando na aplicação sem mount
 - Criar uma network separada;


### Usando o comando de scale (desde que não esteja em host)
  - `docker-compose -f docker-compose-net.yml up`
  - `docker-compose -f docker-compose-net.yml scale with_database_application=2`


### Drivers de network (https://docs.docker.com/network/#network-drivers)