# Instalação do Docker

Primeiro, precisamos ver o codename da release do ubuntu. Cada release, além do número de versão, é acompanhada por um codename (https://wiki.ubuntu.com/Releases).

O codename normalmente é referenciado quando baixamos alguns pacotes com builds específicos por versão do SO.

```sh
lsb_release -a
```

> Curiosidade: O codename é criado com a junção de um adjetivo e um nome de animal com a mesma letra inicial.


Em seguida, devemos adicionar algumas bibliotecas para adicionar pacotes atráves de HTTP no APT:

```sh
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

Depois, baixar e adicionar a chave GPG

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Então adicionar o repositório às fontes do APT:

```sh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu CODENAME stable"
```

Em seguida, atualizar os pacotes com o novo repositório e garantir que usaremos a versão adicionada (e não a padrão do ubuntu):

```sh
sudo apt update
apt-cache policy docker-ce
```

Agora sim, instalar o Docker:

```sh
sudo apt install docker-ce
```

Por padrão, os comandos do Docker ficam limitados ao root e ao grupo "docker". É necessário, então, adicionar o seu usuário ao grupo do docker para conseguir usar sem `sudo`:

```sh
sudo usermod -aG docker ${USER}
```

Teste que foi instalado corretamente:

```sh
docker --version
```

# Instalação do Docker Compose

A instalação do docker-compose, por sua vez, não vai necessitar de todos os passos que fizemos para adicionar a chave e repositório. Vamos simplesmente baixar o script e mover para a pasta bin.

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
> Há duas referências a função `uname` para especificar que usamos um Linux x86_64

Adicionar a permissão para executar o arquivo:

```sh
sudo chmod +x /usr/local/bin/docker-compose
```

E por último, criar um link simbólico para a bin do seu usuário:

```sh
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

Teste que foi instalado corretamente:

```sh
docker-compose --version
```