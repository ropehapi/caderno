# Go
Antes de mais nada: Tem um levantamento do porque eu escolhi estudar a linguagem Go no meu [Notion]("https://marked-bakery-837.notion.site/An-lise-Node-x-Golang-219f881022c94a06ad11cf81e4d6a2cf")

## Introdução
A linguagem [Go]("https://go.dev"), também conhecida como GoLang, é uma linguagem open source que foi criada pelo Google em 2007, e desde então é utilizada para a construção de produtos e serviços de grande escala. Atualmente a linguagem é utilizada por diversas empresas, como Uber, Twitch, Medium e Mercado livre.

Go é uma linguagem simples e produtiva de se utilizar, com foco no desenvolvimento de aplicações que necessitam de alta performance.

## Algumas características notáveis sobre o GO
- Compilada
- Estaticamente tipada
- Paradigma de programação concorrente
- Única e exclusivamente Backend

## Instalação
[Documentação de instalação da linguagem]("https://go.dev/doc/install")

### Ubuntu
1. Faça o download do arquivo `.tar` do Go e navegue com o terminal até a pasta aonde o arquivo foi baixado. Use o comando abaixo para extraí-lo em sua pasta `/usr/local`:
    > $ `sudo tar -C /usr/local -xzf nome-arquivo`

2. Em seguida precisamos adicionar o caminho `/usr/local/go/bin` no `PATH` do sistema. Você pode fazer isto adicionando uma linha extra no arquivo `/etc/profile`, por exemplo com o editor de textos gedit. Abra o arquivo `/etc/profile` com o gedit utilizando o comando abaixo:
    > $ `sudo gedit /etc/profile`

3. E em seguida adicione a seguinte linha no final do arquivo:
    > `export PATH=$PATH:/usr/local/go/bin` 

4. Salve a alteração e feche o editor.

5. Agora utilize o comando:
    > $ `source /etc/profile`

O Go já deve estar funcionando com sucesso! Faça o teste em seu terminal com o comando go version e veja se a versão e os comandos do Go foram exibidos corretamente.

## Configurando o workspace
Para utilizarmos a linguagem de programação Go devemos seguir algumas convenções, e a principal delas é a sua organização de pastas no seu Workspace.

O Workspace padrão do Go é um diretório chamado `/go` que fica na pasta do seu usuário em seu sistema operacional. No Windows esta pasta normalmente se encontra em `C:/Users/seu-usuario/` , e nos sistemas Unix ( MacOS e distribuições do Linux) normalmente se encontra em `/home/seu-usuario/`.

Dentro deste diretório `go` devem conter as seguintes pastas: `bin, pkg, src`.

A **bin** , onde ficará os compilados do nosso código Go.

A **pkg**, onde ficará os pacotes compartilhados das nossas aplicações, pois o Go é uma linguagem bastante modular, dependendo bastante de pacotes que vamos importando ao longo de nossos códigos.

A **src**, onde escreveremos o código fonte de cada aplicação.

Por último, vamos precisar configurar nosso editor de texto (Vscode no caso). Para isso, basta criar um arquivo `.go` que o editor automáticamente vai pedir para instalar as extensões recomendadas, basta instalar e seguir em frente.

## O "Hello World"
Para construirmos o nosso primeiro programa em Go, primeiramente devemos entender algumas instruções iniciais dele. Se queremos que o nosso programa seja um executável, ou seja, se queremos que depois o programa seja executado no nosso computador, devemos declarar o programa assim:

    package main

Essa linha informa que o nosso programa será o principal pacote da nossa aplicação, e que o nosso código deve começar por ele. Além disso, todo programa principal tem a função principal. As funções em Go são declaradas com `func`, seguida do seu nome e os argumentos entre parênteses, com o bloco de código ficando entre chaves:

    package main

    func main() {

    }

Uma das características da função principal é não retornar nada e nem receber argumento nenhum. Quando executamos o programa, essa função é iniciada, e quando ela é finalizada, o programa termina.

### Exibindo uma mensagem
Se queremos imprimir uma mensagem, devemos utilizar a função `Println`, mas para utilizá-la, devemos importá-la, do pacote `fmt`. Esse é um pacote de formatação, possuindo funções de impressão e escaneamento do texto:

    package main

    import "fmt"

    func main("Hello world") {

    }

O fato da função `Println` estar com a primeira letra maiúscula pode causar uma estranheza para quem vem de uma outra linguagem de programação. Quando estamos trabalhando com Go, a função que vem de um pacote externo, ou seja, uma função que não está declarada no nosso arquivo, é utilizada com a primeira letra maiúscula. Nós chamamos o pacote externo (no nosso caso, o `fmt`), e a função com a primeira letra maiúscula (no nosso caso, `Println`). Isso é uma convenção da linguagem, que faz com que saibamos que a função veio de um pacote externo.

## Executando um programa em Go
Como Go é uma linguagem compilada, para executar um programa seu, devemos compilá-lo para um executável, e para isso, nós devemos utilizar o terminal/linha de comando.

Nele, nós entramos dentro da pasta `go/src/` e executamos o comando go build seguido do nome do programa que queremos executar:
> $ `go build programa.go`

Se não obtivermos nenhum erro na compilação, um executável será criado. Para executa-lo, basta rodar um:
> $ `./programa`

Toda vez que alterarmos o nosso código, devemos compilá-lo para depois executá-lo, mas o Go é uma linguagem que facilita muita coisa para nós, e isso inclui o processo de compilação. Em vez de executar o `go build`, para depois rodar o executável gerado, podemos executar o comando `go run` seguido do nome do programa que queremos executar:
> $ `go run programa.go`



