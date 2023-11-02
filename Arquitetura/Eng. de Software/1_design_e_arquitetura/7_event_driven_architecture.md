# Event driven architecture
A arquitetura orientada a eventos é um padrão arquitetural que visa resolver alguns problemas encontrados no modelo de requisições. Por exemplo, ao adicionar um item ao carrinho em um ecommerce, no modelo convencional, é feita uma requisição para o servidor que deve aguardar o retorno após ser feita a adição do item no carrinho, a separação no estoque, o processamento de outros dados etc. Note que esse processo todo envolve muitos processamentos diferentes que só atrasam a response para o nosso usuário final, ainda de maneira que, caso aconteça algum erro durante o processamento de alguma das atividades do fluxo, o ciclo inteiro falha e retorna com erro ao client.

![Alt text](/src/img/modelo_de_requisicao.png)

Assim, surge a alternativa da arquitetura orientada a eventos, onde para o mesmo exemplo, a requisição é feita para uma API gateway, que será responsável por disparar os eventos para um microserviço de colocar o item no carrinho, para um serviço de reservar o estoque entre outros, de forma que, independente do resultado e demora desse processamento, a resposta já voltou para o client, cabendo ao processamento por debaixo dos panos terminar de resolver todas as suas tarefas. Para isso, é utilizado o sistema de mensageria citado nos artigos anteriores.

![Alt text](/src/img/event_driven_architecture.png)

## Vantagens e desvantagens
- Desvantagens
    - Aumento exponencial de complexidade da aplicação
- Vantagens
    - Ganho de escalabilidade: A partir do momento que o processamento da nossa aplicação está dividido em vários micro serviços, nós passamos a desfrutar de uma escalabilidade horizontal, que é uma escalabilidade onde se eu tiver por exemplo um uso muito mais acentuado do serviço de visualização de produtos, basta que eu aumente o número de instâncias de servidores rodando esse serviço, enquanto um serviço de adicionar a lista de desejos, que é menos utilizado, pode continuar rodando em menos instâncias, de acordo com a sua demanda.