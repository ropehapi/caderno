# Criação de novo serviço
E aí, pessoal! Bem-vindos de volta! Vamos falar bem rapidamente, eu acho, esse que vai ser o vídeo mais curto deste treinamento, sobre o processo de criação de um novo serviço.

Eu estou começando a separar o meu monólito em vários microsserviços, ou estou criando realmente uma nova aplicação a partir da arquitetura de microsserviços, ou já tenho uma aplicação utilizando arquitetura de microsserviços e quero criar um novo microsserviço. Quais são as etapas? O que precisamos começar a pensar?

Primeiro, antes de tudo, nós precisamos configurar um repositório para versionamento de código. Não existe mais a possibilidade, hoje em dia, de trabalharmos sem versionamento de código.

Você vai criar algum repositório, hoje em dia Git é praticamente a única opção viável. Existem SVN, Mercurial, CVS, mas no mercado todo mundo utiliza Git praticamente. Então eu vou falar aqui sempre de Git. Quando precisar falar de versionamento de código, eu vou falar Git direto.

Você vai configurar um repositório Git. Vai ser no GitHub, GitLab, Bitbucket, um repositório seu, o que você quiser. Você precisa de algum repositório.

Nesse momento, já começa o primeiro questionamento: eu vou utilizar vários repositórios, um repositório para cada microsserviço; ou eu vou seguir a abordagem “monorepo”, onde todos os meus microsserviços estão no mesmo repositório?

Ambos têm vantagens e desvantagens. Empresas gigantes, como Facebook e Google, começaram a seguir a abordagem “monorepo”. Não é uma abordagem para todo mundo.

Existem dois cursos que eu vou citar bastante neste treinamento, que são de integração contínua e de entrega contínua - eu sempre falo essas palavras erradas, eu espero que eu não tenha falado. Esses dois treinamentos aqui na Alura são fenomenais e essenciais para trabalharmos com microsserviços.

Lá existe um papo muito mais aprofundado sobre essa abordagem de múltiplos repositórios ou monorepository. Lá você entende melhor as vantagens e desvantagens, mas nós já temos que começar pensando nisso. Existe essa decisão para eu tomar, então eu preciso conhecer as duas abordagens.

Tenho o meu repositório lá. Como eu disse, a integração e entrega são contínuas, que são os famosos CI e CD - são técnicas obrigatórias ao trabalhar com microsserviços. Por quê?

Quando trabalhamos com uma aplicação monolítica tem um processo manual, com uma coisa ou outra fica uma pessoa responsável por fazer o deploy em uma quinta-feira porque não pode fazer deploy na sexta. Isso é relativamente aceitável, porque é um sistema só, é uma stack de tecnologia só. Todo mundo trabalha no mesmo projeto. Então, OK.

Só que quando trabalhamos com microsserviços, são muitos deploys, podem ser vários deploys por dia. Uma equipe fez o deploy de manhã, outra equipe fez um deploy de outro serviço à tarde e a mesma equipe de manhã fez um outro deploy mais à noite...

São muitos deploys; são deploys pequenos, mas constantes. Nós precisamos ter um processo organizado e automatizado para transformarmos isso em algo menos doloroso, para que possamos fazer o famoso deploy na sexta-feira.

Nós vamos bater papo sobre entrega posteriormente neste treinamento - mas basicamente, se vamos começar criando serviços, nós já precisamos pensar nisso.

É interessante que tenhamos algum padrão. Como nós vamos criar o próximo microsserviço? Nós podemos, por exemplo, ter um Dockerfile para criarmos todos os nossos serviços. Todos vão estar em máquinas desse tipo etc.

Nós podemos ter um repositório com o esqueleto de uma aplicação, já utilizando determinado framework de determinada linguagem. Isso pode nos restringir, porque uma das vantagens dos microsserviços é poder utilizar uma tecnologia aqui, outra em outro microsserviço, uma linguagem neste microsserviço e outra linguagem em outro microsserviço. Essa é uma das vantagens.

Só que se você automatiza essa criação e mantém um padrão, você perde um pouco dessa flexibilidade, mas você ganha em facilidade na hora de criar novos serviços e você mantém qualquer equipe apta a criar microsserviços.

Voltando um pouco nessa parte de entrega e de deploy, é muito importante que nós não só tenhamos testes, mas que esses testes sejam realmente confiáveis e que nós tenhamos uma boa pirâmide de testes, com muitos testes garantindo a nossa lógica.

Testes de unidade - que nós tenhamos testes que garantam a comunicação com outros microsserviços. Nossos testes de integração e que nós tenhamos alguns testes da aplicação como um todo, ou seja, testes end to end, para garantirmos que nossas entregas e nossos deploys não estejam causando nenhum problema.

Para tudo isso precisamos pensar e conhecer as técnicas - é para isso que estou falando tanto dos outros cursos para que consigamos ter tranquilidade na hora de trabalharmos com arquitetura de microsserviços.

Eu falei bastante, só que eu não entrei em muitos detalhes sobre essa parte de definir um padrão. Vamos conversar um pouco melhor sobre essa parte de definir um padrão para a hora de criar novos serviços, mas no próximo vídeo!