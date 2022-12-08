# **Go**
Antes de mais nada: Tem um levantamento do porque eu escolhi estudar a linguagem Go no meu [Notion](https://marked-bakery-837.notion.site/An-lise-Node-x-Golang-219f881022c94a06ad11cf81e4d6a2cf)

## **Introdução**
A linguagem [Go](https://go.dev), também conhecida como GoLang, é uma linguagem open source que foi criada pelo Google em 2007, e desde então é utilizada para a construção de produtos e serviços de grande escala. Atualmente a linguagem é utilizada por diversas empresas, como Uber, Twitch, Medium e Mercado livre.

Go é uma linguagem simples e produtiva de se utilizar, com foco no desenvolvimento de aplicações que necessitam de alta performance.

## **Algumas características notáveis sobre o GO**
- Compilada
- Estaticamente tipada
- Paradigma de programação concorrente
- Única e exclusivamente Backend

## **Instalação**
[Documentação de instalação da linguagem](https://go.dev/doc/install)

### **Ubuntu**
1. Faça o download do arquivo `.tar` do Go e navegue com o terminal até a pasta aonde o arquivo foi baixado. Use o comando abaixo para extraí-lo em sua pasta `/usr/local`:
    > $ sudo tar -C /usr/local -xzf nome-arquivo

2. Em seguida precisamos adicionar o caminho `/usr/local/go/bin` no `PATH` do sistema. Você pode fazer isto adicionando uma linha extra no arquivo `/etc/profile`, por exemplo com o editor de textos gedit. Abra o arquivo `/etc/profile` com o gedit utilizando o comando abaixo:
    > $ sudo gedit /etc/profile

3. Adicione `export PATH=$PATH:/usr/local/go/bin` ao final do arquivo.

4. Salve a alteração e feche o editor.

5. Agora utilize o comando:
    > $ source /etc/profile

O Go já deve estar funcionando com sucesso! Faça o teste em seu terminal com o comando go version e veja se a versão e os comandos do Go foram exibidos corretamente.

## **Configurando o workspace**
Para utilizarmos a linguagem de programação Go devemos seguir algumas convenções, e a principal delas é a sua organização de pastas no seu Workspace.

O Workspace padrão do Go é um diretório chamado `/go` que fica na pasta do seu usuário em seu sistema operacional. No Windows esta pasta normalmente se encontra em `C:/Users/seu-usuario/` , e nos sistemas Unix ( MacOS e distribuições do Linux) normalmente se encontra em `/home/seu-usuario/`.

Dentro deste diretório `go` devem conter as seguintes pastas: `bin, pkg, src`.

A **bin** , onde ficará os compilados do nosso código Go.

A **pkg**, onde ficará os pacotes compartilhados das nossas aplicações, pois o Go é uma linguagem bastante modular, dependendo bastante de pacotes que vamos importando ao longo de nossos códigos.

A **src**, onde escreveremos o código fonte de cada aplicação.

Por último, vamos precisar configurar nosso editor de texto (Vscode no caso). Para isso, basta criar um arquivo `.go` que o editor automáticamente vai pedir para instalar as extensões recomendadas, basta instalar e seguir em frente.

## **O "Hello World"**
Para construirmos o nosso primeiro programa em Go, primeiramente devemos entender algumas instruções iniciais dele. Se queremos que o nosso programa seja um executável, ou seja, se queremos que depois o programa seja executado no nosso computador, devemos declarar o programa assim:

    package main

Essa linha informa que o nosso programa será o principal pacote da nossa aplicação, e que o nosso código deve começar por ele. Além disso, todo programa principal tem a função principal. As funções em Go são declaradas com `func`, seguida do seu nome e os argumentos entre parênteses, com o bloco de código ficando entre chaves:

    package main

    func main() {

    }

Uma das características da função principal é não retornar nada e nem receber argumento nenhum. Quando executamos o programa, essa função é iniciada, e quando ela é finalizada, o programa termina.

### **Exibindo uma mensagem**
Se queremos imprimir uma mensagem, devemos utilizar a função `Println`, mas para utilizá-la, devemos importá-la, do pacote `fmt`. Esse é um pacote de formatação, possuindo funções de impressão e escaneamento do texto:

    package main

    import "fmt"

    func main() {
        fmt.Println("Hello World")
    }

O fato da função `Println` estar com a primeira letra maiúscula pode causar uma estranheza para quem vem de uma outra linguagem de programação. Quando estamos trabalhando com Go, a função que vem de um pacote externo, ou seja, uma função que não está declarada no nosso arquivo, é utilizada com a primeira letra maiúscula. Nós chamamos o pacote externo (no nosso caso, o `fmt`), e a função com a primeira letra maiúscula (no nosso caso, `Println`). Isso é uma convenção da linguagem, que faz com que saibamos que a função veio de um pacote externo.

## **Executando um programa em Go**
Como Go é uma linguagem compilada, para executar um programa seu, devemos compilá-lo para um executável, e para isso, nós devemos utilizar o terminal/linha de comando.

Nele, nós entramos dentro da pasta `go/src/` e executamos o comando go build seguido do nome do programa que queremos executar:
> $ go build programa.go

Se não obtivermos nenhum erro na compilação, um executável será criado. Para executa-lo, basta rodar um:
> $ ./programa

Toda vez que alterarmos o nosso código, devemos compilá-lo para depois executá-lo, mas o Go é uma linguagem que facilita muita coisa para nós, e isso inclui o processo de compilação. Em vez de executar o `go build`, para depois rodar o executável gerado, podemos executar o comando `go run` seguido do nome do programa que queremos executar:
> $ go run programa.go

## **Declarando uma variável em Go**
Para declarar uma variável em Go, utilizamos a palavra `var` seguida do nome da variável mais o seu tipo. Como é um texto, o seu tipo será `string`, e vamos logo inicializá-la:
    
    var nome string = "Pedro"

Agora, para concatenar a frase com a variável, passamos a mesma para a função Println, separando os elementos por vírgula:

    package main

    import "fmt"

    func main() {
        var nome string = "Pedro"
        var versao float32 = 1.2
        var idade int

        fmt.Println("Olá sr.", nome)
        fmt.Println("Seu programa está na versão", versao)
    }

Notemos que ; são facultativos no Go

### **Variável sem valor atribuído**

No Go, quando não atribuímos um valor a uma variável, ela assume um valor zerado, ou seja, se for um inteiro, seu valor será 0, se for um número flutuante, seu valor será 0.0, e se for uma string, seu valor será uma string vazia.

### **Não utilização de uma variável**
Outra característica do Go é não podermos declarar uma variável e não utilizá-la. Por exemplo, se removermos a impressão da idade, teremos um erro na saída. Essa é mais uma convenção do Go, temos sempre que utilizar as variáveis que declaramos. Até por que, se não estamos utilizando a variável, não tem motivo dela estar ali.

### **Inferindo os tipos das variáveis**
o Go consegue inferir o tipo dessas variáveis. Ele consegue entender que, se a variável começa e termina com aspas, ela é uma string. Da mesma forma, se temos um número inteiro, sem casa decimal, o Go entenderá que a variável é do tipo inteiro.

Para saber se o Go conseguir inferir corretamente o tipo das variáveis, podemos descobri-los, importando o pacote reflect e chamando a sua função TypeOf, passando para ela a variável que queremos saber o tipo:

    package main

    import "fmt"
    import "reflect"

    func main() {
        var nome = "Pedro"

        fmt.Println("O tipo da variável nome é", reflect.TypeOf(nome))
    }

### **Declaração curta de variáveis**
Para deixar o nosso código mais limpo ainda, podemos remover a palavra `var` das variáveis. Podemos fazer isso pois o Go possui um segundo operador de atribuição de variáveis, um mais "curto", que é o `:=`. Quando utilizamos esse operador, estamos dizendo ao Go que estamos declarando uma variável e atribuindo um valor a ela:

    nome := "Pedro"
    idade := 24

### **Descobrindo o tipo de variáveis**
Ao passar para a função TypeOf do pacote reflect uma variável, nós obtemos o tipo daquela variável.

    import "reflect"

    func main(){
        reflect.TypeOf(nome)
    }

## **Capturando a entrada do usuário**

Para capturar o que o usuário escrever, existe a função `Scanf`, também do pacote `fmt`. Ela recebe dois argumentos, um modificador (o que queremos receber como entrada, um inteiro, string, etc) e um ponteiro para a variável que guardará a entrada do usuário.

    var comando int
    fmt.Scanf("%d", &comando)

o valor `"%d"`, que significa que esperamos receber um número inteiro, e a variável comando.

Se printarmos a variável `comando`, teremos o valor digitado.

### **Entendendo o ponteiro**

Sobre o `&` visto antes, ele significa o endereço da variável que queremos salvar a entrada, pois a função `Scanf` não espera uma variável, e sim o seu endereço, um ponteiro para a variável.

A variável nada mais é do que uma "caixa", onde guardamos dados. Essa "caixa" está em algum lugar da memória do nosso computador, e esse lugar, o endereço da nossa "caixa", é o que chamamos de ponteiro.

Para descobrir o endereço da variável, basta colocar o `&` à frente dela.

### **Devemos especificar o que esperamos ser digitado?**
A variável comando é do tipo inteiro, logo, só pode receber números inteiros. Se sabemos disso, por que devemos especificar que esperamos receber um número inteiro na função `Scanf`, através do modificador `"%d"`? Na verdade, nós não precisamos.

Alguém do Go também pensou nisso, por isso criou a função `Scan` (sem a letra f). Nela, nós não precisamos especificar o modificador que esperamos.

## **Controlando o fluxo do script**
### **Controle de fluxo com if**
A condição do `if`, no Go, não fica entre parênteses, como já é prática de outras linguagens, e a condição deve sempre retornar um booleano, ou seja, `true` ou `false`.
    
    if comando == 1 {

    }

### **Controle de fluxo com switch**
Além do `if`, sabemos que existem outras instruções para controlarmos o fluxo da nossa aplicação. E uma que se adéqua melhor ao nosso código é a instrução switch.

Essa instrução recebe uma variável e dá possíveis situações para cada valor dessa variável. Nós dizemos quais são os casos, e para cada um há uma situação. Caso a variável valha 0, acontece algo, caso valha 1, acontece outra, e assim por diante.

    switch comando {
    case 1:
        fmt.Println("Monitorando...")
    case 2:
        fmt.Println("Exibindo Logs...")
    case 0:
        fmt.Println("Saindo do programa...")
    }

Mas se o valor da variável não estiver em nenhum dos casos listados? Para isso, existe o caso `default`, que é o que será executado se os nossos casos não forem atendidos.

    default:
        fmt.Println("Não conheço este comando")

Para quem vem de outras linguagens de programação, pode estranhar o não uso do `break`, ao final do código de cada caso do switch. O `break` serviria para evitar a execução do código de mais de um caso, se mais de um caso for atendido.

No Go, ele não possui o `break`, pois somente um caso pode ser atendido. O primeiro caso que for atendido, terá o seu código executado e o switch será encerrado.

## **Funções**
Em go, a declaração de uma função segue a sintaxe a seguir:

    func nomeFuncao() tipoRetorno {
        var comandoLido int
        fmt.Scan(&comandoLido)

        return comandoLido
    }

É comum em Go, utilizarmos o padrão `camelCase` para nome das funções, ou seja, a primeira letra minúscula e a cada nova palavra, sua primeira letra será maiúscula, sem espaço entre elas.

## **Saindo do programa**
Para fazer isso com Go, precisamos importar o pacote que se comunica com o sistema operacional, o pacote `os`. Importando esse pacote, chamamos a sua função Exit, passando o valor 0 para ela, indicando para o sistema operacional que o programa foi encerrado com sucesso.
    
    os.Exit(0)

Do mesmo jeito, há uma forma de informar o sistema operacional que ocorreu algum problema na execução do programa, como por exemplo quando o usuário digita um comando desconhecido. Para isso, passamos o valor -1 para a função `Exit`. Então a função `main` ficará assim:

    os.Exit(-1)

## **Fazendo requisições WEB**
Para fazer requisições web, existe um pacote especialista nisso, dentro do `net`, pacote de internet do Go, há o `http`, pacote responsável pelas requisições web.

Quando acessamos o site da Alura através do browser, obtemos uma resposta, que é carregada no navegador. A mesma coisa acontece quando carregamos o site através do Go, essa resposta vem através de um retorno da função `Get`, que iremos guardar na variável `resp`.
    
    import "net/http"
    func iniciarMonitoramento() {
        site := "https://www.alura.com.br"
        resp := http.Get(site)
    }

Ao salvar o arquivo, vemos que o Visual Studio Code aponta um erro, isso acontece porque a função `Get` retorna mais de um valor. Sim, existem funções no Go que retornam mais de um valor e a `Get` é uma delas, além da resposta, ela também retorna um possível erro que possa ter acontecido na requisição.

        resp, err := http.Get(site)

## **Funções com múltiplos retornos**
Para entendermos melhor a questão das funções que retornam mais de um valor, nada melhor do que aprendermos isso fazendo uma função desse tipo. Vamos criar a função `devolveNomeIdade`, que retorna um nome e uma idade, logo, `string` e `int`, respectivamente.

    func devolveNomeIdade() (string, int) {
        nome := "Pedro"
        idade := 19
        return nome, idade
    }

E como agora a função retorna dois valores, nós precisamos criar duas variáveis:

    nome, idade := devolveNomeIdade()

### **Ignorando algum retorno da função**
Isso é bem interessante no Go, e o mesmo ocorre com a função `Get`, ela retorna a resposta da requisição e um possível erro que possa ter ocorrido. Mas e se só estamos interessados em somente um dos retornos, como devemos fazer?

uando não queremos saber de um dos retornos, queremos ignorá-lo, nós utilizamos o operador de identificador em branco `(_)`:

    _, idade := devolveNomeEIdade()
    fmt.Println(idade)

Esse operador diz para o Go ignorar o retorno, no nosso caso, o primeiro deles, pois só estamos interessados no segundo retorno. Então, se não queremos algum retorno de uma determinada função, no momento em que formos declarar as variáveis, basta utilizar esse operador no seu lugar.

## **Monitorando o status code da response obtida na requisição**
Para saber o status da resposta, podemos acessar a sua propriedade `StatusCode`. 

    if resp.StatusCode == 200 {
        fmt.Println("Site:", site, "foi carregado com sucesso!")
    } else {
        fmt.Println("Site:", site, "está com problemas. Status Code:", resp.StatusCode)
    }

## **Colocando o programa em loop**
Em outras linguagens de programação, poderíamos utilizar o `while`, mas ele não existe no Go! Para isso, vamos utilizar a instrução `for`, sem passar nada para ela, pois assim ela ficará em loop eternamente:

    for {
        exibeMenu()
        comando := leComando()

        switch comando {
        case 1:
            iniciarMonitoramento()
        case 2:
            fmt.Println("Exibindo Logs...")
        case 0:
            fmt.Println("Saindo do programa")
            os.Exit(0)
        default:
            fmt.Println("Não conheço este comando")
            os.Exit(-1)
        }

## **Arrays em go**
Primeiramente, vamos criar um array com a estrutura clássica, com o `var`. Para isso, além do `var`, nós devemos informar o nome do array, colchetes e o tipo de dados que ele guardará. Além disso, dentro dos colchetes, devemos informar o tamanho do array.
Para colocar um valor no array, não há mistério, basta atribuir um valor a algum dos seus índices.

    var sites [4]string
    sites[0] = "https://random-status-code.herokuapp.com/"
    sites[1] = "https://www.alura.com.br"
    sites[2] = "https://www.caelum.com.br"

É importante nos atentar ao tipo de dados do array, não há espaço entre ele e os colchetes, na hora da declaração do array.

Mas o fato do array ter um tamanho fixo, nos limita um pouco, pois se quisermos adicionar 5 itens no array, teremos que alterar o seu tamanho na sua declaração. Por isso, em Go, geralmente não trabalhamos com arrays, e sim com uma outra estrutura de dados, chamada `slice`, que funciona em cima do array, mas não tem tamanho fixo.

## **Slices**
Para entendermos como funciona os `slices`, essas abstrações do array em Go, vamos criar um, para aprendermos fazendo.

A primeira grande vantagem dele, é que, como foi falado no vídeo anterior, seu tamanho não é fixo, é dinâmico, indeterminado.

Para criar um slice, podemos utilizar a declaração curta de variáveis. Sua declaração é bem parecida com a de um array. Além disso, já na sua declaração, podemos preencher os seus dados, passando-os dentro de chaves, separados por vírgula.

    func exibeNomes() {
        nomes := []string{"Douglas", "Daniel", "Bernardo"}
    }

Podemos adicionar itens no slice, através da função `append`, que recebe o slice e o item a ser adicionado.

     nomes = append(nomes, "Aparecida")

O slice infere o seu tamanho de acordo com a sua quantidade de elementos. Podemos verificar isso imprimindo a quantidade de itens contidos nele, através da função `len`, e a capacidade através da função `cap`.

    fmt.Println("O meu slice tem", len(nomes), "itens")
    fmt.Println("O meu slice tem capacidade para", cap(nomes), "itens")

## **A instrução for**
 Como no Go não existe outra estrutura de repetição além do `for`, então vamos utilizá-lo para percorrer os itens do slice de sites.

Vimos o `for` infinito, que faz com o que o código seja repetido para sempre, mas também podemos utilizar o `for` "tradicional", onde declaramos uma variável e vamos incrementado-a até o tamanho de itens do slice, por exemplo:

    sites := []string{"https://random-status-code.herokuapp.com/", 
        "https://www.alura.com.br", "https://www.caelum.com.br"}

    for i := 0; i < len(sites); i++ {
        fmt.Println(sites[i])
    }

Mas há uma forma mais enxuta de fazer isso nem Go, utilizando o `range`. Ela é como se fosse um operador de iteração do Go, nos dando acesso a cada item do array, ou do slice, e ele nos retorna dos valores, a posição do item iterado e o próprio item daquela posição.

    for i, site := range sites {
        fmt.Println("Estou passando na posição", i,
            "do meu slice e essa posição tem o site", site)
    }

## **A função sleep**
Por diversas razões, podemos querer que nosso script espere um pouco para a execução do próximo trecho de código. 
Fazemos isso utilizando a função `Sleep`, do pacote `time`, passando para ela o quanto de tempo queremos esperar. Representamos o tempo através de constantes da própria biblioteca, como `Second`, `Minute`, entre outras.

    time.Sleep(5 * time.Minute)

## **Criando constantes**
As constantes em Go, como em qualquer outra linguagem de programação, são variáveis constantes definidas no escopo geral da classe, que não podem ter seus valores alterados durante a execução do script. 

Para cria as constantes, basta defini-las abaixo dos imports.

    const monitoramentos = 3
    const delay = 5

## **Abrindo um arquivo**
Para abrir um arquivo em Go, precisamos pedir ao sistema operacional que abra o arquivo para nós. E quem é o representante do sistema operacional em Go? O pacote `os`, que já trabalhamos anteriormente. Nele, há a função `Open`, que abre o arquivo e nos retorna a sua representação em memória e um possível erro que possa ocorrer.

    arquivo, _ := os.Open("sites.txt")

## **Tratamento de erros**
Para tratar os erros, primeiramente devemos substituir o operador de identificador em branco (`_`) pela variável `err`, padrão para os erros em Go. E agora, se err não for nulo, significa que houve um erro, então vamos imprimi-lo.

     arquivo, err := os.Open("sites.txt")

    if err != nil {
        fmt.Println("Ocorreu um erro:", err)
    }

Notemos que em Go, identificamos se uma variável é `null` através do `nil`.

## **Lendo dados de um arquivo**
Através do pacote `io/ioutil`, chamamos a função `ReadFile`, para ler o arquivo passado.
Essa função nos retorna o arquivo em um array de bytes, então basta convertê-los para uma string através da função `string`.

    arquivo, err := ioutil.ReadFile("sites.txt")

    fmt.Println(string(arquivo))

Ao executar o programa, vemos o conteúdo do arquivo sendo impresso no console! Mas esse é um jeito bom para quem quer exibir o conteúdo todo do arquivo, o que não é muito útil para nós, já que queremos ler cada site de uma vez, para salvar cada um dentro do slice.

### **Lendo a primeira linha do arquivo**
Para ler o arquivo linha a linha, vamos ver uma terceira forma de ler arquivos em Go, utilizando o pacote `bufio`. Para isso, vamos voltar à primeira leitura do arquivo, utilizando `os.Open`.

E com o `bufio`, nós criamos um leitor através da função `NewReader`, que recebe o arquivo a ser lido.

Com esse leitor, temos funções que nos ajudam a ler o arquivo, lendo linha a linha, como por exemplo a `ReadString`, que lê uma linha do arquivo e nos retorna em forma de string. Essa função deve receber um byte delimitador, para saber até onde queremos ler a linha.

No nosso caso, queremos ler a linha inteiro, ou seja, até a quebra de linha, que é representada pelo `\n`. Como queremos representar um byte, utilizaremos aspas simples.

    arquivo, err := os.Open("sites.txt")
    leitor := bufio.NewReader(arquivo)
    linha, err := leitor.ReadString('\n')

    fmt.Println(linha)

### **Lendo múltiplas linhas**
Se queremos que o nosso programa leia além da primeira linha do arquivo, o código responsável por fazer a leitura deve ser executado mais de uma vez. Então, o que vamos fazer é colocar esse código dentro de um `for`, até dar um erro específico, o erro de `EOF` **(End Of File)**, que acontece quando não há mais linha a serem lidas.

Mas como saímos do `for`? Se houver o erro, que já estamos verificando, nós damos um `break`, que faz com que o código saia do loop.

    arquivo, err := os.Open("sites.txt")
    leitor := bufio.NewReader(arquivo)

    for {
        linha, err := leitor.ReadString('\n')
        fmt.Println(linha)
        if err == io.EOF {
            break
        }
    }

## **Fechando um arquivo**
Por último, devemos ser educados com o sistema operacional, se abrimos um arquivo com `os.Open`, após lê-lo, é uma boa prática fechá-lo com a função `Close`.

    arquivo.Close()

## **Limpando strings**
Algumas vezes, nós vamos querer ler strings limpas, sem espaços em branco, quebras de linha e afins.

Para isso, existe a função `TrimSpace`, do pacotes `strings`, que remove as quebras de linha e espaços ao final de uma string.

    linha = strings.TrimSpace(linha)

## **Criando um arquivo**
Para o Go criar um arquivo, podemos utilizar a função `OpenFile`, também do pacote `os`. Ela recebe o nome do arquivo, uma flag para representar o que fazer com o arquivo, e o seu tipo de permissão. Há diversas flags* que podemos utilizar, elas podem ser vistas [aqui](https://pkg.go.dev/os#pkg-constants).

No nosso caso, se o arquivo não existir, queremos criá-lo, então vamos utilizar a flag `O_CREATE` ou `O_RDWR`, para ler e escrever no arquivo. Além disso, vamos dar a permissão `0666` para ele.


    func registraLog(site string, status bool) {

        arquivo, err := os.OpenFile("log.txt", os.O_CREATE|os.O_RDWR, 0666)

        if err != nil {
            fmt.Println("Ocorreu um erro:", err)
        }

        fmt.Println(arquivo)
    }

## **Escrevendo no arquivo**
Para escrever no arquivo, ele possui a função `WriteString`, ou seja, basta passar o texto para essa função, que ela o escreve dentro do arquivo.

    func registraLog(site string, status bool) {

    arquivo, err := os.OpenFile("log.txt", os.O_CREATE|os.O_RDWR, 0666)

    if err != nil {
        fmt.Println("Ocorreu um erro:", err)
    }

    arquivo.WriteString(site + " - online: " + status + "\n")

    arquivo.Close()
    }

Mas o Go irá reclamar, isso acontece pois a função `WriteString` recebe uma string, e nós estamos tentando concatenar com um booleano, então precisamos convertê-lo com a função strings. Para converter um tipo booleano em uma string, vamos utilizar o pacote `strconv`, que possui a função `FormatBool`.

    arquivo.WriteString(site + " - online: " + strconv.FormatBool(status) + "\n")

Ao iniciar o monitoramento e ficar verificando o arquivo de logs, vemos que as linhas são sobrescritas a cada site novo monitorado. Isso acontece porque por padrão, quando escrevemos em um arquivo, é sempre escrito do seu começo. Para isso, na hora de abrir o arquivo, existe a flag `O_APPEND`, que faz com que o texto seja escrito ao final do arquivo.

    arquivo, err := os.OpenFile("log.txt", os.O_CREATE|os.O_RDWR|os.O_APPEND, 0666)

## **Formatando tempo**
Queremos imprimir a data no log no seguinte formato:

    05/06/2017 10:50:06 - https://www.alura.com.br - online: true

Para trabalhar com tempo em Go, vamos utilizar o já conhecido pacote `time`. Para pegar o tempo atual, ele possui a função `Now`, que nos retorna um objeto, portanto vamos formatá-lo, com a função `format`.

Para formatar a data, essa função utiliza diversas constantes, que podem ser consultadas no seu [código fonte](https://golang.org/src/time/format.go).

Como queremos representar dia, mês e ano no formato numérico, vamos utilizar o `stdZeroDay`, representado pelo `02`, `stdZeroMonth`, representado pelo `01` e `stdLongYear`, representado pelo `2006`.

Falta ajustar a hora, vamos utilizar o `stdHour`, representado pelo `15`, `stdZeroMinute`, representado pelo `04`, e `stdZeroSecond`, representado pelo `05`.

    arquivo.WriteString(time.Now().Format("02/01/2006 15:04:05") + " - " + site + 
        " - online: " + strconv.FormatBool(status) + "\n")
