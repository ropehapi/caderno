# **Docker**
## **O que é?**
Docker é um software que reduz a complexidade de setup de aplicações, onde configuramos containers, que são como servidores para rodar nossas aplicações.

Com facilidade, podemos criar mabientes independentes e que funcionam em diversos SO's, e ainda deixa os projetos performáticos.

### Por debaixo dos panos...
O docker é um host que monta um pacote de soluções em cima de conteiners e virtualização como o cache de images registry, network entre os conteiners e volumes para persistência de dados, disponibilizando tudo isso através do docker client, que é a interface pela qual o usuario interage com o docker (daemon API em vermelho na imagem abaixo).

![alt text](/src/img/docker-debaixo-dos-panos.png)

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
A instalação do Docker nunca foi flor que se cheire. Dessa maneira, optei por deixar aqui o link para o tutorial de como instalar o Docker no [Linux](https://docs.docker.com/desktop/install/ubuntu/) e no [Windows](https://docs.docker.com/desktop/install/windows-install/).jj