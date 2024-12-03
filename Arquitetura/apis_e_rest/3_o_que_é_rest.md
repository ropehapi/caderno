# O que é REST
REST é um acrônimo que significa Representational State Transfer. 

Um dos princípios do rest é que a comunicação ocorra entre clientes e servidores, sendo os servidores responsáveis por fornecer recursos a partir das requisições feitas pelos clients

Outro princípio muito importante do rest é que a aplicação deve ser Stateless, ou seja, ela não pode guardar dados do estado da aplicação e relação com o cliente através de cookies e sessões, mas sim deve conter todos os dados do estado da aplicação dentro de cada requisição, como através de um token JWT por exemplo. Dessa maneira, o servidor não vai mais precisar criar um arquivo de sessão dentro dele contendo os dados daquele client.

Outro ponto que define o rest é a interface uniforme. Essa interface uniforme prevê que haja uma linguagem comum entre clientes e servidores. Essa interface consiste em diversos pontos, como:
    - Ter recursos identificaveis
    - Mainupulação de recursos através de representações
    - Semântica dos verbos HTTP
