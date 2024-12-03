# API Gateway
![AAA](/src/img/api-gateway.png)

Uma API gateway nada mais é que um portão de entrada unificado para as demais APIs de um sistema, geralmente utilizado na arquitetura de microserviços, visto que cada serviço disponibiliza uma API diferente, em servidores diferentes.

Aqui, o gateway fornece um proxy, uma fachada para as necessidades reais, de modo a expor apenas aquilo o que faz sentido, e esconder seu ambiente interno.

Porém, o fato de uma API gatweay ser um único portão de entrada para sua aplicação a torna vúlnerável, de modo que se você tiver uma falha nessa API gateway, toda a sua aplicação ficará indisponível. Dessa maneira, é extremamenta necessário que o gatweay seja altamente monitorado.

Uma API gateway conta também com outras funcionalidades além do roteamento, como autenticação, logs, caching entre outros.

## Comportamentos do gateway
- Simplesmente autorizar e redirecionar os request
- Uso de decorator para adicionar informações necessários aos requests
- Limitar o acesso ao conteúdo trafegado