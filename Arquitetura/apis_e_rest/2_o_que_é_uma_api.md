# O que é uma API
Uma API (Application programming interface) é um conjunto de rotinas e padrões estabelecidos por um software para a utilização de suas funcionalidades por aplicativos que não pretendem envolver-se em detalhes da implementação do software, mas apenas por seus serviços.

## Exemplo
Quando você vai a um restaurante, você (client) não pretende saber sobre o processo feito por trás do seu pedido, você só faz o pedido (request) para o garçom (API) que leva o seu pedido para a cozinha e volta com o seu pedido pronto (response) em mãos, sem a necessidade de vc ter se preocupado com o que foi feito na cozinha.

## Tipos de apis mais comuns
- APIs web
    - Geralmente, é delas que estamos falando quando falamos de APIs
- APIs de código fonte. Nesse modelo, temos clients fazendo requisições HTTP que devolverão os dados através da response.
    - Lembrando que interfaces de código também são APIs, portanto quando usamos o Carbon no Laravel por exemplo para retornar a data, se trata do uso de uma API, pois o carbon nos abstrai da regra por trás de pegar a data do computador.

## Padrões de API Web
- RPC
- SOAP
- REST