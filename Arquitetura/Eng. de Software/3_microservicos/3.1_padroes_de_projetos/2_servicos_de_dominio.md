# Serviços de dominio
Boas-vindas de volta a mais um capítulo desse treinamento, onde estamos batendo um papo sobre microsserviços e vamos falar sobre como podemos separar serviços, como decidir qual parte da aplicação monolítica, por exemplo, vira determinado tipo de serviço, esse tipo de coisa.

Vamos começar conversando sobre um tipo de serviço que vimos como data service e como podemos decidir quando vamos separar um data service. E normalmente fazemos isso utilizando o que é conhecido como serviços de domínio.

Então vamos pegar um pequeno domínio da nossa aplicação, não vamos pegar um contexto inteiro, não vamos pegar um módulo inteiro. Vamos pegar um pequeno domínio e separar isso em um serviço.

Então como fazemos isso? Primeiro é muito interessante que para isso, para chegarmos nesses serviços de domínio, tenhamos determinado conhecimento ou uma certa consciência do que é domain-driven design.

Através das práticas de domain-driven design, se seguimos os padrões dele, temos muito claro o que é um domínio bem definido no nosso sistema para separá-lo em um serviço, em um data service que vai ser um serviço de domínio.

Como fazemos isso na prática? Começamos modelando o domínio, não pensamos na persistência ainda. Por exemplo, no caso da Alura, imagina que eu queira ter um data service, que vai ser um serviço do domínio de aluno. Sempre que um aluno se matricular, ou sempre que um aluno alterar algum dado seu, vamos precisar consumir um domínio que lida especificamente com o aluno.

Então esse serviço de domínio aluno vai ter suas regras, por exemplo: um aluno precisa ter um e-mail, um aluno precisa ter determinadas regras para esse serviço ser criado de forma que atenda ao negócio em si.

Então precisamos, obviamente, conhecer o negócio e esse é um outro ponto onde DDD, domain-driven design pega muito, precisamos conhecer o domínio do que estamos desenvolvendo.

E a partir do modelo já bem pensado, a partir do domínio modelado, vamos começar avaliar quais ações vão ser disponibilizadas. Então, por exemplo, eu vou matricular um aluno a partir desse domínio? Ou vou simplesmente inserir um aluno a partir desse domínio?

Por que matrícula envolve coisas além de um aluno? Eu vou simplesmente inserir esse aluno e na hora de atualizar, eu vou atualizar todos os dados do aluno ou vou restringir o que pode ser alterado depois da inserção?

Então, eu vou avaliar quais ações vão ser disponibilizadas de forma pública por esses serviços. E pronto, a partir disso vamos construir o serviço, vamos implementar pensando de novo, primeiro no contrato e depois na implementação.

Mesma coisa que o ponto anterior. Vamos inserir um aluno ou vamos matricular um aluno? Qual dessas duas ações fazem mais sentido para esse serviço? Na hora de alterar eu vou ter, por exemplo, um verbo put ou um verbo patch, que em HTTP significam coisas diferentes? Significa que eu vou atualizar todo o meu aluno ou apenas pequenas partes dele?

Então esse tipo de detalhes do contrato, ou seja, de como vamos expor as ações, precisamos pensar e ter muito bem definido. Tendo isso definido, vamos liberar acesso a esse recurso, acesso a esse serviço.

E é importante sabermos, aceitarmos que REST e RPC, que é remote procedure call podem, sim, andar juntos, embora isso possa ser meio que abominado por aí, porque REST é simplesmente representação de recursos e RPC, remote procedure calls envolve chamadas de ações, de funcionalidades.

Então esses dois podem de certa forma andarem juntos. Inclusive existe o action pattern em aplicações de restfull, que permite além de você expor recursos, expor determinadas ações.

Entendendo isso, estudando bem sobre HTTP e como você vai expor seu serviço, você vai decidir se vai simplesmente liberar todos os dados através de REST sem nenhum filtro ou se vamos filtrar alguns detalhes, se vamos liberar algumas operações e a não a manipulação crua pelo recurso, enfim, esse tipo de detalhe vai ser bem pensado.

Só que como eu acabei de falar, isso é um serviço de domínio muito pequeno, por exemplo, um microsserviço de aluno. Agora para eu matricular um aluno, será que isso envolve somente inserir um aluno no banco de dados, por exemplo? Então vamos conversar sobre quando temos algum serviço que precise de mais do que um único domínio, só que vamos fazer isso no próximo vídeo.