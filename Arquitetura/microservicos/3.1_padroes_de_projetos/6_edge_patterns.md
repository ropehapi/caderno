# Edge Pattern - Aula sobre Microsserviços

## Introdução
Como mencionei anteriormente, já entendemos o conceito de um API Gateway, mas agora exploraremos uma variação chamada Edge Pattern, que se refere a gateways específicos para cada cliente.

## Edge Pattern
- É um tipo de serviço mais próximo do cliente.
- Focado nas necessidades reais de clientes específicos (clientes HTTP ou clientes de negócios).

## Exemplos Práticos
- Criação de formulários para diferentes clientes.
- Na Alura, ter um edge service para navegador (com transcrição e perguntas) e outro para o aplicativo móvel (apenas vídeo).

## Vantagens
- Permite ajustar o serviço para atender a requisitos específicos de diferentes tipos de clientes.
- Contratos específicos para cada cliente, URLs e recursos podem variar.

## Implementação
- Ao construir um edge service, identificamos as necessidades específicas do cliente.
- Contratos específicos são fornecidos para otimizar a transferência de dados.
  
## Escolha entre Edge Pattern e API Gateway
- Algumas aplicações utilizam exclusivamente edge services, sem um ponto único de entrada (API Gateway).
- A decisão depende da análise do que faz mais sentido para a aplicação.

## Conclusão
- Edge Pattern permite uma adaptação mais precisa às necessidades de cada cliente.
- Otimiza o processo, evitando transferência desnecessária de dados e garantindo informações adequadas para cada cliente.

## Próximo Tópico
No próximo capítulo, abordaremos como lidar com dados em microsserviços, explorando padrões que auxiliam nesse cenário de desenvolvimento.

Espero que esta explicação sobre Edge Pattern tenha sido clara. Nosso próximo tópico promete aprofundar ainda mais nossos conhecimentos sobre microsserviços, concentrando-se no gerenciamento de dados.
