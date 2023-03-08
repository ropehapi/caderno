# **Clean architecture**
![Clean architecture](/src/img/clean_architecture.jpg)


*Antes de mais nada, [aqui está](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) um link para um artigo do próprio uncle bob que contém uma explicação muito melhor do assunto.*
## **Introdução**
A clean architecture (ou arquitetura limpa) é uma arquitetura de software que visa padronizar e organizar o código desenvolvido, favorecer a sua reusabilidade, assim como independência de tecnologia.

Por muito tempo, foi-se considerado que padrões arquiteturais como o MVC (Model-view-controller) eram arquiteturas completas. Porém, esses padrões tinham comportamentos e estruturas bem definidos para a camada de controle e de visualização, mas não era tão bem definido o que deveria estar na model. Como organiza-la? É tudo uma camada? A mesma camada deveria cuidar da persistência + regra de negócio?

Afim de responder a essas perguntas e resolver essas questões, surgem diversos padrões arquiteturais que visam organizar e estruturar essa camada de modelo, e uma delas é a clean architecture.

## **A camada entities**
Sendo o núcleo de todas as camadas da clean architecture, a mais interna e mais isolada, a camada entities é uma camada onde teremos classes que representam entidades na nossa regra de negócio, como uma pessoa por exemplo. E é nessa camada de entidades, que deve ficar nossa regra de negócio pertinente àquela entidade(Por exemplo a validação de eu só poder persistir aquele dado do meu cliente no banco apenas se ele tiver mais de 18 anos).

Porém, para acessar a nossa camada de entidade, a gente não chega direto através da WEB e acessa a nossa entidade de acordo com a clean architecture. Isso por que nós teriamos código repitido caso quiséssemos executar essas regras tanto através da WEB, quanto através da CLI, através da requisição de um sistema externo etc. Então para isso, temos as use cases.

## **A camada use cases (Ou application service)**
A camada de use cases nada mais é que uma camada onde as classes organizarão o fluxo da regra de negócios, semelhante aquilo que no MVC puro, o controller faria. Porém aqui nesse caso, nós trazemos essa responsabilidade para uma classe que nao depende da web, permitindo que ela seja chamada através de uma requisição HTTP, de um comando CLI etc.

Dessa forma, ficamos agnosticos do mecanismo de entrega.

## **A camada de adaptadores**
Camada onde temos alguns detalhes da nossa infraestrutura, como as controllers da nossa aplicação, alguns adapters de detalhes do framework, como por exemplo uma interface que me permite adaptar uma ferramenta externa de envio de emails. Sua responsabilidade é pegar o mundo externo (WEB, DB, qualquer coisa de infra) e trazer de forma que nosso use case possa entender.

## **A camada mais externa**
Nessa camada fica nosso framework WEB, a porópria WEB, a interface gráfica, qualquer interface externa (endpoints de uma API), banco de dados etc. Essa camada nao tem nenhuma regra do nosso negócio

## **Direção do fluxo da aplicação**
Podemos notar na representação gráfica da arquitetura que existe uma seta que vai de fora pra dentro da aplicação.

Isso implica em dizer que em nossa aplicação, apenas as camadas mais externas devem ter controle das camadas internas, e não o contrário. Isso jamais deve acontecer pois uma regra do meu negócio não pode precisar ser adaptado de acordo com algo da minha camada mais externa como o meu banco de dados por exemplo.