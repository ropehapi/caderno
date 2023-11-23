# Contratos entre microserviços
![Alt text](/src/img/microsrevicos-sao-independentes.png)
E aí, pessoal! Bem-vindos de volta! Nós já nos aprofundamos um pouco falando sobre componentes de um microsserviço. Nós sabemos que um microsserviço isolado não é uma aplicação muito utilizável para o usuário final, não é uma aplicação completa que tenha tanto valor assim.

Um microsserviço, por via de regra, é uma parte de uma aplicação maior, ele é uma micro parte de uma aplicação maior. Então nós precisamos ter comunicação entre microsserviços, de alguma forma.

E nós vamos falar bastante sobre comunicação em um capítulo posterior. Só que aqui, quando estamos arquitetando microsserviços, quando estamos pensando em quais microsserviços vão existir e o que cada um vai ter, nós já temos que ter em mente que existem contratos entre microsserviços.

Quando um microsserviço expõe uma API, quando ele expõe uma interface pública de comunicação com a sua aplicação, ele está assinando um contrato. Ele está dizendo: “olhe só, cliente que vai acessar a minha API, eu estou me comprometendo a te fornecer estas funcionalidades desta forma aqui”.

E isso pode ser a partir de uma documentação, de testes automatizados entregue ao usuário ou testes de usuário em si. Enfim, de alguma forma ele vai expor isso. Com esse contrato exposto, nós temos uma responsabilidade. Eu preciso manter isso funcionando independentemente do que eu precise fazer aqui dentro.

Se eu vou mudar de linguagem de programação, se eu vou mudar de banco de dados que eu estou utilizando ou se eu vou trocar de servidor próprio para um servidor em cloud, isso não importa. Nós temos que manter o nosso contrato. Nossa interface tem que continuar funcionando com o cliente.

Mas como eu vou manter a minha API sempre atualizada, com novas funcionalidades? O meu projeto precisa de atualizações de tecnologia, ou atualizações de negócio. Como que eu vou manter essas atualizações constantes, se eu não posso quebrar esse contrato? Se a minha API não pode ser modificada?

Aqui nós temos algumas formas de mantermos esse contrato e algumas técnicas de mantermos esse contrato e a evolução.

Primeiro, as técnicas óbvias que eu nem coloquei no slide são: se você vai ter alguma atualização técnica no seu sistema ou uma atualização tecnológica, não sei nem se o termo correto seria esse - mas imagine que você vai atualizar para uma nova versão da linguagem, do framework, de alguma biblioteca. Isso, naturalmente, com microsserviços ou não, já deve ser transparente para a sua API, para o seu cliente externo.

Isso, naturalmente, não deveria afetar o funcionamento. Se você atualiza uma dependência sua, você precisa fazer com que a sua API continue funcionando com essa nova versão de dependência. Isso aqui é o mínimo que nós esperamos.

Agora, algumas outras coisas que podemos fazer é termos apenas modificações aditivas. O que isso quer dizer? Somente adicionarmos funcionalidades, nunca modificarmos como uma funcionalidade é feita ou consumida e nunca removermos funcionalidades.

Essa é uma abordagem válida e muito utilizada. Embora pareça um pouco restritiva. Você me diz: “Poxa, Vinicius, quer dizer que eu nunca posso remover um endpoint?” É uma abordagem um pouco restritiva, mas é bastante válida!

Então você sempre vai criar novos endpoints. Como assim? Além de você fazer um pedido, agora você vai poder também consultar o status desse pedido. Então, ao fazer o pedido você não vai devolver direto o status dele, modificando o contrato de retorno com uma resposta que chegou desta API. O que você vai fazer é criar um novo endpoint.

Nós também podemos adicionar novos campos em cada recurso. Então meu pedido precisava de uma identificação do cliente, o valor do produto, a quantidade do produto e a identificação do produto em si. Mas agora, eu quero enviar também o desconto.

Esse campo precisa ser opcional, porque alguns podem não passar esse campo, já que o seu contrato original não fornecia esse campo. Então você pode, por exemplo, assumir que ao não passar esse campo, não tem desconto.

Então novos campos podem ser adicionados, só que de forma opcional. Até porque se você recebe um campo a mais, não é grande problema. Se você manda um campo a mais para o seu cliente, não é um grande problema. Mas se você passa a esperar algo que não chega do cliente, aí nós temos um problema.

Então, campos opcionais não são um problema, são uma funcionalidade aditiva. Uma modificação aditiva.

Nós também podemos ter versionamento de APIs - isso eu acredito que seja a técnica mais comum. Como funciona o versionamento de APIs? Imagine que você tem algo para fazer pedidos. Você tem uma API RESTful para fazer pedidos e quando você faz o post para /pedidos, você cria um novo pedido.

Ao invés de ser /pedidos, você vai criar /v1/pedidos. E aí quando a interface, quando o contrato de criar um pedido for modificado, for algo que você não pode fazer só uma modificação aditiva, for algo vai realmente mudar nesse contrato - você vai criar um novo endpoint /v2/pedidos. E neste v2 você pode, inclusive, ter uma aplicação nova em outro servidor, com outra tecnologia - e o seu cliente não precisa saber disso.

Caso ele escolha utilizar essa nova versão, ele vai consultar a nova documentação e vai se adequar. Só que a primeira versão, aquela /v1/pedidos, precisa continuar funcionando exatamente igual, sem nenhuma quebra nela. Então você vai ter duas APIs sendo mantidas ao mesmo tempo.

“Vinicius, parece bastante trabalhoso!” E realmente é, pode trazer problemas de manutenibilidade! Às vezes você adiciona, tem uma modificação aditiva em uma e você tem que replicar para outra. É trabalhoso, mas é algo fácil para o cliente.

O cliente decide se vai se atualizar ou não. Você pode dar um aviso para o cliente falando: “olhe só, estamos lançando essa nova versão, você tem um ano para se atualizar”. Durante um ano nós vamos manter essa versão 1 ainda de pé e funcionando.

E é muito comum que quando temos que fazer alguma modificação, principalmente quando trabalhamos com uma equipe com todos os microsserviços, nós modificamos um microsserviço.

Para testarmos rapidamente, nós vamos no cliente deste microsserviço, ou seja, o serviço que utiliza ele e modificamos a chamada também, para fazer funcionar e para garantirmos que está tudo OK.

Nisso, nós não mandamos a modificação desse microsserviço para o cliente, nós fazemos a alteração só no microsserviço que está fornecendo essa API. Quando isso vai para produção, quando acontece um deploy, o microsserviço do cliente não foi atualizado e nós temos nossa aplicação quebrada.

Então, para evitar esse tipo de coisa é bastante comum, principalmente em empresas maiores, que nós tenhamos equipes específicas para cada microsserviço. Então o microsserviço de pedido vai ser feito por uma equipe, o de carrinho vai ser feito por outra equipe e o de catálogo vai ser feito por outra equipe.

E assim, se eu com um microsserviço de catálogo preciso, por algum motivo, de uma nova funcionalidade no microsserviço de carrinho, eu preciso adicionar temporariamente ao carrinho a partir do meu catálogo. Eu vou solicitar formalmente para equipe de carrinho para que eles desenvolvam essa funcionalidade e, a partir disso, eu poder fazer a chamada no meu catálogo.

Então não ocorre esse risco de modificar um microsserviço e esquecer de modificar algum cliente dele e assim em diante.

Então, essas são algumas técnicas para tornarmos nossos microsserviços realmente independentes. Um microsserviço precisa ser independente. Nós temos que poder atualizar ele sem nenhum problema, nós temos que poder modificar a tecnologia dele sem nenhum problema.

Nós temos que poder fazer o deploy dele individualmente sem problema. Ele realmente precisa ser independente. Só que, tornando-o independente, nós precisamos ainda assim manter os nossos contratos.

Falando agora um pouco ainda sobre essa parte de comunicação e de vários microsserviços, como podemos identificar a barreira entre um microsserviço e outro? Quando acaba um microsserviço e começa outro?

Nós já batemos um papo legal sobre isso no treinamento de padrões de microsserviços, mas como recordar é viver, vamos falar um pouco desse assunto e dessas técnicas, no próximo vídeo.