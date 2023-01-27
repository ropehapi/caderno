# **Docker**
## **O que é?**
Docker é um software que reduz a complexidade de setup de aplicações, onde configuramos containers, que são como servidores para rodar nossas aplicações.

Com facilidade, podemos criar mabientes independentes e que funcionam em diversos SO's, e ainda deixa os projetos performáticos.

## **Por que Docker?**
- O Docker proporciona mais velocidade na configuração do ambiente de um dev.
- Pouco tempo gasto em manutenção, containers são executados como configurados.
- Performance para executar aplicação, mais performático que uma VM.
- Nos livra da Matrix from Hell, ou seja, a aplicação sempre vai rodar no mesmo ambiente, seja em produção, seja na máquina de um dev, seja na máquina do outro dev.

## **Instalando o Docker**
A instalação do Docker nunca foi flor que se cheire. Dessa maneira, optei por deixar aqui o link para o tutorial de como instalar o Docker no [Linux](https://docs.docker.com/desktop/install/ubuntu/) e no [Windows](https://docs.docker.com/desktop/install/windows-install/).

## **Containers**
O que é um container? Um container é um pacote de código  que pode executar uma ação, por exemplo: rodar uma aplicação Node.Js, PHP, Python etc, ou seja, nossos projetos serão executados dentro dos containers que criarmos/utilizarmos.

Containers utilizam imagens para poderem ser executados. Múltiplos containers podem rodar juntos, como por exemplo um rodando para PHP e um para MySQL.

### **Containers x Imagens**
Imagem e container são recursos fundamentais do Docker, uma imagem é o "projeto" que será executado pelo container, todas as instruções estarão declaradas nela. Um container é o Docker rodando alguma imagem, consequentemente executando algum código proposto por ela. Assim sendo, o fluxo é: programamos uma imagem e a executamos por meio de um container.

### **Onde encontrar imagens?**
Vamos encontrar imagens no [repositório do Docker](https://hub.docker.com). Neste site podemos verificar quais as imagens existem da tecnologia que estamos procurando, como por exemplo PHP.

### **Rodando um container**
Podemos executar uma imagem em um container com o comando abaixo por exemplo seguido da flag -it, que nos trás um terminal integrado para que possamos interagir com o container:
> docker run ubuntu -it

### **Verificar containers executados**
Podemos utilizar os comandos abaixo para exibir quais containers estão sendo executados no momento. Ambos fazem a mesma coisa.

Utilizando a flag `-a`, temos também todos os containers já executados na máquina, este comando é útil para entender o que está sendo executado e acontece no nosso ambiente.
> docker ps -a

> docker container ls
