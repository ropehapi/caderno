# **Hexagonal architecture**
Decisões de como organizar nosso código de forma que ele continue "utilizável" após determinado período é o propósito mais simples de uma arquitetura.

Nesse artigo vamos conhecer um pouquinho sobre a famosa `Arquitetura Hexagonal`, ou `Ports & Adapters`. Vamos entender seus principais pontos e como esse padrão arquitetural sugere que nós organizemos nosso código.

## **O que é uma arquitetura**
Antes de mais nada, precisamos entender melhor o que é uma arquitetura. 

Uma arquitetura é o estudo que ajuda a definir como cada um dos componentes vão conversar entre si dentro da aplicação.

Então, quando falamos de uma arquitetura de software, principalmente sobre padrões arquiteturais, a gente está falando em como vamos organizar os componentes diferentes dentro do nosso código.

- Definir quais componentes criar
- Como os componentes serão organizados na aplicação

## **A ports and adapters ou Arquitetura Hexagonal**
![Ports and adapters architecture](/src/img/ports_and_adapters_architecture.png)

Também chamada de Ports and Adapters, a arquitetura hexagonal é uma forma de organizar o código em camadas, cada qual com a sua responsabilidade, tendo como objetivo isolar totalmente a lógica da aplicação do mundo externo. Este isolamento é feito por meio de Portas e Adaptadores (daí o nome Ports and Adapters), onde as Portas são as interfaces que as camadas de baixo nível expõe, e Adaptadores as implementações para as interfaces em questão. 

O isolamento da aplicação vale tanto para entrada de dados quanto saída. Isso significa que o código deve ser agnóstico à forma de acesso, e também ao(s) mecanismo(s) de persistência, envio de notificações, etc.

E o mais interessante, é que tanto a ports and adapters architecture quando a clean architecture (arquiteturas com a mesma finalidade, isolar o domínio), não ditam como devemos organizar a nossa camada de domínio, abrindo espaço para que exploremos diversas práticas de design de código (Como por exemplo um DDD).

Trazendo um exemplo em software: Podemos ter uma aplicação que tenha a ação cadastrar aluno. Porém, essa ação pode ser disparada de diversos lugares e maneiras diferentes, através de um comando em um console, uma requisição em uma api entre outros. Ambas as chamadas farão a mesma coisa na camada de domínio, porém cada uma teve um tratamento diferente na camada externa da aplicação. Já na saída desses dados, para por exemplo a persistência em um banco de dados, ela pode ser feita de várias maneiras diferentes, seja em um banco MySQL, seja um MongoDB, basta que tenhamos um adapter de saída diferente para cada tipo de persistência.

## **Os dois tipos de adapters**
Existem dois tipos de adapters, os primary e os secondary adapters, onde:

- Primary adapters: Recebem dados e enviam pra nossa regra de negócio. (Requisição Http, CLI)
- Secondary adapters: Pegam dados da nossa regra de negócio e enviam pra fora da aplicação. (Enviando os dados para um banco, para uma mensageria)