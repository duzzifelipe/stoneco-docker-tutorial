## Comandos para lidar diretamente com a imagem

Na sequência de comandos deste arquivo, vamos baixar a versão mais recente do debian e rodar alguns comandos dentro de um container criado com ela.

Ao final, faremos um commit do container para uma tag "customized" do debian, para, por último exportar a imagem dessa tag para um arquivo tar.


```sh
docker pull debian:latest
```

```sh
docker run --name deb_test -it debian:latest
```

```sh
docker ps -a
```

```sh
docker start deb_test
```

```sh
docker exec -it deb_test /bin/bash
```

```sh
apt-get update
```

```sh
apt-get install htop
```

```sh
docker container stop deb_test
```

```
docker commit deb_test debian:customized
```

```
docker image save debian:customized -o file.tar
```