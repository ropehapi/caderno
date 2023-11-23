# Componentes de um microserviço
![Alt text](/src/img/componentes-microservico.png)
E aí, pessoal! Bem-vindos de volta! Então vamos nos aprofundar neste assunto de microsserviços. Vamos bater um papo sobre microsserviços de forma um pouco mais aprofundada do que o que conversamos nos padrões de microsserviços.

Então, vamos lá! Nós já sabemos o que é um microsserviço, mas neste capítulo nós vamos começar a falar sobre como arquitetar microsserviços. Então vamos conversar um pouco sobre esse processo de arquitetar microsserviços - e como eu comentei, nós já sabemos o que é um microsserviço.

Nós sabemos que um microsserviço é alguma aplicação ou algo parecido com uma aplicação que tenha acesso a determinados dados. É um serviço pequeno que se comunica com outros etc.

Sem falarmos de definições formais aqui, só que pensando nessa definição de um microsserviço, o que compõe? O que eu preciso ter dentro de um único microsserviço para que ele seja realmente funcional, usual e utilizável? Então, vamos conversar sobre o que compõe um microsserviço, o que um microsserviço tem dentro dele.

Nós sabemos que um microsserviço é dono de determinados dados e ele é responsável pelo processamento desses dados ou informações. Então o questionamento é: será que um microsserviço pode ser visto como um único processo rodando em único servidor?

Essa terminologia de processo é bastante conhecida por quem já testou os The Twelve Factor App, a metodologia de aplicação de doze fatores. Mas assim, sem pensarmos muito nesse conceito também, um microsserviço é uma única aplicação rodando em um servidor só? Será que isso já compõe um microsserviço?

Vamos pegar um exemplo partindo do mais simples e indo incrementando um pouco devagar. Então nós temos uma aplicação, e essa aplicação precisa se comunicar com algum banco de dados. É comum que microsserviços acessem dados. Então nós já começamos tendo mais do que um único processo, uma única aplicação.

A nossa API, vamos chamar assim, a nossa aplicação principal, precisa se comunicar com um servidor de banco de dados - e via de regra, esses dois já estão em servidores diferentes.

Imagem de título "Componentes de um microsserviços" com uma área retangular delimitada por linha tracejada abaixo, a qual contém a legenda "Microservice" no topo, e abaixo no canto esquerdo há um quadrado de legenda "Code" com o escrito "API" acima de duas setas em sentidos opostos. Este quadrado possui uma seta que aponta para baixo no sentido de uma figura de um cilindro de legenda "Database".

Então deixe-me pegar aqui o apontador. Eu tenho o meu código em um servidor e o meu banco de dados em outro servidor. Até porque eles precisam ser otimizados para coisas diferentes.

Talvez o meu banco de dados precise de muita memória, já a minha aplicação precisa de mais processamento e não tanta RAM. Enfim, o meu servidor de banco de dados com certeza vai precisar de discos rígidos mais otimizados. Então nós separamos em servidores diferentes - mas não para por aqui, nós já temos dois servidores, mas isso ainda pode ser incrementado.

Imagem de título "Componentes de um microsserviços" com uma área retangular delimitada por linha tracejada abaixo, a qual contém a legenda "Microservice" no topo, e abaixo no canto esquerdo há uma sequência horizontal de três quadrados com o escrito "API" acima de duas setas em sentidos opostos. Estes quadrados possuem uma seta cada um, as quais apontam para baixo no sentido de uma figura de um cilindro.

Por exemplo: se eu precisar replicar minha aplicação. Imagine que este ponto de entrada do meu microsserviço, ou seja, a minha API, a minha interface com o mundo externo, receba muitas requisições.

Então, eu preciso dividir o trabalho em vários servidores, em várias máquinas, e isso vai ser controlado por um load balancer. De novo, fazendo analogia com os cursos que temos aqui na Alura, com Nginx nós podemos criar load balancers e distribuir a carga entre várias APIs.

Então, dessa forma, nós já temos aqui só nesse cenário simples quatro servidores dentro do mesmo microsserviço. Três servidores de aplicação, rodando a nossa API e um servidor de banco de dados, que vai conter os nossos dados.

Imagem de título "Componentes de um microsserviços" com uma área retangular delimitada por linha tracejada abaixo, a qual contém a legenda "Microservice" no topo, e abaixo no canto esquerdo há uma sequência horizontal de três quadrados com o escrito "API" acima de duas setas em sentidos opostos. Abaixo, há o texto "Particionamento ou réplicas", seguido de duas figuras de cilindros.

Mas e se eu também precisar replicar os meus bancos de dados? Ou fazer particionamento deles? E se eu precisar ter um banco de dados muito otimizado para escrita e outro muito otimizado para leitura? Talvez a minha aplicação tenha muita leitura, eu recupere muitos dados e não escreva tanto.

Então eu posso separar essas operações, ou simplesmente fazer réplicas mesmo para back-up etc., para manter a segurança. Então aqui eu já tenho cinco servidores: dois de banco de dados e três de aplicações.

Só que também não para por aí! O microsserviço pode realizar tarefas além do que a sua interface pública permite e além do que serviços externos podem solicitar para ele fazer.

Imagem de título "Componentes de um microsserviços" com uma área retangular delimitada por linha tracejada abaixo, a qual contém a legenda "Microservice" no topo, e abaixo no canto esquerdo há uma sequência horizontal de três quadrados com o escrito "API" acima de duas setas em sentidos opostos, e ao lado destes há a figura de um relógio com o texto "Tarefas agendadas". Abaixo, no canto esquerdo, há duas figuras de cilindros. Ao lado, do lado direito da área tracejada, há uma caixa de correio com o texto "Processador de mensagens". Fora da área, há um envelope que aponta com uma seta para a caixa de correio.

Ele pode ter, por exemplo, tarefas agendadas, um processamento. Imagine que no final de todos os dias você pega todas as imagens que foram enviadas e faz uma otimização nelas - que é um processo demorado.

Ou acontece algum evento na sua aplicação e você precisa ter algum consumidor ou um processador de mensagens que vai pegar esse evento. Quando ele encontrar esse evento, que não precisa ser na hora que o evento aconteceu, ele vai pegar isso e fazer o processamento necessário.

Então existem vários componentes em um microsserviço. Só que neste nosso exemplo simples, nós temos sete servidores. Nós temos dois de banco de dados, nós temos três de aplicação, nós temos um de tarefas agendadas e um processador de mensagens. Então repare que muitas coisas podem compor um microsserviço.

É importante citar que microsserviços são muito mais que só programação, porque se você estuda aqui na Alura, você muito provavelmente já sabe criar APIs. Também tem cursos aqui para você gerenciar bancos de dados. Existem cursos para você trabalhar com sistemas operacionais, agendar tarefas, existem cursos de mensageria e de serviços de stream para você saber consumir esses dados e publicar esses dados.

E quando você trabalha com microsserviços, você une todos esses conhecimentos para aplicar em uma arquitetura um pouco mais complexa, que tem as vantagens e desvantagens que nós já falamos.

Então vamos dar uma olhada rápida em um exemplo da vida real. Essa aplicação, eShopOnContainers, é uma aplicação de e-commerce fictícia que está disponível na internet justamente para o estudo de microsserviços. Então eles disponibilizam essa imagem, essa arquitetura aqui. Isso é constantemente atualizado com novas tecnologias etc.

Então, aqui eles mostram tecnologias usadas principalmente em aplicações Microsoft, então tem .NET, tem o TypeScript, tem C#, enfim. Aqui nós temos diversos microsserviços fazendo tarefas diferentes.

O nosso microsserviço de pedidos tem uma API, ou seja, ele tem aqui um processo rodando a API - que pode ter, na verdade, vários servidores e nós não sabemos - e tem um outro processo, que são de tarefas de plano de fundo, algo que você não precisa executar na hora que seu microsserviço é chamado.

Então repare que esses dois se comunicam com o banco de dados, e esse banco de dados também pode estar replicado. Então, aqui nós já temos uma visão um pouco mais real de como seria um microsserviço com mais componentes.

Nós vamos passar por essa imagem em outros momentos para falarmos um pouco mais dela, mas basicamente nós já começamos a entender que um microsserviço é composto de vários componentes.

Está entendida esta parte? Agora vamos falar um pouco sobre o contrato entre vários microsserviços, mas no próximo vídeo!