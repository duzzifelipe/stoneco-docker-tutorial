# Comandos Docker CLI importantes

 - Fazer build de um Dockerfile
   ```sh
   docker build -f Dockerfile -t tag_name .
   ```
   > -f especifica o nome, sendo que o padrão é Dockerfile
   > -t adiciona uma tag na imagem (pode-se comparar um uma versão da imagem)
   > o ponto no final refere-se ao path do contexto do build

 - Rodar uma imagem
   ```sh
   docker run [--env ENV_VAR_NAME=value] [--name nome_do_container] imagem:tag
   ```
   > opções entre colchetes não são obrigatórias

 - Rodar uma imagem em background
   ```sh
   docker run imagem:tag -d
   ```
   > -d faz rodar em background (detached)

 - Listar imagens/containers
   ```sh
   docker images
   docker image list

   docker ps [-a]
   ```
   > -a lista todas as instâncias, inclusive as paradas

 - Iniciar/Parar/Reiniciar container
   ```sh
   docker start {id do container}
   docker stop {id do container}
   docker restart {id do container}
   docker rm {id do container}
   ```

 - Executar comando em um container rodando
   ```sh
   docker exec -it {id do container} comando
   ```
   > -it roda o comando de forma iterativa ("linkado" no terminal do host)

# Comandos docker-compose importantes

 - Levantar ambiente
   ```
   docker-compose up
   ```

 - Levantar ambiente em background
   ```
   docker-compose up -d
   ```
   > -d faz rodar em background (detached)

 - Parar ambiente
   ```
   docker-compose down
   ```

 - Levantar somente um serviço
   ```
   docker-compose up {nome_do_servico}
   ```

 - Atualizar um container/imagem
   ```
   docker-compose build {nome_do_servico}
   docker-compose up --force-recreate --no-deps -d {nome_do_servico}

   ou

   docker-compose up --build --force-recreate
   ```
   > o --build no up vai reconstruir todos os serviços que façam build pelo docker-compose

# Sintaxe importante Dockerfile

  - FROM: especifica a imagem base e tag para construirmos a nova imagem no Dockerfile;

  - ENV: define variáveis de ambiente no container;

  - ARG: recebe valores no build através de `--build-arg key=value`;

  - WORKDIR: cria e entra em uma path que será a base para os próximos comandos;

  - COPY: adiciona arquivos de uma pasta do host em uma pasta do container;

  - ADD: similar ao copy, mas ainda permite baixar de url e extrair arquivos tar;

  - RUN: roda um comando no shell do container;

  - ENTRYPOINT: comando executado ao iniciar o container (não executa no build);

  - CMD: argumentos que são passados para o `ENTRYPOINT`. Usamos como comando para iniciar a aplicação.

# Sintaxe importante docker-compose.yml

  - Service fazendo build de um dockerfile:
    ```yaml
    services:
      nome_do_servico:
        build: ./
    ```
    > build é o path do contexto

  - Service usando uma imagem existente:
    ```yaml
    services:
      nome_do_servico:
        image: image:tag
    ```

  - Service com variáveis de ambiente:
    ```yaml
    services:
      nome_do_servico:
        environment:
          KEY: value
    ```