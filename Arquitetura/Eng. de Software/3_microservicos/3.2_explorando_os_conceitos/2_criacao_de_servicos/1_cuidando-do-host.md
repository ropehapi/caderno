# Cuidando do host
E aí, pessoal! Bem-vindos de volta! Nós conversamos um pouco sobre a ideia de começar a arquitetar microsserviços. Nós conversamos sobre como pensar acerca dos componentes de um microsserviços, os contratos entre eles e as barreiras entre cada microsserviço.

Agora vamos pensar na parte de criação. O que eu preciso fazer para criar? Como eu vou cuidar da parte de subir máquinas e servidores? Nós vamos utilizar algum tipo de padrão? Enfim, vamos conversar sobre isso neste capítulo.

Uma das primeiras coisas que vamos nos perguntar e que precisamos lidar é sobre cuidar do host, cuidar do local, realmente - físico ou virtual, onde os nossos sistemas vão estar. Você pode me perguntar: “como assim, Vinicius? O que você quer dizer com cuidar do host?”

É basicamente como vamos lidar com os servidores. Como falamos dos componentes, nós vamos ter vários servidores de aplicação, vários servidores de bancos de dados, processamento de tarefas em plano de fundo, processamento de mensagens e de agendamento de tarefas. Então precisamos manter isso em servidores.

Nós obviamente precisamos ter um bom conhecimento em infraestrutura, nós precisamos conhecer bem algum sistema operacional. Via de regra, é um sistema operacional Linux, nestes casos, mas também existe o Windows Service para alguns casos.

Enfim, nós precisamos entender de sistemas operacionais para colocarmos qualquer aplicação no ar, mais especificamente os microsserviços. O que será que precisamos fazer de específico para cuidarmos de host de servidores de microsserviços?

Nós sabemos que cada microsserviço pode ter vários componentes. Onde vamos armazenar? Ou como vamos fazer para mantermos todo esse sistema facilitando o desenvolvimento?

Ou seja, chegou uma nova pessoa para desenvolver na nossa equipe. Como vamos deixar a máquina dela pronta para desenvolver? Ou, amanhã é dia de botar o sistema em produção - como vamos facilitar também essa tarefa?

Nós precisamos organizar bem, de forma que cada componente do nosso microsserviço tenha um lugar bem definido, que eles consigam se comunicar e nós consigamos fazer tanto desenvolvimento quanto deploy de forma facilitada. É isso que eu quero dizer com cuidar do host, cuidar do servidor.

Existem algumas opções. Uma opção bastante comum é o uso de máquinas virtuais. Foi muito comum e ainda é muito comum. Na empresa onde eu trabalho nós utilizamos máquinas virtuais, nós temos clusters de várias máquinas virtuais e cada uma dessas máquinas virtuais pode ser provisionada de forma automática.

O que isso quer dizer? Aqui na Alura nós temos treinamentos de Vagrant com Puppet, é muito interessante porque é basicamente você ter alguma ferramenta onde você escreveu toda a sua infraestrutura como se fosse um código, como se fosse um programa. Por exemplo: uma nova pessoa chegou na nossa equipe de desenvolvimento. Você vai na máquina dela, só instala a máquina virtual e roda o script para provisionar essa máquina.

Isso vai instalar os servidores, vai criar máquina de banco de dados, vai criar a máquina de aplicação, vai instalar o seu servidor de aplicação no servidor correto e vai fazer tudo que tem que fazer para deixar aquela máquina pronta.

Nós temos a facilidade de automatização. Nós podemos utilizar este mesmo script em máquinas virtuais e em servidores reais, em um servidor próprio de produção etc. Só que o custo disso é muito alto.

Imagine aquelas sete máquinas virtuais rodando no computador de um desenvolvedor - se não me engano foram sete componentes que conversamos. Isso vai demandar muito processamento, nós vamos onerar muito a máquina dessa pessoa. Essa pessoa vai ter dificuldade para utilizar qualquer outra ferramenta e propriamente desenvolver.

Essa foi uma abordagem muito útil onde não tínhamos tantos componentes, não se trabalhava com muitos microsserviços, na verdade, e principalmente em aplicações que utilizam a abordagem monolítica, que é o caso de onde eu trabalho. Nesses cenários, as máquinas virtuais podem ser uma boa alternativa, mas o custo é alto e o processamento exigido para levantar uma máquina virtual também é alto.

Nós também temos sistemas em cloud. Eles estão cada vez mais famosos hoje em dia. Azure, AWS e Google Cloud. Existem vários serviços de cloud onde você pode simplesmente também utilizar um script de build desses, um provisionador, para manter sua máquina pronta.

Inclusive, existem tipos de máquinas já específicas para determinadas tarefas, que nem precisamos nos preocupar: load balancing, DNS, cache - existem máquinas específicas para isso em serviços de cloud. Isso facilita muito o nosso processo de deploy dando muitas ferramentas especializadas e a cada vez mais, um custo-benefício maior.

O que isso gera? O que isso acarreta de problema? Nós temos um ambiente de produção muito robusto. Nós conseguimos ter algo muito customizável e várias ferramentas à nossa disposição, mas e para rodar na máquina da equipe de desenvolvimento? Como fazemos para rodarmos um ambiente local para desenvolvermos?

Nós vamos precisar contratar um AWS da vida, um EC2 para botarmos tudo que um desenvolvedor precisa? E cada pessoa que está desenvolvendo vai precisar de uma instância dessa? Fica muito caro!

Então, uma abordagem que hoje é a mais comum é a de utilização de containers. Porque aqui nós pegamos as duas vantagens. Primeiro: o ambiente de desenvolvimento pode ser facilmente provisionado com as mesmas ferramentas de máquinas virtuais, ou ferramentas específicas.

Você tem, hoje em dia, orquestradores de containers, Kubernetes, Docker Swarm e vários outros, para você organizar os seus containers; onde que cada um vai subir e quantas imagens de cada um você vai subir.

Se você não entende muito de containers, tem vários treinamentos aqui na Alura também que são muito interessantes e muito válidos.

Então nós temos essa facilidade para o desenvolvimento, nós conseguimos subir todos os microsserviços utilizando containers, é muito mais leve do que máquinas virtuais. Lá no treinamento de containers, especificamente de Docker, você vai entender o porquê disso ser mais leve.

E, além disso, tem diversos serviços de cloud que já fornecem hosts de containers ou container hosts. O que isso quer dizer? Ele já possui ferramentas, máquinas específicas, imagens, ou instâncias específicas para você entregar uma imagem de um container e ele já subir direto, como se fosse uma máquina dele mesmo. Ou enviar configurações de um orquestrador de container e ele já pegar isso e subir várias instâncias em cloud.

Hoje em dia a abordagem de containers está muito mais fácil e inclusiva, porque você consegue ter um ambiente de desenvolvimento configurável - como você vai ver facilmente nos treinamentos de Docker aqui da Alura - e você tem serviços de cloud, serviços para você colocar os seus containers em produção muito potentes, muito poderosas e também muito facilitados.

Por isso, utilizar containers é um padrão quando falamos de microsserviços. Porque você vai ter vários servidores em cada microsserviço e você vai ter vários microsserviços em cada aplicação. Por isso, como a complexidade da infra aumenta, nós vamos utilizar containers para tentarmos simplificar um pouco.

Nós já entendemos como começar a conversar sobre esse processo de onde armazenar cada microsserviço, mas vamos para a parte efetiva de criarmos um microsserviço. O que precisamos pensar no cenário na hora de efetivamente começarmos a criar esse microsserviço?

Eu sei que eu vou utilizar containers. Perfeito, o que eu vou colocar nesses containers? Como eu vou começar a codificar? Enfim, vamos bater esse papo no próximo vídeo!