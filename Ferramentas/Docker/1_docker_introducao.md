# **Docker**
## **O que é?**
Docker é um software que reduz a complexidade de setup de aplicações, onde configuramos containers, que são como servidores para rodar nossas aplicações.

Com facilidade, podemos criar mabientes independentes e que funcionam em diversos SO's, e ainda deixa os projetos performáticos.

## **Por que Docker?**
- O Docker proporciona mais velocidade na configuração do ambiente de um dev.
- Pouco tempo gasto em manutenção, containers são executados como configurados.
- Performance para executar aplicação, mais performático que uma VM.
- Nos livra da Matrix from Hell, ou seja, a aplicação sempre vai rodar no mesmo ambiente, seja em produção, seja na máquina de um dev, seja na máquina do outro dev.

### **Containers x VMs**
- Container é uma aplicação que serve para um determinado fim, não possui sistema operacional, seu tamanho é de alguns mbs.
- VM possui sistema operacional próprio, tamanho de gbs, pode executar diversas funções ao mesmo tempo.
- Containers acabam gastando menos recursos para serem executados, por causa do seu uso específico.
- VMs gastam mais recursos, porém podem exercer mais funções.

## **Instalando o Docker**
A instalação do Docker nunca foi flor que se cheire. Dessa maneira, optei por deixar aqui o link para o tutorial de como instalar o Docker no [Linux](https://docs.docker.com/desktop/install/ubuntu/) e no [Windows](https://docs.docker.com/desktop/install/windows-install/).

---
## **Containers**
O que é um container? Um container é um pacote de código  que pode executar uma ação, por exemplo: rodar uma aplicação Node.Js, PHP, Python etc, ou seja, nossos projetos serão executados dentro dos containers que criarmos/utilizarmos.

Containers utilizam imagens para poderem ser executados. Múltiplos containers podem rodar juntos, como por exemplo um rodando para PHP e um para MySQL.

### **Containers x Imagens**
Imagem e container são recursos fundamentais do Docker, uma imagem é o "projeto" que será executado pelo container, todas as instruções estarão declaradas nela. Um container é o Docker rodando alguma imagem, consequentemente executando algum código proposto por ela. Assim sendo, o fluxo é: programamos uma imagem e a executamos por meio de um container.

### **Onde encontrar imagens?**
Vamos encontrar imagens no [repositório do Docker](https://hub.docker.com). Neste site podemos verificar quais as imagens existem da tecnologia que estamos procurando, como por exemplo PHP.

### **Rodando um container**
Podemos executar uma imagem em um container com o comando abaixo por exemplo
> docker run ubuntu

### **Rodando um container de modo interativo**
Podemos querer poder interagir com o nosso container durante sua execução, para isso, basta que executemos nosso container seguido da flag `-it`, que nos trás um terminal integrado para que possamos interagir com o container:
> docker run node -it

### **Rodando um container em background**
Quando iniciamos um container que persiste (apache por exemplo), ele fica ocupando o terminal. Podemos executar em background, para não precisar ficar com diversas abas de terminal aberto, utilizamos a flag `-d` (detached).
> docker run nginx -d

### **Verificar containers executados**
Podemos utilizar os comandos abaixo para exibir quais containers estão sendo executados no momento. Ambos fazem a mesma coisa.

Utilizando a flag `-a`, temos também todos os containers já executados na máquina, este comando é útil para entender o que está sendo executado e acontece no nosso ambiente.
> docker ps -a

> docker container ls

### **Expondo portas**
Os containers docker não tem conexão com nada de fora deles. Por isso precisamos expor portas, a flag é a `-p`, e podemos fazer assim: `-p 80:80` (onde o primeiro valor é a porta que queremos expor para o nosso computador, e o segundo é a porta do container), desta maneira, o container estará acessível na porta 80.
> docker run -d -p 80:80 nginx

### **Parando um container**
Podemos parar um container com o comando `docker stop <id/name>`, id esse que pode ser consultado através do `docker ps`
> docker stop abcdefg

### **Reiniciando um container**
Aprendemos já a parar um container com o stop, para voltar a rodar um container podemos usar o comando `docker start <id/name>`, tendo em vista que rodar o `run` criará um novo container (Dessa maneira, caso seja necessário aproveitar um antigo, opte pelo start).
> docker start abcdefg

### **Definindo o nome do container**
Podemos definir um nome do container com a flag `--name`. Se não colocamos, recebemos um nome aleatório, o que pode ser um problema para uma aplicação mais profissional.
> docker run -d -p 3306:3306 --name mysql mysql

### **Verificando os logs**
Podemos verificar o que aconteceu em um container com o comando logs, utilizando-o da seguinte maneira:
> docker logs \<id/name>

### **Removendo containers**
Podemos remover um container da máquina que estamos executando o Docker, o comando é o `docker -rm <id>`.

Se o container estiver rodando ainda, podemos utilizar a flag `-f` (force).
> docker -rm mysql

---
## **Imagens**
Imagens são originadas de arquivos que programamos para que o Docker crie uma estrutura que execute determinadas ações em containers. Elas contém informações como: imagem base, diretorio base, comandos a serem executados, porta da aplicação etc.

Ao rodar um container baseado na imagem, as instruções serão executadas em camadas.

### **Escolhendo uma imagem**
Podemos fazer download das imagens no [Hub do Docker](https://hub.docker.com)

Porém, qualquer um pode fazer upload de uma imagem, o que é um problema. Dessa maneira, devemos então nos atentar às imagens oficiais. Outra parâmetro interessante, é a quantidade de downloads e de stars.

### **Criando uma imagem**
Para criar uma imagem vamos precisar de um arquivo Dockerfile em uma pasta que ficará o projeto. Esse arquivo vai precisar de algumas instruções para poder ser executado.

- FROM: Imagem base
- WORKDIR: Diretório da aplicação
- EXPOSE: Porta da aplicação
- COPY: Quais arquivos precisam ser copiados

No Dockerfile:

    FROM node

    WORKDIR /app

    COPY package*.json .

    RUN npm install

    COPY . .

    EXPOSE 3000

    CMD ["node", "app.js"]

### **Executando uma imagem**
Para executar a imagem primeiramente vamos precisar fazer o build, com o comando `docker build <diretorio da imagem>`, e depois, rodar o `docker run <imagem>` para executa-la.
>docker build \<diretorio imagem>

>docker run \<imagem>


### **Alterando uma imagem**
Sempre que alteramos o código de uma imagem vamos precisar fazer o build novamente, pois para o Docker, é como se fosse uma imagem completamente nova.

### **Camadas das imagens**
As imagens Docker são divididas em camadas.

Cada instrução no Dockerfile representa uma layer. Quando algo é atualizado, apenas as layers depois da linha atualizada são refeitas, o resto permanece em cache, tornando o build mais rápido.

### **Download de imagens**
Podemos fazer o download de alguma imagem do hub e deixa-la disponível em nosso ambiente. Para isso, usamos o comando `docker pull <imagem>`.
>docker pull python

Desta maneira, caso se use em outro container, a imagem já estará pronta para ser utilizada.

### **Nomeando imagem e tag**
Podemos nomear a imagem que criamos através do comando `docker tag <id> <nome>`.

Também podemos modificar a tag, que seria como uma versãoda imagem, semelhante ao GIT.

Para inserir a tag utilizamos `docker tag <id> <nome>:<tag>`.

### **Iniciando imagem com um nome**
Podemos nomear a iamgem já na sua criação. Para isso, utilizaremos a flag `-t`. É possível inserir o nome e a tag, na sintaxe `nome:tag`, o que torna o processo de nomeação mais simples.

### **Comando start interativo**
A flag `-it` pode ser utilizada com o comando start também. Ou seja, não precisamos criar um novo container para utiliza-lo no terminal.

Esse comando é o `docker start -it <container>`
>docker start -it \<container>

### **Removendo imagens**
Assim como nos container, podemos remover imagens com um comando, o `docker rmi <imagem>`.

Imagens que estiverem sendo utilizadas por um container, podem apresentar erro no terminal. Dessa maneira, podemos utilizar a flag `-f` para forçar a remoção.
>docker rmi \<imagem>

### **Removendo imagens e containers inutilizados**
Com o comando `docker system prune`, podemos remover imagens, containers e networks não utilizados.
>docker system prune