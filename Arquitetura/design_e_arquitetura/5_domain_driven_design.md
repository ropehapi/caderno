# Domain driven design (DDD)
O DDD ou o desenvolvimento orientado a diz que seu código precisa refletir a realidade do negócio

## Técnicas para a implementação
### Padrões estratégicos (Conceitual)
- Linguaguem Ubíqua (Onipresente)
    - Ex: Se eu tenho um conceito no meu domínio que é o meu aluno, meu código precisa refletir isso tendo uma classe chamada aluno.
- Contextos delimitados
    - Quando temos módulos maiores na nossa aplicação
    - Ex: Por exemplo na Alura, temos contextos diferentes dentro de uma mesma aplicação, uma relacionada ao streaming das aulas, outro à pontuação e gameficação dos alunos, outra relacionada ao financeiro, dessa maneira, nós conseguimos delimitar esses contextos e separa-los, podendo inclusive, no futuro, trazer sistemas separados para cada uma dessas partes.
- Domínio e subdomínio
    - Nesse padrão, existe um core domain que é o responsável pelo principal domínio de uma aplicação, como a parte acadêmica do sistema da alura, por exemplo. Dessa maneira, os outros domínios como a gameficação, atuam como satélites em volta do core domain.

### Padrões táticos ou blocos de construção (Desenvolvimento)
Os padrões táticos, que nada mais são que as formas de implementação disso no desenvolvimento, muitas vezes já são utilizados por nós e nós nem sabemos. Alguns exemplos de padrões táticos são:

- Entidades
- Repositórios
    - Fazem a tratução de entidades para a camada de persistência
    - Ex: AdicionarAluno, RemoverAluno
- Eventos
    - Um evento que é disparado
    - Ex: Aluno foi matriculado
- Módulos
    - Módulos são um conceito direto do código
    - Aplicados dentro de um contexto, por exemplo módulo de aluno, módulo de instrutor, módulo de avaliação, mas tudo isso faz parte do contexto acadêmico.
- Serviços
    - Classe que representa uma ação, e não algo tangível como um aluno ou um instrutor, e sim uma operação, uma regra acontecendo, como por exemplo assistirCurso, marcarFormacaoConcluida etc

## E a arquitetura?
DDD Não é um padrão arquitetural, e sim uma filosofia de desenvolvimento que visa desenvolver seu código a partir do domínio da sua aplicação. Porém, no livro do DDD, é sugerido que se separe a aplicação em algumas camadas, sendo essas:

- User interface
    - É a camada que faz a interação com o usuário, onde é feita a requisição que vai para a camada de aplicação
- Application
    - A camada de use case
- Domain
    - Camada que contém os padrões táticos citados acima, onde nosso sistema realmente está, onde o negócio está modelado.
- Infrastructure
    - Onde fica tudo aquilo o que apoia o domínio, como comunicação com o banco de dados, geração de logs, envio de emails entre outros

Portanto, é muito comum que peguemos os conceitos do DDD e apliquemos dentro de algum padrão arquitetural, como o clean architecture, de forma traduzida