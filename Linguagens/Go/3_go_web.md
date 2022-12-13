# **Aplicações WEB com Go**
Antes de mais nada: Por eu vir da WEB (PHP), vou me abster de explicar alguns conceitos da WEB como roteamento, servidores http, páginas HTML entre outros.

## **Subindo um servidor**
Para subirmos um servidor em Go, basta que chamemos dentro da função main uma função que seja responsável por ouvir e responder requisições. Essa função é a função `ListenAndServe` do pacote `Http`, que recebe como parâmetros a porta do servidor e o handler (Geralmente nil)

    http.ListenAndServe(":8000", nil)


## **Devolvendo uma view**
Para que possamos de fato devolver uma página web por exemplo, criaremos uma pasta template no nosso projeto, contendo todas as nossas páginas html, e em seguida, criamos uma variável temp no nosso main.go que será capaz de elencar nossas views da seguinte maneira:

    var temp = template.Must(template.ParseGlob("templates/*.html"));

Agora, basta que adicionemos uma rota na nossa aplicação que referencie a um método capaz de executar nossa view (Previamente construída, não entrarei no mérito de falar sobre o frontend).

    func main(){
        http.HandleFunc("/", index)
        http.ListenAndServe(":8000", nil)
    }

    func index(w http.ResponseWriter, r *http.Request){
        temp.ExecuteTemplate(w, "index", nil)
    }

Por úlltimo, basta que adicionemos uma flag no nosso arquivo html para que possamos de fato elencar aquele arquivo como uma view, da seguinte maneira:

    {{define "index"}}
        Corpo HTML
    {{end}}

### **Passando e utilizando objetos na view**
Quando desejarmos renderizar em nossas views algum objeto de forma dinâmica, como por exemplo uma lista de produtos, basta que passemos o objeto como parâmetro na função `ExecuteTemplate`, e o chamemos na view, acessando suas propriedades através do `.Propriedade` (onde o "`.`" representa o objeto passado).

    	temp.ExecuteTemplate(w, "index", produtos)

        Na view:
        <tbody>
            {{range .}}
            <tr>
                <td>{{.Nome}}</td>
                <td>{{.Descricao}}</td>
                <td>{{.Preco}}</td>
                <td>{{.Quantidade}}</td>
            </tr>
            {{end}}
        </tbody>

### **Criando partials para suas views**
No Go, quando quisermos criar fatias de um template por exemplo e os incluir dentro de outra página web, basta que façamos o mesmo que já fizemos nos demais templates, definindo seu nome no topo, e fechando a tag ao final do aquivo. Assim, quando quisermos chamar uma fatia de um template em outro arquivo HTML, basta que usemos um `{{template "_fatia"}}`.

    Na fatia:

    {{define "_head"}}
        Corpo HTML
    {{end}}

    No arquivo onde queremos importar:

    {{template "_head"}}
### **Importando o Bootstrap**
Como nosso foco de longe não é frontend, importaremos o framework frontend bootstrap afim de facilitar nosso trabalho, dessa forma, nossa view ficará assim: 

        {{define "Index"}}
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
        <title>Alura loja</title>
    </head>
    <nav class="navbar navbar-light bg-light mb-4">
        <a class="navbar-brand" href="/">Alura Loja</a>
    </nav>

    <body>
        <div class="container">
            <section class="card">
                <div>
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Descrição</th>
                                <th>Preço</th>
                                <th>Quantidade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Camiseta</td>
                                <td>Bem bonita</td>
                                <td>29</td>
                                <td>10</td>
                            </tr>
                            <tr>
                                <td>Notebook</td>
                                <td>Muito rápido</td>
                                <td>1999</td>
                                <td>2</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

        </div>
    </body>

    </html>
    {{end}}


## **Conectando aplicação com banco de dados**
Antes de mais nada 1: Como não é o intuito desses estudos, vou me abster de ter que explicar sobre o banco de dados, queries entre outros.

Antes de mais nada 2: Encontrei no youtube [esse vídeo](https://www.youtube.com/watch?v=ngv64-mN1Hw) do HunCoding explicando como conectar a aplicação a um banco MySQL.

Para conectarmos nossa aplicação a um banco, vamos precisar importar o pacote `database/sql`, e um driver para o MySQL, no caso, o pacote [go-sql-driver/mysql](https://pkg.go.dev/github.com/go-sql-driver/mysql), que tem seu guia de uso na documentação, mas ainda assim eu explicarei o básico aqui.

Para termos uma instância global do banco, criaremos uma variável que aponta para um ponteiro de DB, e uma variável para os erros:

    db *sql.DB
	err error

Assim, para abrirmos uma conexão com o banco, basta usar a função `sql.Open()`, passando os dados da conexão da seguinte forma por exemplo:

    db, err = sql.Open("mysql", "user:senha@tcp(ip:porta)/banco")

### **Inserindo registros no banco**
Para que possamos inserir registros no banco, podemos criar por exemplo uma função `insertProduto` que armazenará um produto no banco, da seguinte maneira:

    func insertProduto(produto Produto) error{
        _, err := db.Exec(fmt.Sprintf("INSERT INTO produto (nome, descricao, preco, quantidade) VALUES ('%s','%s',%f,%d)", produto.Nome, produto.Descricao, produto.Preco, produto.Quantidade))

        if(err != nil){
            return err
        }

        fmt.Println("Produto cadastrado com sucesso.")

        return nil
    }

Explicando: Temos uma função `insertProduto` que recebe como parâmetro um produto, e devolve apenas erros.

Dentro dessa função, chamamos a função `db.Exec()`, que executa uma query no nosso banco.

Caso essa execução seja bem sucedida, retornaremos `nil`, afirmando que não houveram erros. Caso haja algum problema na execução do SQL, retornaremos a variável `err`, que deverá ser tratada onde chamamos a função `insertProduto`.

    if inserterror := insertProduto(produto); inserterror != nil {
		fmt.Println(inserterror)
		panic(err)
	}

### **Lendo registros do banco**
Para lermos os registros do banco, devemos usar a função `db.Query()`, que difere da função `db.Exec()` pois é a função que usaremos quando quisermos obter alguma resposta vinda do banco, diferente da `Exec` que só executa a query.

    res, err := db.Query("SELECT * FROM produto")

Feitos os tratamentos de erro rotineiros, vamos criar um array de produtos que será iterado a cada registro de produto encontrado na nessa query, e o retornaremos, deixando a função assim:

    func getProdutos() ([]*Produto, error){
        res, err := db.Query("SELECT * FROM produto")

        if err != nil {
            return nil, err
        }

        produtos := []*Produto{}
        for res.Next(){
            var produto Produto
            if err := res.Scan(&produto.Id ,&produto.Nome, &produto.Descricao, &produto.Preco, &produto.Quantidade); err != nil{
                return nil, err
            }

            produtos = append(produtos, &produto)
        }

        return produtos, nil
    }

No código acima, temos a função `.Next()`, que é responsável por percorrer os registros e pular para o próximo, e a função `.Scan()`, que é responsável por ler registro por registro, e atribuir seus valores a variáveis que usaremos para montar nosso objeto produto.


*Tudo aquilo o que foi visto durante o curso e a criação da plataforma Loja Go gira entorno disso, porém, com conceitos de modularização e arquitetura aplicados. Assim sendo, vou me abster de explicar tudo passo a passo, pois é apenas uma questão de lógica, e deixarei linkado [aqui](https://github.com/ropehapi/loja-go) um repositório com um projeto WEB completo para servir de referência.*