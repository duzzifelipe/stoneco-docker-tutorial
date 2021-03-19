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

docker run --network host stone/node_db
```

Acessar a aplicação em `http://localhost:1337/`.