# Escrevendo o Docker Compose

Lista completa de comandos: https://docs.docker.com/compose/compose-file/compose-file-v3/

```yaml
version: "3" -- especifica a versão da sintaxe do dockerfile
services: -- lista dos "apps" que serão configurados
  webapp: -- nome de um app
    build: ./dir -- ao usar build, referencia um path com Dockerfile (é possivel substituir por context + dockerfile)
    args: -- argumentos do build
      - key=value
    network: host|custom_name
  database:
    image: postgres:11.9-alpine -- em vez de dar build em uma imagem docker, vamos rodar uma imagem pronta
    ports:
      - 5432:5432
    volumes:
      - vol_name:/guest/path
    environment: -- variáveis de ambiente para 
      KEY: value
```