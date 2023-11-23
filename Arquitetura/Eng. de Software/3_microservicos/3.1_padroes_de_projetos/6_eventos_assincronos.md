# Eventos assíncronos
Vamos falar sobre outro detalhe, outro assunto bastante complexo que é o de eventos, especificamente de eventos assíncronos. E eventos por si só é bastante complexo, é um assunto bastante vasto.

Nós temos eventos de domínio sobre os quais conversamos nos treinamentos de DDD da Alura, existe um conceito chamado de event sourcing, que é ter toda a base dos nossos dados através de eventos, um evento modifica os dados, se eu quero reconstruir os dados, eu tenho uma lista de eventos.

Mas o que vamos falar aqui é um pouco menos complexo e vamos falar sobre eventos que acontecem, mas a necessidade deles acontecerem de forma assíncrona. Então, de novo isso, é muito ligado a microsserviços e não a arquitetura orientada a eventos, a event sourcing.

Então existem cenários onde algum problema não pode, sob hipótese nenhuma ser resolvido na hora, ser resolvido em tempo real. Existem alguns cenários para isso, por exemplo, quando você se matricula na Alura existe um processo de validação antifraude para garantir que o seu cartão é válido, que seu cartão é seu e isso pode ser um processo muito demorado.

Então o que acontece? Inserimos os nossos dados, clicamos em se matricular e recebemos uma resposta: “Seu pagamento está sendo processado”, “Sua matrícula está em aprovação” ou até em alguns cenários você está matriculado só que no processo de validação está acontecendo por baixo dos panos. Então para isso nós temos eventos assíncronos.

Temos um serviço, por exemplo o serviço de matrícula, que é um business service, que envolve um processo, ele vai emitir um evento, por exemplo o evento “Aluno realizou o pagamento”, “Aluno se matriculou”, alguma coisa do tipo.

E aí algum outro serviço vai pegar esse evento e vai realizar o processamento que é necessário. Por exemplo, verificar fraude, verificar a cobrança no cartão, realizar dados de métricas de pagamento, enfim, pode realizar determinados serviços, só que para isso o aluno, o cliente não ficou esperando.

Então por isso que falamos que é um evento assíncrono. O aluno recebeu a resposta dele, ele recebeu a informação de que algo vai ser processado depois, mas estamos processando enquanto isso sem prender o aluno, de forma assíncrona.

Um cenário um pouco mais simples, que nem sempre é feito de forma assíncrona, é simplesmente enviar um e-mail. Imagina que você tem um formulário de contato, então você digita esse formulário de contato para entrar em contato com a Alura. Quando você clica pode acontecer de o servidor receber a requisição, enviar o e-mail para Alura e depois de enviar te manda a resposta informando: “Enviamos o e-mail”.

Mas se você quiser algo um pouco mais rápido, você pode clicar nesse botão e o processamento vai ser feito assim: Existe um pedido para envio de e-mail, salvei em uma fila que está em memória muito rápida e já respondo para o aluno falando: “O seu e-mail foi enviado”.

E depois de devolver a resposta, aí sim eu vou tentar enviar esse e-mail. Caso falhe o envio desse e-mail eu tento de novo, notifico o aluno depois falando: “Não conseguimos enviar sua mensagem”, alguma coisa do tipo.

Então nesses cenários, tanto da matrícula quanto o mais simples que é enviar um e-mail, as tecnologias como filas de mensagerias, como RabbitMQ e ZeroMQ e serviços de stream de dados, como o Kafka, eles brilham, eles são ferramentas exatamente para isso, para esses cenários, para a distribuição de mensagens assíncronas, de eventos, de dados assíncronos.

Quando trabalhamos com microsserviços, nós pensamos obviamente em escalabilidade, em performance e serviços assíncronos são uma forma de lidarmos com dados que chegam para a nossa aplicação e que devemos fornecer para alguma outra aplicação, para o próprio cliente.

Então eventos assíncronos, como eu já falei, são um assunto muito complexo, nos treinamentos de DDD falamos sobre eventos de domínio, mas ainda assim tem muita coisa para tratarmos, mas isso é importante de sabermos que é um padrão que precisamos conhecer, que precisamos estudar na hora que formos lidar com microsserviços.

Agora que já falamos bastante sobre integração de serviços, comunicação entre os serviços, separação de serviços, lidar com dados, vamos falar um pouco sobre as operações que envolvem os microsserviços, como monitorar, fazer log, enfim.

O que envolve a operação de uma infraestrutura de microsserviços. Vamos conversar um pouco, de novo, bastante alto nível sobre esses detalhes no próximo capítulo.