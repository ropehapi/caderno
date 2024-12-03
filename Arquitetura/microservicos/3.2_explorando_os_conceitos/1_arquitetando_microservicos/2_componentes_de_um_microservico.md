# Aula: Componentes de um Microsserviço
![Alt text](/src/img/componentes-microservico.png)

## Introdução
- Microsserviços são discutidos de forma mais aprofundada, especialmente em termos de arquitetura.
- Exploraremos o que compõe um microsserviço, indo além das definições formais.

## Compreendendo um Microsserviço
- Um microsserviço é uma aplicação ou algo semelhante com acesso a dados, responsável pelo processamento desses dados.
- A questão central é: um microsserviço é um único processo em um único servidor?

## Componentes de um Microsserviço
- Exemplo: Uma API se comunica com um servidor de banco de dados, frequentemente em servidores diferentes.
- A separação pode ser estendida: replicação da aplicação, balanceamento de carga e replicação/particionamento do banco de dados.

## Réplicas e Particionamento
- Réplicas para escalabilidade e backup.
- Particionamento para otimizar operações de leitura e escrita.

## Tarefas Adicionais do Microsserviço
- Além da interface pública, um microsserviço pode realizar tarefas agendadas ou processar mensagens assincronamente.
- Exemplo: otimização de imagens, processamento de eventos.

## Complexidade dos Componentes
- Um microsserviço pode consistir em vários servidores: aplicação, banco de dados, tarefas agendadas, processador de mensagens.
- Conhecimentos em programação, bancos de dados, sistemas operacionais e mensageria são essenciais.

## Exemplo Prático: eShopOnContainers
- Uma aplicação de e-commerce fictícia usada para estudar microsserviços.
- Apresenta diversos microsserviços com diferentes tarefas e componentes.

## Conclusão
- Microsserviços envolvem uma combinação de habilidades em várias áreas.
- A compreensão dos componentes é crucial para projetar e implementar arquiteturas eficazes de microsserviços.
