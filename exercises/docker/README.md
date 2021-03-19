# Projeto de exemplo 1
## Servidor Python e Django

Existe um framework web para python chamado Django, assim como Phoenix existe para Elixir.

A fim de ter um exercício diferente do exemplo dado anteriormente, para este projeto será utilizado python.

Você precisa, então:

- Começar com uma image base de python (`python:3.7.10-alpine3.12`);
- Instalar a biblioteca do Django usando pip (`pip3 install django`);
- Copiar o arquivo `manage.py` e a pasta `sample_server`;
- Expor a porta `8000`;
- Rodar o comando `python3 manage.py runserver` para iniciar a aplicação.

A fim de padronizar a execução, precisaremos dos comandos de build e run:

```
docker build -t stone/sample_server -f Dockerfile .

docker run --network host stone/sample_server
```

Acessar a aplicação em `http://localhost:8000/`.

> Apenas um comentário adicional, para o projeto de elixir foi usado um passo para compilar a aplicação e gerar um release, enquanto neste de Python, foi rodado como no ambiente de desenvolvimento para simplificar os passos. A referência pode ser encontrada em https://docs.djangoproject.com/en/3.1/howto/deployment/.