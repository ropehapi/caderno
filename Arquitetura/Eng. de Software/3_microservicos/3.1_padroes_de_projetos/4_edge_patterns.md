# Edge patterns
Como eu falei, já entendemos um conceito de um API Gateway ou só gateway e eu falei que existia a possibilidade de termos gateways específicos para cada um do cliente. E o nome disso, desses gateways específicos, é o edge pattern.

Como eu falei lá naqueles tipos de serviços, existe um tipo de serviço um pouco mais próximo do cliente. Então isso é basicamente um gateway específico para determinados clientes, que vai ter um foco nas necessidades reais daqueles clientes.

E quando eu falo cliente, podemos interpretar como um cliente HTTP, alguém que vai chamar nossa API, por exemplo, ou cliente de negócio mesmo. Eu posso ter uma empresa que fornece criação de formulários e o cliente X precisa de formulário de uma forma, o cliente Y precisa de um formulário com uma pequena modificação.

Então ao invés de modificar nossa lógica de negócios eu crio um novo edge, eu crio um novo serviço na frente, que vai receber a resposta desse formulário e modificar um pouco para esse cliente. Isso também é possível.

Mas pensando nesse processo da Alura, por exemplo, eu tenho um vídeo sendo exibido no navegador e eu tenho um vídeo sendo exibido no aplicativo móvel. Eu posso ter gateways específicos, ou seja, um edge service para cada um desses tipos de clientes e no meu navegador, além de mostrar o conteúdo, eu vou ter a transcrição, vou ter as perguntas relacionadas a esse vídeo.

Já no celular, no aplicativo móvel, eu só vou exibir o vídeo, só vou entregar a URL para o vídeo, não vou passar a transcrição, não vou passar os detalhes de fórum, os exercícios, nada, eu posso ter isso com o foco em cada uma das especificidades do cliente.

Então essa é a beleza de um edge pattern e inclusive existem projetos que só trabalham com edge patterns, com edge services e não com API Gateways, ou seja, não existe um ponto único, existe um ponto único de entrada para cada tipo de cliente. Então essa é uma realidade, é uma forma de pensarmos e desenvolver, cabe você analisar o que faz mais sentido.

Então quando vamos construir uma ponta de nossos microsserviços, ou seja, um edge service, um serviço de ponta, vamos identificar as necessidades específicas desse cliente e vamos fornecer contratos específicos desse cliente. Então a URL pode mudar.

O que o aplicativo móvel consome pode ser diferente do que o navegador consome, a URL é outra, o recurso é outro. Vamos realizar as modificações para que os dados que são transferidos, vamos modificar para que esse processo seja otimizado.

Então por exemplo, no aplicativo móvel eu não vou fornecer, eu não vou transferir, eu não vou buscar os detalhes do fórum, os detalhes da transcrição, só mandar o vídeo. Já na web, eu preciso de mais informações, então eu vou buscar todos esses dados.

Então como eu comentei, existe a possibilidade de ter apenas edge services e não gateways, nenhuma API Gateway, ou seja, nenhum ponto único de entrada e sim pontos para cada um dos clientes.

Então essa é a ideia por trás de um edge service, você vai se adequar ao seu cliente, a cada tipo de cliente ou cliente em si de negócio, você vai se adequar para que o processo seja otimizado, para não consumirmos banda desnecessária no celular, por exemplo, para que não falte informação para a web, esse tipo de coisa.

Agora que já falamos sobre processo, de como conversar entre microsserviços, de como agregar microsserviços melhor dizendo, vamos falar sobre como podemos lidar com os dados. Alguns padrões que nos auxiliam nesse cenário, nesse lado do desenvolvimento. Vamos conversar sobre isso no próximo capítulo.