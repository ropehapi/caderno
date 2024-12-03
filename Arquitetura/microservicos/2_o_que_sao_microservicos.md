# O que são microserviços
Antes de entendermos o que são os microserviços, é importante que tenhamos em mente a que ele é uma alternativa, no caso, a arquitetura de microserviços se trata de um padrão arquitetural alternativo ao modelo monolítico, que é o modelo padrão que aprendemos quando começamos a programar.

## Monolitos
Monolito é um padrão arquitetural onde toda a nossa aplicação se encontra em um servidor aplicacional, responsável por lidar sozinho com todas as regras de um negócio inteiro. Esse padrão apresenta alguns problemas, como:

- Demoras no deploy
- Falhas podem derrubar o sistema todo
- 1 projeto = 1 tecnologia

## Microserviços
![Alt text](/src/img/arquitetura-de-microservicos.png)
Microserviços são uma abordagem arquitetônica e organizacional do desenvolvimento de software na qual o software consiste em pequenos serviços independentes que se comunicam usando APIs bem definidas. Esses serviços pertencem a pequenas equipes autossuficientes. 

Por Exemplo, em um ecommerce, podemos ter para a parte da vitrine vários serviços independentes, de modo que, quando o serviço de carrinho por exemplo não estiver funcionando, o serviço de catálogo, pedidos, área do cliente etc continuam funcionando.

Antes dos serviços em si, deve existir uma camada de API gateway, que serve como um hub que conecta todos esses serviços, distribuindo cada requisição para seu devido serviço.

É importante notar que a partir do momento em que temos nosso software arquitetado dessa maneira, cada serviço pode ser construído com uma tecnologia diferente, visto que todos os serviços se comunicariam de maneira assíncrona através de mensagens escritas em JSON.

Assim sendo, aqui estão os pontos positivos da arquitetura de microserviços:
- Projetos independentes = tecnologias independentes
- Falha em 1 serviço é isolada
- Deploys menores e mais rápidos
- Maior escalabilidade horizontal

Em contrapartida, essa arquitetura apresenta diversos desafios, como:
- Maior complexidade de desenvolvimento e infra
- Debug mais complexo
- Comunicação entre os serviços deve ser bem pensada
- Diversas tecnologias pode ser um problema
- Monitoramento é crucial e mais complexo

## Monolito por padrão
![Alt text](/src/img/monolito-por-padrao.png)