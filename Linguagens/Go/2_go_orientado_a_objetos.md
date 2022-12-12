# **Go Orientado a Objetos**
## **Structs**
### **Definindo uma struct**
No Go, damos às classes o nome de `structs`, que devem ser definidas da seguinte maneira, por exemplo:

    type ContaCorrente struct {
        var titular       string
        var numeroAgencia int
        var numeroConta   int
        var saldo         float64
    }

Notemos que a palavra `var` não será necessária nesse contexto, pois não precisamos identificar que os campos são variáveis.

### **Instanciando uma struct**
Para instanciar uma classe, podemos faze-la de duas maneiras, preenchendo os valores da `struct` através de um "array associativo" ou através do preenchimento de todas as variáveis da `struct` em ordem.

    contaDoGuilherme := ContaCorrente{
        titular: "Guilherme",
        numeroAgencia: 589,
        numeroConta: 123456, 
        saldo: 125.5
    }

    ou

    contaDaBruna := ContaCorrente{"Bruna", 222, 111222, 200}

    ou

    contaDaClaudia := ContaCorrente{}
    contaDaClaudia.titular = "Cláudia"
    contaDaClaudia.numeroAgencia = 590
    contaDaClaudia.numeroConta = 123123
    contaDaClaudia.saldo = 1000

### **Inicialização zero e nil**
Mesmo não provendo nenhum valor, o Go garante inicializar todas as variáveis. Por exemplo, um bool não definido, vira false. Um int e um float não definidos, viram 0, uma string não definida, vira uma string vazia, e assim por diante.

Porém, em muitas linguagens existe uma maneira de denotar um ponteiro nulo que, essencialmente, não aponta para nenhum lugar. Por exemplo: em C é NULL, em Python é None e em java é null. Em Go, temos o `nil`.

#### **Nil e inferência**
Observe o seguinte exemplo:
    
    a := nil
    fmt.Println(a)
    
Será que vai compilar? Não, não vai. O compilador imprimirá o seguinte erro: use of untyped nil, que significa uso não tipado do nil.

Aqui estamos tentando atribuir um valor nil apontando para algum lugar sem fornecer seu tipo e esperamos que o compilador deduza isso. O compilador não sabe se esta variável é um inteiro, uma string, um array ou uma structure.

#### **Nil com um tipo definido**
Sabendo disso, observe o exemplo abaixo onde apontamos para um tipo definido:

    var s *string = nil
    fmt.Println(s)

Neste caso, o programa compila e retorna `<nil>` como esperado.

### **Comparando zero value**
Para finalizar, observe o seguinte programa, no qual criamos duas variáveis: uma `float64` e uma `int`, sem atribuir valor, e as comparamos:

    var f float64
    var i int 

    fmt.Println(f==i)

Recebemos uma mensagem com um erro informando que os tipos são incompatíveis. Não podemos comparar o valor atribuído pela inicialização zero se temos tipos diferentes. Portanto, por mais que o Go garanta a inicialização zero de diferentes tipos, devemos ficar atentos com os tipos que estamos trabalhando.

## **New e Ponteiros**
*Antes de mais nada: Encontrei esse [artigo](https://dev.to/wnqueiroz/drops-04-desmistificando-ponteiros-no-golang-3kj9) que explica muito melhor o que são ponteiros e endereços.*

Vimos duas formas de utilizar a struct, a primeira passando o campo e o valor que queremos armazenar dentro dessas variáveis e a segunda passando o conteúdo sem especificar os campos, desde que eles estejam na ordem em que foram declarados.

Porém, há mais uma forma de instanciar uma classe. Nosso primeiro passo será declarar uma variável chamada `contaDaCris`. Ela será do tipo `ContaCorrente`. Na linha seguinte, faremos `contaDaCris = new()`. A palavra `new` é bastante conhecida de quem já programa em Java ou C#. Dentro dos parênteses passaremos o tipo, que é `ContaCorrente`.

A partir de então, conseguiremos atribuir os valores acrescentando um ponto (`.`) após `contaDaCris` e o nome do campo na sequência. Então atribuiremos o valor desse campo.

    var contaDaCris ContaCorrente
    contaDaCris = new(ContaCorrente)
    contaDaCris.titular = "Cris"

    fmt.Println(contaDaCris)

Se tentarmos salvar esse código, aparecerá um erro, pois não podemos utilizar nosso tipo `ContaCorrente` já atribuindo um valor. Isso porque temos uma variável do tipo `ContaCorrente`, a `contaDaCris`. Mas o código não entendeu que o tipo da variável é o mesmo que está sendo passado para new(). Precisamos identificar que se tratam do mesmo tipo.

Para conseguir dizer que `contaDaCris` aponta para uma `ContaCorrente`, colocaremos um asterisco na frente. Teremos `var contaDaCris *ContaCorrente`.

Agora não teremos mais nenhum erro. Limparemos o terminal e vamos roda de novo. Veremos no terminal:

 > &{Cris 0 0 0}

Mas por que o "`&`" e por que temos que apontar para `ContaCorrente` com asterisco? Nas outras alternativas de uso da struct, o código entendia que que a conta corrente do cliente apontava para um tipo, uma estrutura de conta.

Então a `contaDaCris` precisa apontar para `ContaCorrente`. O código em Go não entenderá corretamente se tirarmos e asterisco e salvarmos a aplicação, pois ficará sem entender para onde `new` está apontando, se é a conta corrente da Cris ou uma nova conta. A partir do momento em que o ponteiro é colocado, é como se alocássemos um espaço e disséssemos que a caixa do correio aponta para um apartamento em particular.

A caixa de correio `contaDaCris` apontará para o apartamento `ContaCorrente` . Podemos criar cada um dos campos da conta corrente de Cris de acordo com a struct. Criaremos o saldo nesse momento, com `contadaCris.saldo = 500`.

O último detalhe será o "`&`" que aparece no terminal quando fazemos a impressão do que temos. Isso porque seguindo o mesmo raciocínio do nosso exemplo, `&{Cris 0 0 500}` indica que os campos são um conteúdo que está dentro do apartamento. Mas "`&`" não é interessante para nós, somente o conteúdo.

Por isso, colocaremos o asterisco em `contaDaCris` também na hora da impressão.

    fmt.Println(*contaDaCris)

## **Métodos**
Criaremos uma função que verificará se o valor que tentaremos sacar será menor do que o valor presente na conta. Vamos criá-la antes da `func main()`, logo após nossa struct. , chamaremos a função de `Sacar()` e ela receberá um valor. Nosso valor do saque deverá ser executado nos parênteses da função. Também especificaremos que ele será do tipo `float64`.

Depois dos parâmetros, retornaremos uma mensagem do tipo string nesse campo, informando se o saque foi realizado com sucesso ou não. Então criaremos uma variável para verificar se é possível sacar com `podeSacar :=`, pegaremos `valorDoSaque` e vamos comparar se ele é menor ou igual ao saldo de `contaDaSilvia`.

Podemos fazer `podeSacar := valorDoSaque <= contaDaSilvia.saldo`, porém nesse campo precisamos dizer qe quem tentará fazer o saque será a pessoa responsável pela conta. Nesse caso só temos `contaDaSilvia`, mas se tivermos que adicionar ainda outros clientes, teremos criado uma função que só funciona para `contaDaSilvia`. Queremos que sempre quando alguém tentar sacar, apontemos para a conta dessa pessoa, de forma semelhante ao que acontece com o this do Java ou o self do Python.

Para referenciarmos esse ponteiro no momento da criação do tipo, podemos colocar entre parênteses logo após `func` e antes de `Sacar()` a inscrição `(c *ContaCorrente)`, o que significa que quando a função for chamada, o código apontará para a conta que chama. Nesse caso, quando chamarmos a função, não precisaremos especificar que nos tratamos da conta de um cliente ou outro.

Nesse caso, se a conta que estiver chamando a função tiver saldo, será possível sacar. Criaremos uma condicional `if` para fazer a verificação. Poderemos sacar se for verdadeiro que `valorDoSaque` é menor do que `saldo`. Se podemos sacar colocaremos `c.saldo` no corpo do `if`. Podíamos escrever `conta.saldo`, se escrevêssemos `(conta *ContaCorrente)` , mas por uma questão da linguagem Go, sempre utilizamos a primeira letra do nome no nosso ponteiro dentro da função.

O `valorDoSaque` será o valor que passaremos para esse método. Assim, será possível remover o valor para sacar se ele for menor do que o `saldo`, e retornaremos uma mensagem do tipo string, entre aspas duplas, "Saque realizado com sucesso".

    func (c *ContaCorrente) Sacar(valorDoSaque float64) string {
        podeSacar := valorDoSaque <= c.saldo
        if podeSacar {
                c.saldo -= valorDoSaque
                return "Saque realizado com sucesso"
        } else {
            return "Saldo insuficiente"
        }
    }

### **Chamando um método**
Para chamarmos um método, basta colocar um `.` após a variável do tipo onde foi definido o método, e chama-lo passando seus parâmetros.

    fmt.Println(contaDaSilvia.Sacar(400))

### **Funções variádicas**
É possível que uma função receba um número indeterminado de parâmetros. Funções deste tipo são conhecidas em Go como `variadic functions`, ou função variádica.

Para criar uma `variadic function`, devemos preceder o tipo do argumento com reticências, conforme o exemplo abaixo:

    package main

    import (
        "fmt"
    )

    func Somando(numeros ...int) int {
        resultadoDaSoma := 0
        for _, numero := range numeros {
            resultadoDaSoma += numero
        }
        return resultadoDaSoma
    }

    func main() {
        fmt.Println(Somando(1))
        fmt.Println(Somando(1,1))
        fmt.Println(Somando(1,1,1))
        fmt.Println(Somando(1,1,2,4))
    }

### **Múltiplos retornos**
No Go, podemos criar uma função com múltiplos retornos.

Para isso, basta adicionarmos os tipos dos nossos retornos após os parâmetros da função, e passar dois itens no `return`. Depois, tratamos o recebimento desses retornos em variáveis distintas onde chamamos essa função.

    func (c *ContaCorrente) Depositar(valorDoDeposito float 64) (string,    float 64) {
        if valorDoDeposito > 0 {
            c.saldo += valordoDeposito
            return "Deposito realizado com sucesso", c.saldo
        } else { 
            retur "Valor do depósito menor que zero", c.saldo
        }
    }

    fmt.Println(contaDaSilvia.saldo) 
    status, valor := contaDaSilvia.Depositar(2000)
    fmt.Println(status, valor) 

## **Exemplo: Transferência entre contas**
Afim de sintetizar tudo o que foi visto até agora, anotarei aqui um método que vai fazer a transferência entre contas.

Criaremos um cenário na função `main()` com `contaDaSilvia` e `contaDoGustavo`. Elas serão do tipo `ContaCorrente`, os nomes dos titulares estarão entre aspas duplas e o saldo de "Silvia" será "300". O de "Gustavo", "100".

    contaDaSilvia := ContaCorrente{titular:"Silvia", saldo: 300}
    contaDoGustavo := ContaCorrente{titular:"Gustavo", saldo: 100}

Queremos possibilitar a transferência entre as duas contas Para isso, criaremos uma função chamada `Transferir()` e ela terá um parâmetro. Com base no que já fizemos, quando queríamos sacar, criamos a variável `valorDoSaque`. Para depositar, `valorDoDeposito`. Agora vamos gerar `valorDaTransferencia`, que será do tipo `float64`.

Para que uma transferência aconteça precisamos informar que estamos tirando o valor de uma conta e enviando para outra. Criaremos um tipo `contaDestino`. Na linguagem Go, nós especificamos os tipos dos nossos parâmetros. Pensando na struct que fizemos anteriormente, colocamos a palavra `type`. Assim, a própria `ContaCorrente` é um tipo.

Então, podemos dizer que a `contaDestino` é do tipo `ContaCorrente`. Além disso, criaremos um parâmetro `booleano` que servirá como retorno para essa função, dizendo se é verdadeiro ou falso.

Dentro do corpo da função, teremos que verificar se a conta a partir da qual faremos a transferência tem saldo. Se Silvia quiser transferir para Gustavo, por exemplo, precisaremos verificar se a conta dela tem saldo para isso. Colocaremos antes da função um ponteiro para a ContaCorrente que chamará essa função. Faremos um `if` colocando a condição de que se o `valorDaTransferencia` for menor do que o `saldo` da conta chamando, será possível fazer a transferência.

Primeiro será necessário remover dinheiro da conta que transferirá. Para isso, vamos tirar do `c.saldo` o `valorDaTransferencia`. Depois, vamos ter que enviar o dinheiro para a outra conta, o que será um processo semelhante ao de depositar. Assim, usaremos `Depositar` como um método para `contaDestino` receber o valor transferido.

Isso ainda não será suficiente, pois falta informar o retorno booleano. Portanto, se o procedimento acontecer, retornaremos true, ou seja, o retorno da transferência é verdadeiro. Caso não aconteça, faremos um else para retornar um false.

        func (c *ContaCorrente) Transferir(valorDaTransferencia float64, contaDestino ContaCorrente) bool {
        if valorDaTransferencia < c.saldo {
            c.saldo -= valorDaTransferencia 
            contaDestino.Depositar(valorDaTransferencia)
            return true
        } else {
            return false
        }
    }

Vamos salvar e aparentemente não há problemas, então vamos testar. Sabemos que o saldo de `contaDaSilvia` é "300" e de `contaDoGustavo` é "100". Para armazenar o resultado, criaremos uma variável chamada status e faremos a transferência a partir de `contaDaSilvia`. Colocaremos o valor "200" nos parâmetros de `Transferir()` , e no segundo parâmetro, o destino, `contaDoGustavo`.

Vamos executa o código e veremos no terminal que a transferência aconteceu. A conta da Silvia, anteriormente com saldo de "300", após tranferir "200" para Gustavo está com "100".

A conta do Gustavo tinha "100" de saldo. Silvia fez a transferência de "200" para a conta dele, mas ainda aparecerá no console que o saldo dele é "100". Ou seja, algo está errado. O que será que aconteceu?

O valor da conta da Silvia foi retirado, mas o conteúdo não entrou na conta de destino. O erro aconteceu porque fizemos referência para `contaDaSilvia`, apontamos para o conteúdo da conta que chama a função para alterar o conteúdo dela, mas não fizemos o mesmo para `contaDestino`.

Como queremos alterar o valor dessa conta também, colocamos um asterisco na frente dela nos parâmetros da função.

    func (c *ContaCorrente) Transferir(valorDaTransferencia float64, contaDestino *ContaCorrente) bool {
        if valorDaTransferencia < c.saldo {
            c.saldo -= valorDaTransferencia 
            contaDestino.Depositar(valorDaTransferencia)
            return true
        } else {
            return false
        }
    }

Porém, se salvarmos essa alteração, será apresentado um erro, e o alerta nos dirá que estamos apontando para um local desconhecido. Precisamos identificar `contaDoGustavo`. Conseguimos fazer isso colocando um "`&`" quando fizermos a transferência. Assim, dizemos que queremos transferir de fato para esse endereço além de termos apontado para a conta.

    status := contaDaSilvia.Transferir(200, &contaDoGustavo)

## **Pacotes e visibilidade**
Afim de segregar um pouco mais a responsabilidade do nosso código em arquivos, nós devemos criar nossos próprios `packages`. Então, seguindo os contexto dos exemplos acima, vamos criar um novo arquivo chamado `contaCorrente.go` e fazer um `package` para ele.

    package contas

    type ContaCorrente struct {
        titular       string
        numeroAgencia int
        numeroConta   int
        saldo         float64
    }

    func (c *ContaCorrente) Sacar(valorDoSaque float64) string {
        podeSacar := valorDoSaque > 0 && valorDoSaque <= c.saldo
        if podeSacar {
            c.saldo -= valorDoSaque
            return "Saque realizado com sucesso"
        } else {
            return "Saldo insuficiente"
        }
    }

    func (c *ContaCorrente) Depositar(valorDoDeposito float64) (string, float64) {
        if valorDoDeposito > 0 {
            c.saldo += valorDoDeposito
            return "Deposito realizado com sucesso", c.saldo
        } else {
            return "Valor do deposito menor que zero", c.saldo
        }
    }

    func (c *ContaCorrente) Tranferir(valorDaTransferencia float64, contaDestino *ContaCorrente) bool {
        if valorDaTransferencia < c.saldo && valorDaTransferencia > 0 {
            c.saldo -= valorDaTransferencia
            contaDestino.Depositar(valorDaTransferencia)
            return true
        } else {
            return false
        }
    }

Para referenciar esse pacote no nosso `main package`, basta incluir-lo no import informando o caminho para o arquivo.

    import ("contaCorrente")

Ao fazer isso, nossa IDE vai apontar um erro, pois ele não vai mais saber ou ser capaz de encontrar os métodos e propriedades das quais estávamos tratando no código. Para isso, devemos acessar os métodos das structs através de uma referência a esses pacotes.

    contaDaSilvia := contas.ContaCorrente{titular: "Silvia", saldo: 300}
    contaDoGustavo := contas.ContaCorrente{titular: "Gustavo", saldo: 100}

Porém, ao fazer isso, teremos outro erro sendo apontado. Nossa IDE vai alegar desconhecer as propriedades das quais estamos tentando manipular. Isso se deve por conta da visibilidade das propriedades do nosso struct, que podem ser definidas como públicas, privadas entre outras, como em qualquer outra linguagem de programação.

No momento, as propriedades da nossa struct se encontram privadas, isso porque quando nós as criamos, elas foram definidas com suas iniciais minúsculas, que é o que define se uma propriedade pode ou não ser acessada externamente. Para resolver isso, basta alterar os nomes das propriedades para ter sua primeira letra maiúscula.

    type ContaCorrente struct {
        Titular       string
        NumeroAgencia int
        NumeroConta   int
        Saldo         float64
    }

Agora, basta chamar tais propriedades com a letra maiúscula no nosso pacote principal e voila.

## **Getters**
Outra funcionalidade com a qual precisamos nos preocupar é que as pessoas que tem uma conta corrente devem poder ter acesso ao valor do saldo delas. Precisamos pensar numa forma de obter esse valor de saldo. Para resolver esse problema podemos criar outra função que aponta para a conta corrente que está chamando e aponta o valor do saldo dela.

Chamaremos a função de `ObterSaldo()` e ela apontará para a conta sendo invocada por meio de `(c *ContaCorrente)` vindo antes da função. Retornaremos um valor `float64` . Dentro do corpo da função o return será `c.saldo`, ou seja, visualizaremos o saldo da conta que chamou a função.

    func (c *ContaCorrente) ObterSaldo() float64 {
        return c.saldo
    }

Salvaremos e agora vamos para a função `main()` para visualizar apenas o valor do saldo. Vamos passar a função para obter o saldo na impressão.

    func main() (
        contaExemplo := contas.ContaCorrente{}
        contaExemplo.Depositar(100)

        fmt.Println(contaExemplo.ObterSaldo())
    }

## **Passando um valor ou cópia**
Métodos são definidos de maneira parecida com funções, mas de uma maneira diferente. Existe um `(p *Pessoa)` que se refere a um ponteiro para a instância criada da estrutura, conforme o exemplo abaixo:

    package main

    import (
        "fmt"
    )

    type Pessoa struct {
        nome, sobrenome string
    }

    func (p *Pessoa) ExibirNomeCompleto() string {
        nomeCompleto := p.nome + " " + p.sobrenome
        return nomeCompleto
    }

    func main() {
        p1 := Pessoa{"Guilherme", "Lima"}
        fmt.Println(p1.ExibirNomeCompleto())
    }

Ao executar este código, temos a saída esperada, pois nesse caso, passamos para o método o valor encontrado neste ponteiro através do `(p *Pessoa)`.

> Guilherme Lima

### **Passando uma cópia**
Também é possível passar um valor removendo a assinatura do ponteiro `(p *Pessoa)` para `(p Pessoa)`.

Nesse caso, uma cópia do valor de Pessoa é passada para a função, sem alterar o valor do ponteiro. Portanto, precisamos ficar atentos, já que qualquer alteração que você faça em `p` se passar por valor não será refletida na fonte `p`.

Observe este exemplo:

    package main

    import (
        "fmt"
    )

    type Pessoa struct {
        nome, sobrenome string
    }

    func (p Pessoa) ExibirNomeCompleto() string {
        p.sobrenome = "Silva"
        nomeCompleto := p.nome + " " + p.sobrenome
        return nomeCompleto
    }

    func main() {
        p1 := Pessoa{"Guilherme", "Lima"}

        fmt.Println(p1.ExibirNomeCompleto())
        fmt.Println(p1.nome, p1.sobrenome)
}

Nossa saída será:

>Guilherme Silva

>Guilherme Lima

Observe que alteramos o sobrenome de `p` no método `ExibirNomeCompleto`, mas não foi alterado o valor armazenado no ponteiro. Sendo assim, quando não precisamos alterar o conteúdo de um ponteiro, podemos passar apenas uma cópia.


## **Interfaces**
*Antes de mais nada: encontrei um [vídeo no youtube](https://www.youtube.com/watch?v=iY2xSN2_OlA) explicando muito bem como utilizar interfaces em Go.*

Criar uma interface em Go é muito simples. Não cabe a mim entrar no mérito de explicar o que é uma interface, tendo em vista que estou partindo do pressuposto de que você já seja introduzido à OO.

    type UsersInterface interface {
        Show() string
    }

    type User struct {
        name     string
        username string
        online   bool
    }

    type Admin struct {
        User
        age int
    }

    func (u User) Show() string {
        return fmt.Sprintf("Hello, my name is %s, and my username is %s.", u.name, u.username)
    }

    func (u Admin) Show() string {
        return fmt.Sprintf("Hello, my name is %s, and my username is %s. I`m a Adm!!!", u.name, u.username)
    }

    func ShowUserInfo(u UsersInterface) {
        fmt.Println(u.Show())
    }

    func main() {
        u := User{
            "Eliseu",
            "zeucxb",
            true,
        }

        adm := Admin{
            User{
                "Roberto",
                "ro<3",
                true,
            },
            19,
        }

        ShowUserInfo(u)
        ShowUserInfo(adm)
    }