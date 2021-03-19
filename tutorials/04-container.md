# O que é um container
 - É diferente de uma VM, que tem SO completo e depende de um hypervisor;
 - Ambiente isolado que permite fazer limitações de recursos;
  - O host "entra em contato" com as bibliotecas
- 

# O que é uma imagem
 - Formada por várias camadas (a cada instrução do Dockerfile), permitindo reutilização;
 - É possível criar uma imagem através de instruções no Dockerfile ou baixando, alterando e fazendo `docker commit [container] [tag]`

# Docker Registry

Após gerar tag em imagem, é feito push para um registry e a mesma fica pública ou privada para o dono.

Existe o Docker Hub (oficial da empresa Docker) e os 3rd-party.

- https://hub.docker.com/
- https://aws.amazon.com/pt/ecr/
- https://cloud.google.com/container-registry
- https://azure.microsoft.com/pt-br/services/container-registry/