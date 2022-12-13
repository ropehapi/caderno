# **API REST com Go**
## **Modularização de código**
O Go dispõe de um gerenciador de dependências integrado, essas dependências são chamadas de módulos, que podem ser manipuladas a partir da ferramenta  [go mod](https://go.dev/ref/mod).

Antes de iniciarmos qualquer projeto, devemos criar um arquivo para gerenciar as dependências do projeto, através do comando init.

> go mod init nome-projeto

Esse comando gerará um arquivo `go.mod`, contendo algumas parametrizações do projeto e todas as suas dependências.

Outro efeito do `go mod init`, é que a partir desse momento, não precisaremos estar dentro do `$GOPATH` para desenvolvermos nossas aplicações.