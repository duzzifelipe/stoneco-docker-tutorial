# Projeto de exemplo 2
## Servidor Node e Sails com banco de dados

Assim como Django para Python e Phoenix para Elixir, existe o Sails para Node.js.

Desta vez, para configurar seu Dockerfile, você precisa:

- começar com uma imagem do node js (`node:12.21-alpine3.12`);
- copiar a aplicação para a raiz do container;
- expor a porta `1337`;
- executar o comando `npm start`.

Para validar a construção da imagem, você pode fazer o build e rodar, como anteriormente:

```
docker build -t stone/node_db -f Dockerfile .

docker run --env sails_datastores__default__url=mysql://mysql:mysql@node_db_mysql:3306/node_db_dev --network host stone/node_db
```

Acessar a aplicação em `http://localhost:1337/` (você verá um erro 500, porque a query falhou).


### Levantando o docker-compose

Criar um arquivo docker-compose com os seguintes aspectos:

- um service que usa a imagem `mysql:8.0`
 - expor a porta 3306
 - definir as variáveis `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE` e `MYSQL_ROOT_PASSWORD` (não vamos usar mas é obrigatório);
 - defina o attributo `command` com o valor `--default-authentication-plugin=mysql_native_password`. Isso evita um bug na conexão a partir da aplicação.
- um seguindo service que faz build do Dockerfile
 - expor a porta 1337
 - definir variável de ambiente com `sails_datastores__default__url=mysql://[MYSQL_USER]:[MYSQL_PASSWORD]@[nome-do-servico-do-banco]:3306/[MYSQL_DATABASE]`

 Após isso, subir a aplicação com:

 ```sh
 docker-compose up
 ```