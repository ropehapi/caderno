# **API REST com Go**
Antes de mais nada: Afim de documentar todo o processo da construção dessa API, que será uma API que retorna dados sobre personalidades, eu descreverei todos os detalhes pertinentes ao projeto, mesmo que sejam coisas que deveriam ser inferidas em razão de lógica de programação e todas as minhas outras anotações.

## **Preparando o ambiente**
Antes de mais nada: Visando ter um ambiente comum para todas as ocasiões, iremos usar o Docker para conteinerizar nosso banco de dados por enquanto. Como Docker não é o alvo dessas anotações, apenas explicarei o fluxo para subir o ambiente usando o Docker.

Caso deseje, esse repositório tem um tópico sobre Docker [aqui](https://github.com/ropehapi/caderno/Tecnologias/Docker).

### **O Docker compose**
Para subirmos um container com um banco de dados postgres, devemos subir o docker compose descrito abaixo, rodando o `docker compose up`.

    version: '3'
    services:
    postgres:
        image: "postgres"
        environment:
        - POSTGRES_USER=root
        - POSTGRES_PASSWORD=root
        - POSTGRES_DB=root      
        ports:
        - "5432:5432"
        volumes:
        - ./migration/docker-database-initial.sql:/docker-entrypoint-initdb.d/docker-database-initial.sql   

    pgadmin-compose:
        image: dpage/pgadmin4
        environment:
        PGADMIN_DEFAULT_EMAIL: "gui@alura.com"
        PGADMIN_DEFAULT_PASSWORD: "123456"
        ports:
        - "54321:80"
        depends_on:
        - postgres

Basicamente, esse `docker-compose.yml` vai subir um container postgres, e rodar uma "migration" contendo as instruções iniciais para criação e população do banco. Essa migration está descrita abaixo:

    create table personalidades(
        id serial primary key,
        nome varchar,
        historia varchar
    );

    INSERT INTO personalidades(nome, historia) VALUES
    ('Deodato Petit Wertheimer', 'Deodato Petit Wertheimer foi um médico e político brasileiro, seus primeiros anos de vida foram em São Paulo, mas logo mudou para Nova Friburgo no Estado do Rio de Janeiro e com 11 anos de idade ingressou no Colégio Anchieta dos jesuítas.'),
    ('Carmela Dutra', 'Carmela Teles Leite Dutra foi a primeira-dama do Brasil, de 31 de janeiro de 1946 até a sua morte, tendo sido a esposa de Eurico Gaspar Dutra, 16.º Presidente do Brasil. Era, carinhosamente, chamada de Dona Santinha, pela sua forte religiosidade, fazendo seu marido abrir uma capelinha no Palácio Guanabara.');

Para acessarmos esse banco de dados, basta acessar o painel do pg-admin através do endereço `localhost:5432` e informar os dados de acesso definidos no arquivo `docker-compose.yml`.
## **Modularização de código**
O Go dispõe de um gerenciador de dependências integrado, essas dependências são chamadas de módulos, que podem ser manipuladas a partir da ferramenta  [go mod](https://go.dev/ref/mod).

Antes de iniciarmos qualquer projeto, devemos criar um arquivo para gerenciar as dependências do projeto, através do comando init.

> go mod init nome-projeto

Esse comando gerará um arquivo `go.mod`, contendo algumas parametrizações do projeto e todas as suas dependências.

Outro efeito do `go mod init`, é que a partir desse momento, não precisaremos estar dentro do `$GOPATH` para desenvolvermos nossas aplicações.

### **A arquitetura**
Afim de que possamos modularizar mais ainda nosso código, faremos uma divisão lógica e estrutural no código que atenda a uma arquitetura MVC (Model, view, Controller), dispondo de um router que servirá como um terminal para as requisições.

*Ps: Por não se tratar do foco dessas anotações, vou me abster de comentar mais sobre a "arquitetura" MVC.*

## **Router**
Um router serve como o terminal da sua aplicação, onde todas as requisições baterão, ficando a cargo da aplicação distribuir as responsabilidades para o resto do sistema.

Nesse caso, usarei o [GorillaMux](https://github.com/gorilla/mux), que tem seu guia de instalação na documentação da lib.

## **Na controller**
Para devolvermos uma resposta esperada pela API, devemos fazer com que a nossa controller devolva os nossos dados encodados, da seguinte maneira:

    func TodasPersonalidades(w http.ResponseWriter, r *http.Request) {
        json.NewEncoder(w).Encode(models.Personalidades)
    }
### **Respondendo Json**
Para encodar uma resposta de por exemplo uma struct em json, podemos fazer o seguinte:

    type Personalidade struct {
        Nome     string `json:"nome"`
        Historia string `json:"historia"`
    }   

    var Personalidades []Personalidade
