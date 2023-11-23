# Identificando as barreiras entre um serviço e o outro
E aí, pessoal! Bem-vindos de volta! Então nós já entendemos um pouco melhor sobre o que compõe um microsserviço. Nós entendemos que os microsserviços devem ser independentes, mas devem respeitar os contratos. Agora vamos identificar quando termina um microsserviço e começa outro.

O meu catálogo não pode estar junto com o meu carrinho de compras? Ou o carrinho de compras junto com o meu microsserviço de pedidos, por exemplo? O meu microsserviço de pedidos tem que separar o estoque dele, ou posso manter junto do estoque? Enfim, para começarmos, não existe regra. Cada caso é um caso e temos que identificar de acordo com as especificidades de cada caso.

Mas nós batemos um papo bem legal no treinamento anterior sobre a abordagem monolith first. O que isso quer dizer? O ideal é que, se você está criando uma nova aplicação, você comece pela abordagem monolítica. Você cria uma única aplicação para servir tudo que você tem que servir. Conforme a complexidade vai aumentando e você realmente precisa de um microsserviço, você vai identificar os módulos de cada parte desta aplicação.

Então, se você tem, por exemplo, um módulo que faz todo o trabalho de carrinho de forma desacoplada do restante, é fácil você transformar isso em um microsserviço. Se a parte de carrinho está diretamente ligada com a parte de pedido, talvez faça sentido no seu negócio o carrinho e o pedido estarem no mesmo microsserviço.

Então, por isso a ideia é que você comece com a abordagem monolítica, para que você conheça o seu domínio, para que você implemente os problemas e para que você resolva os problemas reais.

E a partir dos problemas solucionados, os problemas técnicos nós resolvemos com microsserviços, porque qualquer problema de negócio é resolvido tanto com uma abordagem monolítica como uma arquitetura de microsserviços.

Isso não influencia na solução de negócios, mas a solução técnica pode mudar entre um e outro. Então, se você precisar muito escalar o seu serviço de catálogo - porque ele recebe muitas requisições, mas o serviço de carrinho ou o serviço de pedidos, nem tanto - então, nesse caso, seja preciso separar em serviços. Nós já falamos bastante sobre isso no último treinamento.

Nós também falamos sobre o conceito de bounded contexts de DDD. Já tem treinamento de DDD aqui na Alura, vale muito a pena fazer, isso nos dá uma boa ideia de como separarmos nossa aplicação em módulos e como esses módulos futuramente podem virar serviços diferentes.

Porque quando desenvolvemos sem muita noção de design de código e arquitetura de software, é difícil pensarmos nisso. Primeiro eu vou criar uma aplicação e depois separar? Então eu vou ter que copiar muitos códigos e modificar muitas coisas? Mas se nós já começarmos uma aplicação monolítica e de forma organizada bem-feitas, separarmos não é difícil. Nós realmente só vamos separar se e quando precisarmos.

Tem alguns detalhes para evitarmos, que são bastante comuns: pegarmos todo e qualquer substantivo que tem no nosso sistema e transformarmos em um microsserviço. Então item de produto é um microsserviço, item de pedido é outro microsserviço, o carrinho é um microsserviço, a lista de desejo é um microsserviço, o usuário é um microsserviço...

Então, se você pega todos os substantivos e cada um deles vira um microsserviço separado, você vai ter algo próximo ao que é chamado de nanoserviços - que não é exatamente isso, mas na prática você vai ter um monte de data services, que nós já conversamos no treinamento anterior o que são.

Então, vários serviços anêmicos que não têm lógica de negócio e que depois você vai precisar criar um serviço específico para unir todos eles. Isso pode ser uma abordagem interessante, mas não por falha de design.

Se você escolher fazer assim, pode ser interessante para você orquestrar. Talvez esses data services precisem de mecanismos de persistência diferente etc. Mas via de regra, se você simplesmente pega todos os substantivos e joga em microsserviços diferentes, você vai ter uma complexidade maior sem nenhum ganho real.

Então tente extrair o que faz sentido, um módulo real, um bounded context da sua aplicação, um contexto delimitado do seu negócio real. Pense em uma agência de turismo - ela tem o setor de produtos e tem o setor de comercial, que faz a negociação para isso entrar em produtos. Então nós sabemos que esses dois setores vão se comunicar bastante.

Nós temos um setor de financeiro, que vai pegar acordos feitos pelo setor comercial e vai repassar custos para o cliente. Nós também temos o setor de marketing. Então isso tudo pode virar microsserviços no nosso sistema para organizarem essa operadora de turismo, por exemplo.

Então o nosso conhecimento do domínio vai nos dizer como separar os nossos serviços.

E é sempre muito importante, como eu falei, pensar antes de implementar. Neste exemplo que eu dei aqui de uma operadora de turismo, pegue um quadro branco, uma folha de papel ofício ou qualquer coisa, pode ser um slide no PowerPoint - e desenhe, faça realmente uma simulação de um fluxo da sua aplicação.

Se um cliente for reservar um hotel ou se eu precisar cadastrar no meu sistema uma nova parceria com um resort - como é o fluxo real de domínio? E como isso vai ser feito no sistema se eu arquitetar utilizando microsserviços? Eu preciso desse microsserviço, que vai se comunicar com outro. Como eles vão se comunicar? Pense “então é melhor eu juntar esses dois, já isso aqui pode separar...”

Então, dessa forma, se realmente analisarmos a nossa implementação, nós já conseguimos imaginar os problemas de cada abordagem. De novo - por isso é importante aquela abordagem de monolith first, porque você já vai conhecer o domínio e já vai conhecer os problemas do negócio. Aí você vai poder pensar em resolver problemas técnicos e problemas da solução, porque os problemas de negócio já foram resolvidos.

Nós falamos bastante sobre começar a arquitetar os microsserviços e quando eu realmente quiser começar a criar esses microsserviços.

Você me fala “Vinicius, decidi que eu vou utilizar esta abordagem”, ou então, “já estou utilizando uma arquitetura de microsserviços e preciso criar um novo. O que podemos utilizar de técnica para facilitarmos esse processo?” Vamos bater um papo sobre isso no próximo capítulo!