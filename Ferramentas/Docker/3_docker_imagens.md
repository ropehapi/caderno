# **Imagens**
Imagens são originadas de arquivos que programamos para que o Docker crie uma estrutura que execute determinadas ações em containers. Elas contém informações como: imagem base, diretorio base, comandos a serem executados, porta da aplicação etc.

Ao rodar um container baseado na imagem, as instruções serão executadas em camadas.

## **Escolhendo uma imagem**
Podemos fazer download das imagens no [Hub do Docker](https://hub.docker.com)

Porém, qualquer um pode fazer upload de uma imagem, o que é um problema. Dessa maneira, devemos então nos atentar às imagens oficiais. Outra parâmetro interessante, é a quantidade de downloads e de stars.

## **Criando uma imagem**
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

## **Executando uma imagem**
Para executar a imagem primeiramente vamos precisar fazer o build, com o comando `docker build <diretorio da imagem>`, e depois, rodar o `docker run <imagem>` para executa-la.
>docker build \<diretorio imagem>

>docker run \<imagem>


## **Alterando uma imagem**
Sempre que alteramos o código de uma imagem vamos precisar fazer o build novamente, pois para o Docker, é como se fosse uma imagem completamente nova.

## **Camadas das imagens**
As imagens Docker são divididas em camadas.

Cada instrução no Dockerfile representa uma layer. Quando algo é atualizado, apenas as layers depois da linha atualizada são refeitas, o resto permanece em cache, tornando o build mais rápido.

## **Download de imagens**
Podemos fazer o download de alguma imagem do hub e deixa-la disponível em nosso ambiente. Para isso, usamos o comando `docker pull <imagem>`.
>docker pull python

Desta maneira, caso se use em outro container, a imagem já estará pronta para ser utilizada.

## **Nomeando imagem e tag**
Podemos nomear a imagem que criamos através do comando `docker tag <id> <nome>`.

Também podemos modificar a tag, que seria como uma versãoda imagem, semelhante ao GIT.

Para inserir a tag utilizamos `docker tag <id> <nome>:<tag>`.

## **Iniciando imagem com um nome**
Podemos nomear a iamgem já na sua criação. Para isso, utilizaremos a flag `-t`. É possível inserir o nome e a tag, na sintaxe `nome:tag`, o que torna o processo de nomeação mais simples.

## **Comando start interativo**
A flag `-it` pode ser utilizada com o comando start também. Ou seja, não precisamos criar um novo container para utiliza-lo no terminal.

Esse comando é o `docker start -it <container>`
>docker start -it \<container>

## **Removendo imagens**
Assim como nos container, podemos remover imagens com um comando, o `docker rmi <imagem>`.

Imagens que estiverem sendo utilizadas por um container, podem apresentar erro no terminal. Dessa maneira, podemos utilizar a flag `-f` para forçar a remoção.
>docker rmi \<imagem>

## **Removendo imagens e containers inutilizados**
Com o comando `docker system prune`, podemos remover imagens, containers e networks não utilizados.
>docker system prune

## **Removendo containers após utilização**
Um container pode ser automáticamente deletado após sua utilização. Para isso, usamos a flag `--rm`.
>docker run --rm \<container>

Desta maneira economizamos espaço no computador e deixamos o ambiente mais organizado.

## **Copiando arquivos entre containers**
Para cópia de arquivos entre containers utilizamos o comando `docker cp`, que pode ser utilizado para copiar um arquivo de um diretório para um container, ou de um container para um diretório determinado.
>docker cp node:/src/app.js ./copia

No comando acima, primeiro definimos o nome do container, seguido de : o nome do diretório `a copiar`, e o nome do diretório `para onde` queremos copiar.

## **Verificar informações de processamento**
Para verificar dados de execução de um container utilizamos o `docker top <container>`. Desta maneira, temos acesso a quando ele foi iniciado, id do processo, descrição do comando CMD entre outros.

## **Inspecionando container**
Para verificar diversas informações como id, data de criação, imagem e muito mais, usamos o comando `docker inspect <container>`. Desa maneira, conseguimos entender como o container está configurado

## **Verificando processamento o Docker**
Para verigicar os processos que estão sendo executados em um container, utilizamos o comando `docker stats`, dessa maneira, temos acesso ao andamento do processo e memória gasto pelo mesmo.

