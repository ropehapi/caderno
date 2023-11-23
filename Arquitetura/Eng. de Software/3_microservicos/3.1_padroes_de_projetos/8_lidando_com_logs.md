# Lidando com logs
Boas-vindas a mais um capítulo desse treinamento, onde estamos batendo um papo bem legal sobre microsserviços, como separar, como se comunicar, como lidar com os dados e agora vamos falar um pouco sobre operações de microsserviços.

Eu não vou entrar em detalhes de infraestrutura de gerenciar servidores, temos treinamento de infraestrutura, caso seja isso que você queria aprender.

Mas o que vamos falar aqui é sobre como lidar com microsserviços, de novo, sobre uma perspectiva de alto nível. Porque como eu falei, debugar microsserviços é muito difícil, extrair informações é muito importante. Então vamos falar um pouco sobre agregação de logs.

Em treinamentos de programação aqui da Alura já falamos sobre logs em alguns momentos, só que quando falamos sobre microsserviços, logs são ainda mais importantes, logs são importantes sempre, sempre devemos realizar logs de operações que acontecem no nosso domínio, só que quando falamos de microsserviços, a importância disso pelo menos dobra.

Então vamos conversar um pouco exatamente sobre isso, sobre logs. Já vimos que poderíamos ter um serviço de logs, podemos ter um sidecar de logs, mas isso são detalhes de implementação. O que vamos falar aqui é como agregar logs de todos os microsserviços.

Por quê? Precisamos ter um formato padrão para que todos os microsserviços exponham os logs, exponham informações da mesma forma, para conseguirmos ler como se fosse uma única aplicação.

Então os formatos de log, de novo, devem ser compartilhados entre todos os serviços. Eu não posso ter um serviço exportando algo, fazendo log de algo em XML, outro no formato binário próprio, outro em TXT, não, eu preciso ter um formato único.

Vai ser um formato de texto, separado por vírgula, onde eu tenho uma coluna que forma o horário, a outra o tipo, a severidade desse log e outra uma mensagem, uma descrição.

Então além desse formato, a taxonomia tem que ser compartilhada, deve ter algo em comum. Então por exemplo, o que é um log de erro? O que é um log de warning? O que é a classificação de logs, a organização de logs deve ser compartilhada para que eu consiga pegar.

Quantas vezes aconteceram erros na minha aplicação toda? E eu vou ver todos os logs, de todos os microsserviços agregados e vou conseguir tê-los bem organizados.

E logs de monolitos são agregados por padrão, você gera um log e todos os logs são gerados para algum lugar que o monolito salva.

Já quando falamos de microsserviços, um serviço gera log em um lugar, outro microsserviço gera log para outro lugar, então precisamos cuidar da agregação. Então como dizemos aqui na gíria, o buraco é mais embaixo, precisamos nos preocupar com isso.

Então o que podemos fazer? Caso você não conheça, acho interessante estudar sobre twelve factory application, uma metodologia de desenvolvimento e essa metodologia diz que os logs devem ser um string de dados.

Então por exemplo, a partir de um processo que é a nossa aplicação, mandamos os logs para saída padrão e a partir disso podemos ter um serviço realmente específico de logs, não nosso, um serviço externo, que coleta todos os logs de todos os nossos processos e agrega, faz o parsing desses logs, que é uma parte da tarefa de agregação, os categoriza, gera relatórios bonitos.

Então existem diversas ferramentas para isso, você pode pesquisar um pouco depois, temos cursos de log na Alura também, se eu não me engano é sobre o Telegraph, não tenho certeza, mas enfim, existem ferramentas específicas para visualizarmos métricas que são geradas a partir de log.

Então é muito importante sabermos lidar com logs e que os agreguemos. De novo, para simplificar esse slide em um ponto: Todos os logs, de todos os microsserviços, devem de alguma forma serem agregados em algum ponto onde podemos consultar com facilidade.

E precisamos rastrear as chamadas e através de log que fazemos isso. Então imagina de novo um serviço monolítico, temos uma exceção, temos um erro acontecendo.

Quando vamos debugar esse erro, quando vamos depurar esse problema, vemos a stack trace, a pilha de execução, aquele rastro que a execução nos deixa para darmos uma olhada no que está acontecendo.

Já com microsserviços, como eu falei, isso não acontece. Porque eu tenho um serviço que faz uma chamada para outra e um terceiro microsserviço quebra. Como eu vou debugar esse primeiro? Eu não consigo, não tenho uma pilha de execução.

Então os logs são utilizados para rastrearmos as chamadas, para fazermos o que chamado de tracing. De novo, existem serviços que organizam esse tracing, o que veríamos, o que enxergamos como uma stack trace, então bastante intuitivo.

Então precisamos realizar logs e agregar até para rastrear chamadas. E temos que ser capazes de reconstruir toda uma operação a partir de um identificador.

Então por exemplo, um cliente chamou, fez uma requisição, isso vem para um edge service.

Esse edge service precisa gerar um identificador dessa chamada e vai passar para um serviço de negócio, esse serviço de negócio recebe esse identificador, chama para o serviço de domínio, esse serviço de domínio pode chamar algum outro serviço de data, um outro data service e ele pode até armazenar isso no banco de dados.

O ponto é, esse rastreador é enviado para todos os serviços que fazem parte dessa operação e todos eles utilizam esse ID, esse identificador para realizar os logs.

E a partir disso conseguimos gerar o equivalente a uma call stack ou uma stack trace, ou seja, a pilha de execução de chamadas. Então conseguimos através desse trace ID gerar uma pilha de execução. Devemos estudar sobre padrões de trace ID.

Existem formatos de ID que podemos gerar, como transferir esses dados, então não precisamos inventar a roda. Eu vou pegar o ID do usuário, multiplicar pelo horário e gerar um base 64, esse é o meu trace ID. Eu não preciso quebrar a cabeça com essas regras, já existem padrões, podemos pesquisar e escolher o que melhor nos atende.

E claro, precisamos usar ferramentas de gerenciamento específicas para visualizar essas chamadas, essas call stacks ou essas stack traces, essas pilhas de execução. Então as APMs, application performance management, essas ferramentas nos fornecem normalmente alguma forma de agregar esses logs e transformar em uma call stack.

Então pesquise sobre essas ferramentas, as conheça, estude, porque você com certeza vai precisar debugar uma aplicação em algum momento e isso vai fazer toda a diferença.

Então já falamos bastante sobre log, não quero me tornar repetitivo, então vamos falar sobre um outro detalhe que vem a partir de logs, ou às vezes nem precisa de logs, que são as métricas do nosso sistema. Mas vamos falar sobre isso no próximo vídeo.