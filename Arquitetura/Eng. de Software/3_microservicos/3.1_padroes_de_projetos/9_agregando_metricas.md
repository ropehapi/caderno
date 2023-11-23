# Agregando métricas
Vamos conversar agora sobre um assunto que às vezes é relativamente ignorado. Precisamos sempre, como eu já falei anteriormente, conhecer o estado dos nossos microsserviços, cada microsserviços, como ele está, está recebendo muita requisição, está consumindo muito recurso, está tranquilo.

E também precisamos conhecer o status da nossa aplicação como um todo, um status mais geral. E para receber, para conseguirmos visualizar esse status, nós precisamos de métricas.

E como geramos métricas? Existem algumas formas, existem alguns tipos de métricas, então vamos falar de forma genérica para não entrarmos em muitos detalhes e nos alongarmos demais.

Então um detalhe é que enquanto logs precisam de desenvolvimento, as métricas só precisam de instrumentação. Primeiro, o que é instrumentação? Quer dizer que precisamos configurar uma ferramenta que já temos no nosso servidor, instalar um novo programa e configurá-lo. E por que esse só está entre aspas?

Porque isso não é uma tarefa trivial, não é fácil, não é qualquer pessoa que faz, isso demanda estudo, demanda especialização, então instrumentar métricas também é uma tarefa muito importante e pode se tornar complexa.

Só que métricas no geral normalmente não precisam de desenvolvimento. Por exemplo, para eu saber quantas requisições o meu sistema está recebendo, eu não preciso ir no meu edge service e realizar um log, recebi requisição.

Não preciso disso porque o servidor web já faz isso para nós, conseguimos monitorar o uso de CPU do nosso processador, do nosso servidor, então conseguimos monitorar determinadas coisas sem desenvolvimento próprio, alguém já desenvolveu, esse é o ponto.

Então por exemplo, se eu quero saber se determinado servidor está tranquilo ou eu preciso aumentar a capacidade dele, eu posso ver quantas requisições ele recebe o tempo todo, em determinado horário do dia eu posso ver que ele recebe mais requisições.

Então eu posso configurar para, por exemplo, meia hora antes desse pico aumentar o número de servidores, adicionar um servidor a mais para que meu load balancer tenha mais servidores para balancear essa carga.

Então eu posso utilizar métricas para manter meu sistema saudável. Assim como exames de sangue estão para a saúde de uma pessoa, métricas estão para a saúde de um sistema. Precisamos ter métricas para saber se nossos sistemas estão saudáveis ou estão quase morrendo, estão quase ficando offline. Então precisamos coletar e agregar métricas.

Então, elas como eu já falei nos permitem saber o que está acontecendo em determinado momento e ter uma visão de alto nível. Eu posso saber que determinado microsserviço está recebendo muita requisição e outro quase não está recebendo.

Então eu posso diminuir recurso de um e aumentar do outro para poupar dinheiro e garantir que os nossos serviços estejam sempre de pé.

E é importante que a partir das métricas nós tenhamos as informações muito claras. Então podemos construir ou utilizar, eu sou do tipo de pessoa que prefere utilizar, dashboards de alto nível, para termos uma visão fácil do status atual da aplicação como um todo.

O que isso quer dizer? De novo, falando de APMs, de “application performance managements”, temos essas ferramentas que podem nos mostrar um dashboard.

Sua aplicação, esse conjunto de microsserviços está de pé, está funcionando, eu estou conseguindo mandar requisições, em determinado momento tem um pico, nesse horário do dia não tem requisição nenhuma. Então temos algo de alto nível.

Mas também precisamos ter, só que isso é um pouco depois, um dashboard, ou seja, podemos utilizar, construir o nosso próprio, mas precisamos ter alguma forma de visualizar o status mais detalhado de cada microsserviço. Esse microsserviço está gerando esse tipo de log muito mais do que a média do ano passado, por exemplo.

Então métricas mais específicas podem trazer valor para nós, para podermos saber quando aumentar um servidor, quando diminuir, quanto alterar determinada lógica. Às vezes eu estou tendo muita fraude, então eu posso adicionar uma verificação a mais lá no front-end para evitar determinadas requisições.

Às vezes eu não estou conseguindo processar um determinado pagamento, então eu posso tentar realizar alguma ação. Até para o negócio, realizar algum tipo de campanha de marketing, esse tipo de coisa.

Então as métricas não servem só para mantermos nossos sistemas funcionando, mas também para nos comunicarmos com o negócio e falar que nesse período do ano não recebemos requisição quase nenhuma.

Então um pouco antes desse período vamos fazer uma campanha para conseguirmos atrair mais clientes nesse momento, para recebermos mais requisições e continuarmos fazendo o negócio girar o tempo todo.

Então métricas não podem ser ignoradas, precisamos avaliar métricas. Para um cenário de operações, que é o foco desse capítulo, mas também principalmente para o negócio.

Porque nós que trabalhamos com tecnologia desenvolvemos tecnologia para atingir algum objetivo e as métricas podem nos ajudar a atingir esse objetivo com mais facilidade, com maior valor e entregar melhor valor para o negócio final.

Então métricas são muito importantes em qualquer sistema, assim como log. Mas como falamos de microsserviços, por ter várias aplicações separadas, isso acaba se tornando mais crucial ainda se tratando do ponto de operações.